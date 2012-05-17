DecomposeNcdf = structure(function(
    ##title<< spectral decomposition o ftimeseries inside a ncdf file.
    ##description<< Wrapper function to automatically decompose gridded time series inside a ncdf file and save the results
    ##              to another ncdf file using SSA.
    file.name             ##<< character: name of the ncdf file to decompose. The file has to be in the current working directory!
    , borders.wl          ##<< list: borders of the different periodicity bands to extract. Units are
                          ##   sampling frequency of the series. In case of monthly data border.wl<- list(c(11, 13))
                          ##   would extract the annual cycle (period = 12). For details, see the documentation of FilterTSeriesSSA.
    , M = c()             ##<< SSA calculation parameter. Window length for time series embedding (can be different
                          ##   for each element in borders.wl): see the documentation of FilterTSeriesSSA.
    , harmonics = c()     ##<< SSA calculation parameter: Number of harmonics to be associated with each band. See the
                          ##   documentation of FilterTSeriesSSA!
    , n.comp = c()        ##<< SSA calculation parameter: see the documentation of FilterTSeriesSSA!
    , pad.series = c(0,0) ##<< SSA calculation parameter: see the documentation of FilterTSeriesSSA!
    , center.series = TRUE##<< SSA calculation parameter: see the documentation of FilterTSeriesSSA!
    , repeat.extr = rep(1,times=length(borders.wl))##<< SSA calculation parameter: see the documentation of FilterTSeriesSSA!
    , var.name = 'auto'   ##<< character string: name of the variable to fill. If set to 'auto' (default), the name
                          ##   is taken from the file as the variable with a different name than the dimensions. An
                          ##   error is produced here in cases where more than one such variables exist.
    , print.status = TRUE ##<< logical: whether to print status information during the process
    , calc.parallel = TRUE##<< logical: whether to use parallel computing. Needs package doMC or doSMP to process.
    , tresh.const = 1e-12 ##<< numeric: value below which abs(values) are assumed to be constant and excluded
                          ##   from the decomposition
    , package.parallel = 'doMC' ##<< character: one of 'doSMP' or 'doMC': package to use for linking foreach to
                          ##       the parallel computing backend. Preferably use doMC as the algorithm has been
                          ##  extensively tested with this package.!
    , max.cores = 16      ##<< integer: maximum number of cores to use.
    , check.files = TRUE
    , ...                 ##<< additional arguments transferred to FilterTSeriesSSA.
  )
  ##details<<

  ## This is a wrapper function to automatically load, decompose and save a ncdf file using Singular Spectrum Analysis
  ## (SSA). It facilitates parallel computing and uses the FilterTSeriesSSA() function. Refer to
  ## the documentation of FilterTSeriesSSA() for details of the calculations and the necessary parameters, especially
  ## for how to perform stepwise filtering.
  ##
  ##
  ## NCDF file specifications
  ##
  ## Due to (possible) limitations in file size the ncdf file can only contain one variable and the one dimensional
  ## coordinate variables. The file has to contain one time dimension called 'time'. This function will
  ## create a second ncdf file identical to the input file but with an additional dimension called 'spectral.bands'
  ## which contains the separated spectral bands. In general the data is internally split into
  ## individual time series along ALL dimensions other than time, e.g. a spatiotemporal data cube would be separated
  ## into individual time series along its longitude/latitude dimension . The individual series are  decomposed
  ## and finally combined, transposed and saved in the new file.
  ##
  ## The NCDF file may contain NaN values at
  ## grid locations where no data is available (e.g. ocean tiles) but individual time series from single "valid"
  ## grid points must not contain missing values.
  ## In other words, decomposition is only performed for series without missing values, results for non gap-free series
  ## will be missing_value the results file.
  ##
  ## The function has only been exhaustively tested with ncdf files with two spatial dimensions (e.g. latitude and
  ## longitude) and the time dimension. Even though it was programmed to be more flexible, its functionality can not
  ## be guaranteed under circumstances with more and/or different dimensions.
  ## Input NCDF files should be compatible with the Climate Forcasting (CF) 1.5 ncdf conventions. Several crucial
  ## attributes and dimension units are checked and an error is caused if the convention regarding these aspects is
  ## not followed. Examples are the attributes scale_factor, add_offset _FillValue and the units for the time dimension
  ##
  ## Parallel computing
  ##
  ## If calc.parallel == TRUE, single time series are decomposed with parallel computing. This requires
  ## the package doSMP or doMP, respectively,  (and their dependencies) to be installed on the computer.
  ## Parallelization with other packages is theoretically possible but not yet implemented. If
  ## multiple cores are not available, setting calc.parallel to FALSE will cause the process to be
  ## calculated sequential without these dependencies. The package foreach is needed in all cases.

  ##seealso<<
  ##\code{\link{new.SSA}}, \code{\link{FilterTSeriesSSA}}, \code{\link{gapfill.ncdf}}

  ##value<<
  ##Nothing is returned but a ncdf file with the results is written in the working directory.

  ##author<<
  ##Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    #load libraries
    if (print.status)
        cat(paste(Sys.time(), ' : Loading libraries. \n', sep=''))
    require(foreach)
    require(spectral.methods)
    require(RNetCDF)
    require(ncdf.tools)
    require(Rssa)
    require(abind)

    #check input
    if (missing(file.name) | missing(borders.wl))
        stop('file.name and borders.wl need to be supplied!')
    if (!file.exists(file.name))
        stop('Input ncdf file not found. Check name')
    if (check.files) {  
       check.passed = ncdf.check.file(file.name = file.name, dims = 'time', type = 'relaxed')
       if (!check.passed)
          stop('NCDF file not consistent with CF ncdf conventions!')
    }    
    if (!class(borders.wl) == 'list')
        stop('Wrong class for borders.wl! Needs to be a list!')
    file.con.orig <- open.nc(file.name)
    if (var.name == 'auto') {
        var.decomp.name <- setdiff(ncdf.get.varinfo(file.con.orig)$name,
                c(ncdf.get.diminfo(file.con.orig)$name,'doy','year','flag.orig'))
        vars.copy <- c()
        if (length(var.decomp.name) > 1)
            stop('More than one non-dimensional/coordinate variable available in file!')
    } else {
        var.decomp.name=var.name
        if (!is.element(var.name,ncdf.get.varinfo(file.con.orig)$name))
            stop('Specified variable name does not exist in ncdf file!')
        vars.noncopy <- c(var.decomp.name,ncdf.get.diminfo(file.con.orig)$name)
        vars.copy    <- setdiff(ncdf.get.varinfo(file.con.orig)$name,vars.noncopy)
    }
#    if(package.parallel=='doSMP')
#        stop('Please use doMC for parallel computing as doSMP is not yet functional/tested.')
    if (!(is.element('time', ncdf.get.diminfo(file.con.orig)$name)))
        stop(paste('File has no dimension called time (case sensitive)!'))

    #open ncdf files
    if (print.status)
        cat(paste(Sys.time(), ' : Creating ncdf file for results. \n', sep=''))
    file.name.copy  <- paste(sub('.nc$','',file.name), '_specdecomp.nc', sep='')
    file.con.copy   <- create.nc(file.name.copy)
    Sys.chmod(file.name.copy, mode = "0777")

    #set default parameters
    if (!calc.parallel)
        max.cores                 <- 1
    n.bands                       <- length(unlist(borders.wl))-length(borders.wl)
    n.steps                       <- length(borders.wl)
    n.timesteps                   <- dim.inq.nc(file.con.orig, 'time')$length
    if (length(M) == 0)
        M              <- rep(round(n.timesteps / 2,  digits = 0), times = n.steps)
    if (length(harmonics) == 0)
        harmonics      <- rep(8, times = n.steps)
    if (length(n.comp) == 0)
        n.comp         <- rep(50, times = n.steps)

    #determine call settings for SSA
    args.call                     <- list(...)
    args.call[['borders.wl']]     <- borders.wl
    args.call[['M']]              <- M
    args.call[['harmonics']]      <- harmonics
    args.call[['n.comp']]         <- n.comp
    args.call[['pad.series']]     <- pad.series
    args.call[['print.stat']]     <- FALSE
    args.call[['plot.spectra']]   <- FALSE
    args.call[['center.series']]  <- center.series
    args.call[['repeat.extr']]    <- repeat.extr
    dim.values                    <- 1:n.bands
    borders.low                   <- rapply(borders.wl, function(x){x[-length(x)]})
    borders.up                    <- rapply(borders.wl, function(x){x[-1]})
    dim.name                      <- 'spectral_bands'
    
    #prepare results file
    ncdf.add.dim(file.con.orig, file.con.copy, var.name=var.decomp.name,
                 dim.name, dim.values, length(dim.values), 0)
    var.def.nc(file.con.copy, 'borders.low', 'NC_DOUBLE',  'spectral_bands')
    var.def.nc(file.con.copy, 'borders.up', 'NC_DOUBLE', 'spectral_bands')
    var.put.nc(file.con.copy, 'borders.low', borders.low)
    var.put.nc(file.con.copy, 'borders.up', borders.up)
    att.put.nc(file.con.copy, 'borders.up', 'long_name', 'NC_CHAR',
               'upper period border of spectral band')
    att.put.nc(file.con.copy, 'borders.low', 'long_name', 'NC_CHAR',
               'lower period border of spectral band')
    att.put.nc(file.con.copy, 'borders.up', 'unit', 'NC_CHAR',
               '[timesteps]')
    att.put.nc(file.con.copy, 'borders.low', 'unit', 'NC_CHAR',
               '[timesteps]')
    if (length(vars.copy) > 0)
        for (var.copy.t in vars.copy)
            ncdf.var.copy(file.con.orig,file.con.copy,var.copy.t)
    n.dims            <- file.inq.nc(file.con.copy)$ndims
    close.nc(file.con.copy)
    dims.ids.data     <- var.inq.nc(file.con.orig, var.decomp.name)$dimids + 1   
    dims.info         <- ncdf.get.diminfo(file.con.orig)[dims.ids.data,]

    #prepare parallel iteration parameters
    dims.cycle.id     <- sort(setdiff(dims.ids.data, match('time', dims.info$name) ) - 1)
    dim.process.id    <- match('time', dims.info$name) - 1
    dims.cycle.n      <- length(dims.cycle.id)
    data.all          <- var.get.nc(file.con.orig, var.decomp.name)
    dims.cycle.length <- dim(data.all)[dims.cycle.id + 1]
    n.timesteps       <- dims.info[match('time', dims.info$name), 3]

    #determine slices to process
    if (print.status)
        cat(paste(Sys.time(), ' : Identifying valid cells ...\n', sep=''))

    amnt.na                     <- apply(data.all, MAR = dims.cycle.id + 1,
                                        function(x)sum(is.na(x)) / n.timesteps   )
    slices.empty                <- amnt.na == 1
    slices.valid                <- amnt.na == 0
    slices.gappy                <- !slices.empty & !slices.valid
    slices.constant             <- as.vector(apply(data.all, MAR = dims.cycle.id+1,
                                                function(x){length(unique(na.omit(x))) == 1}))
    if (sum(slices.constant)>0)
        warning(paste(sum(slices.constant),' constant slices were found. Spectral decomp. for these is ommited!', sep=''))

    if (sum(slices.gappy) > 0)
        warning(paste(sum(slices.gappy),' series with gaps were found. Spectral decomp. for these is not possible!',sep=''))
    slices.process              <- as.vector(slices.valid)
    if (sum(slices.process) == 0)
        stop(paste('No series/slices available for filling. Most probably only',
                   ' totally gappy and totally gap-free slices/series exist.', sep=''))


    #create 'iterator'
    args.expand.grid       <- alist()
    for (i in 1:dims.cycle.n)
        args.expand.grid[[i]] <- 1:dims.cycle.length[i]
    iter.grid.all          <- as.matrix(do.call("expand.grid", args.expand.grid))
    n.slices               <- dim(iter.grid.all)[1]
    n.iters                <- sum(slices.process)
    iter.grid              <- matrix(1, nrow = n.iters, ncol = length(dims.cycle.id) + 1)
    colnames(iter.grid)    <- c('iter.nr', dims.info$name[dims.cycle.id + 1])
    iter.grid[,'iter.nr']  <- 1:n.iters
    iter.grid[, dims.cycle.id + 2] <- iter.grid.all[slices.process, ]
    iters.per.cyc          <- rep(floor(n.iters/max.cores), times = max.cores)
    if (!(n.iters %% max.cores) == 0)
        iters.per.cyc[1:((n.iters %% max.cores))] <- floor(n.iters / max.cores) + 1
    iter.gridind           <- matrix(NA, ncol = 2, nrow = max.cores)
    colnames(iter.gridind) <- c('first.iter','last.iter')
    if (max.cores > 1)  {
        iter.gridind[, 1]  <- (cumsum(iters.per.cyc) + 1) - iters.per.cyc
        iter.gridind[, 2]  <- cumsum(iters.per.cyc)
    } else {
        iter.gridind[1, ]  <- c(1, n.iters)
    }

    #define process during iteration
    calcs.iter = function(iter.nr, file.name, n.timesteps, n.bands, dims.cycle.n,
                          iter.grid, args.call, var.decomp.name, dim.process.id, dims.cycle.id)
    {
        require(RNetCDF)
        #require(spectral.methods)
        #require(ncdf.tools)

        file.con.t                 <- open.nc(file.name)
        data.all.t                 <- var.get.nc(file.con.t, var.decomp.name)
        iter.ind                   <- iter.gridind[iter.nr, ]
        data.results.iter          <- array(NA,dim=c(n.timesteps, n.bands, diff(iter.ind) + 1))
        for (j in 1:(diff(iter.ind) + 1))
        {
            ind.total = (iter.ind[1]:iter.ind[2])[j]
            data.results.iter.t=try(
                    {
                        if (iter.nr == 1 &&( diff(iter.ind) < 20  || (j%%(ceiling((diff(iter.ind)) / 20)) == 0)))
                            if (print.status)
                                cat(paste(Sys.time(), ' : Finished ~', round(j / (diff(iter.ind) + 1) * 100), '%. \n', sep=''))
                        ind.extract <- list(data.all.t)
                        for (i in 1:length(dims.cycle.id))
                           ind.extract[[dims.cycle.id[i] + 2]] <- iter.grid[ind.total, i + 1]
                        ind.extract[[dim.process.id + 2]] <- TRUE
                        args.call.t             <- args.call
                        args.call.t[['series']] <- do.call('[', ind.extract)
                        series.decomp           <- do.call(FilterTSeriesSSA, args.call.t)
                        t(series.decomp$dec.series)
                    })
            if (class(data.results.iter.t) == 'try-error')
            {
                print(paste('Error occoured at iteration ', iter.nr, ' and loop ', j, '!', sep=''))
                error.from.calc                 <- data.results.iter.t
                trace.save                      <- traceback()
                error.from.calc                 <- data.results.iter.t

                data.results.iter.t             <- matrix(Inf, ncol=n.bands, nrow=n.timesteps)
                system.info=sessionInfo()
                file.name.t                      <- paste('workspace_error_', file.name, '_',iter.nr, '_', j, sep = '')
                print(paste('Saving workspace to file ', file.name.t, '.rda', sep = ''))
                dump.frames(to.file = TRUE, dumpto = file.name.t)
            }
            data.results.iter[,,j]  <- data.results.iter.t
        }
        close.nc(file.con.t)
        data.results.iter
    }

    abind.mod=function(...)abind(..., along=3)

    #prepare parallel backend
    if (calc.parallel)
        RegisterParallel(package.parallel, max.cores)

    #perform calculation
    if (print.status)
        cat(paste(Sys.time(), ' : Starting calculation: Decomposing ', sum(slices.process),
                  ' timeseries of length ', n.timesteps, '. \n', sep=''))
    if (calc.parallel) {
        data.results.valid.cells <- foreach(i = 1:max.cores
                                ,  .combine = abind.mod, .multicombine = TRUE) %dopar% calcs.iter(iter.nr = i,
                                                       file.name = file.name , n.timesteps = n.timesteps,
                                                       n.bands = n.bands, dims.cycle.n = dims.cycle.n,
                                                       iter.grid = iter.grid, args.call = args.call,
                                                       var.decomp.name = var.decomp.name,
                                                       dim.process.id = dim.process.id, dims.cycle.id = dims.cycle.id)
    } else {
        data.results.valid.cells <- foreach(i = 1:max.cores
                                ,  .combine = abind.mod,  .multicombine = TRUE) %do% calcs.iter(iter.nr = i,
                                                       file.name = file.name , n.timesteps = n.timesteps,
                                                       n.bands = n.bands, dims.cycle.n = dims.cycle.n,
                                                       iter.grid = iter.grid, args.call = args.call,
                                                       var.decomp.name = var.decomp.name, dim.process.id = dim.process.id,
                                                        dims.cycle.id = dims.cycle.id)
    }
    if (package.parallel=='doSMP')
        stopWorkers(w)

    
    #transpose results
    if (print.status)
        cat(paste(Sys.time(), ' : Transposing results. \n', sep=''))
    data.results.all.cells                     <- array(NA, dim=c(n.timesteps, n.bands, n.slices))
    data.results.all.cells[, , slices.process] <- data.results.valid.cells
    data.results.all.cells.trans               <- aperm(data.results.all.cells, perm=c(3, 1, 2))
    file.con.copy                              <- open.nc(file.name.copy, write=TRUE)
    data.results.final                         <- array(as.vector(data.results.all.cells.trans),
                                                        dim = c(dims.cycle.length, n.timesteps, n.bands))
    aperm.array                                <- c(order(c(dims.cycle.id, dim.process.id)), n.dims)
    data.results.final                         <- aperm(data.results.final, aperm.array)
    if (sum(slices.gappy) > 0) {
        ind.gappy                              <- ind.datacube(data.all, slices.gappy, dims.cycle.id + 1)
        data.results.final[ind.gappy]          <- data.all[ind.gappy]
    }

    #save results
    if(sum(is.infinite(data.results.final)) > 0)
        save.image(paste('workspace_before_writing_', file.name, '.RData', sep=''))
    if (print.status)
        cat(paste(Sys.time(), ' : Writing results to file. \n', sep=''))
    var.put.nc(file.con.copy, var.decomp.name, data.results.final)

    #add attributes with process information to ncdf files
    all.args     <- formals(FilterTSeriesSSA)
    all.args[match(names(args.call), names(all.args))] <- args.call
    red.args     <- all.args[c('borders.wl', 'M', 'n.comp', 'harmonics', 'tolerance.harmonics',
                        'var.thresh.ratio', 'grouping', 'pad.series', 'SSA.methods', 'repeat.extr')]
    string.args  <- paste(paste(names(red.args),sapply(red.args,function(x)paste(x,collapse=', '))
                                   ,sep=': '), collapse='; ')
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Decomposed_by', 'NC_CHAR', compile.sysinfo())
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Decomposed_on', 'NC_CHAR', as.character(Sys.time()))
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Decomposition_settings', 'NC_CHAR', string.args)
    hist.string.append <- paste('Spectrally decomposed on ',as.character(Sys.time()),
                                ' by ',Sys.info()['user'],sep='')
    if (is.element('history',ncdf.get.attinfo(file.con.copy,'NC_GLOBAL')[,'name'])) {
        hist.string <- paste(att.get.nc(file.con.copy,'NC_GLOBAL','history'),'; ',hist.string.append)
        att.put.nc(file.con.copy,'NC_GLOBAL','history','NC_CHAR',hist.string)
    } else {
        att.put.nc(file.con.copy,'NC_GLOBAL','history','NC_CHAR',hist.string.append)
    }
    close.nc(file.con.copy)
    close.nc(file.con.orig)
    if (print.status)
        cat(paste(Sys.time(), ' : Calculation successfully finished. \n', sep=''))
    return(NULL)
}
, ex = function(){
  ## Example for the filtering of monthly data
  setwd('<path to input file>')
   filename   <- '<filename>.nc'
  # Extract yearly cycle, intra annual part and high frequency residual in several steps
  borders.wl <- list(a = c(10, 14)
                     , b = c(12, Inf)
                     , c = c(0, 12))
  M         <- c(2*12, 4*12, 12)
  #extract first for harmonics for yearly cycle
  harmonics <- c(4, 0, 0)
  decompose.ncdf(file.name = filename, borders.wl = borders.wl, M = M, harmonics = harmonics)

  # Extract yearly cycle, intra annual part and high frequency residual in one step
  borders.wl <- list(c(0,10,14,Inf))
  # use the same M for all bands
  M          <- c(2*12)
  decompose.ncdf(file.name = filename, borders.wl = borders.wl, M = M)
})
