GapfillNcdf <- structure(function(
##title<< fill gaps in time series or spatial fields inside a ncdf file using SSA.
##description<< Wrapper function to automatically fill gaps in series or spatial fields inside a ncdf file and save the results
##              to another ncdf file.
amnt.artgaps = rep(list(   rep(list(c(0.05, 0.05)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of numeric vectors: the relative ratio (length gaps/series length) of
                      ##             artificial gaps to include in the "innermost" SSA loop (e.g. the value used by the
                      ##             SSA run for each indivuidual series/slice). These ratio is used to determine 
                      ##             the iteration with the best prediction (c(ratio big gaps, ratio small gaps)) (see ?GapfillSSA for details )                                  
, amnt.iters = rep(list(   rep(list(c(10, 10)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors: amount of iterations performed for the outer and inner
                      ##             loop (c(outer,inner)) (see ?GapfillSSA for details)
, amnt.iters.start = rep(list(   rep(list(c(1, 1)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors: index of the iteration to start with (outer, inner). If this
                      ##             value is >1, the reconstruction (!) part is started with this iteration. Currently
                      ##             it is only possible to set this to values >1 if amnt.artgaps and size.biggap == 0.
, calc.parallel = TRUE##<< logical: whether to use parallel computing. Needs packages doMC, foreach or doSMP (and
                      ##             their dependencies) to be installed.                                  
, debugging = FALSE   ##<< logical: if set to TRUE, debugging workspaces or dumpframes are saved at several stages
                      ##            in case of an error.                                  
, dimensions = list(list('time'))
                      ##<< list of string vectors: setting along which dimensions to perform SSA. These names
                      ##             have to be identical to the names of the dimensions in the ncdf file. Set this to
                      ##             'time' to do only temporal gap filling or to (for example) c('latitude','longitude')
                      ##             to do 2 dimensional spatial gap filling. See the description for details on how to
                      ##             perform spatio-temporal gap filling.
, file.name           ##<< character: name of the ncdf file to decompose.  The file has to be in the current working directory!                     
, first.guess = 'mean'##<< character string: if 'mean', standard SSA procedure is followed (using zero as the first guess). 
                      ##             Otherwise this is the file name of a ncdf file with the same dimensions
                      ##             (with identical size!) as the file to fill which contains values used as a
                      ##             first guess (for the first step of the process!). This name need to be exactly
                      ##             "<filename>_first_guess_step_1.nc".                                  
, force.all.dims = FALSE ##<< logical: if this is set to true, results from dimensions not chosen as the best guess are used
                      ##             to fill gaps that could not be filled by the buest guess dimensions due to too gappy slices etc. .                                  
, gaps.cv = 0         ##<< numeric: ratio (between 0 and 1) of artificial gaps to be included prior to the first
                      ##             cross validation loop that are used for cross validation.
, keep.steps = TRUE   ##<< logical: whether to keep the files with the results from the single steps                                                        
, M                   ##<< list of single integers: window length  or embedding dimension in time steps. If not
                      ##             given,  a default value of 0.5*length(time series) is computed.                                                               
, max.cores = 8       ##<< integer: maximum number of cores to use (if calc.parallel = TRUE).                                  
, max.steps = 10      ##<< integer: maximum aount of steps in the variances scheme                                 
, MSSA =  rep(list(   rep(list(FALSE), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of logicals: Whether to perform MSSA for this dimension (see description 
                      ##             for details). Has to have the sam ind.extr e structure as dimensions.
, MSSA.blck.trsh = tresh.fill[[1]][[1]]
                      ##<< numeric: ratio (0-1) of gaps that a MSSA block may contain to be filled.                                   
, MSSA.blocksize = 1  ##<< integer: size of the quadratical block used for MSSA.  
, n.comp = lapply(amnt.iters, FUN = function(x)x[[1]][[1]][1] * 2)
                      ##<< list of single integers: amount of eigentriples to extract (default (if no values are
                      ##             supplied) is 2*amnt.iters[1] (see ?GapfillSSA for details)
, ocean.mask = c()    ##<< logical matrix: contains TRUE for every ocean grid cell and FALSE for land cells. Ocean grid
                      ##             cells will be set to missing after spatial SSA and will be excluded from temporal SSA.
                      ##             The matrix needs to have dimensions identical in order and size to the spatial dimensions
                      ##             in the ncdf file. As an alternative to a R matrix, the name of a ncdf file can be supplied.
                      ##             It should only contain one non coordinate variable with 1 at ocean cells and 0 at land cells.
, package.parallel = 'doMC'
                      ## character: package to use for linking foreach to the parallel computing backend. Only doMC
                      ##            has been rigorously tested!
, pad.series = rep(list(   rep(list(c(0, 0)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors (of size 2): length of the extracts from series to use for
                      ##             padding. Only possible in the one dimensional case. See the documentation of GapfillSSA for details!
, print.status = TRUE ##<< logical: whether to print status information during the process                                  
, process.cells = c('gappy','all')[1]
                      ##<< character string: which grid/series to process. 'gappy' means that only series grids with actual
                      ##             gaps will be processed, 'all' would result in also non gappy grids to be subjected to SSA. The
                      ##             first option results in faster computation times as reconstructions for non gappy grids/series
                      ##             are technically not needed for gap filling, whereas the second option provides a better
                      ##             understanding of the results trajectory to the final results.                                  
, process.type = c('stepwise', 'variances')[1]
, ratio.const = 0.05  ##<< numeric: max ratio of the time series that is allowed to be above tresh.const for the time series
                      ##             still to be not cosidered constant.                                 
, ratio.test = 1      ##<< numeric: ratio (0-1) of the data that should be used in the cross validation step. If set to 1,
                      ##             all data is used.
, reproducible = FALSE##<< logical: Whether a seed based on the characters of the file name should be set
                      ##            which forces all random steps, including the nutrlan SSA algorithm to be
                      ##            exactly reproducible.
, size.biggap = rep(list(   rep(list(20) , times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of single integers: length of the big artificial gaps (in time steps) (see ?GapfillSSA for details)
, tresh.const = 1e-12 ##<< numeric: value below which abs(values) are assumed to be constant and excluded
                      ##             from the decomposition                                  
, tresh.fill = c(list(list(0.1)), rep(list(list(0,0)), length(dimensions) - 1))
                      ##<< list of numeric fractions (0-1): This value determines the fraction of valid values below which
                      ##             series/grids will not be filled in this step and are filled with the first guess from the
                      ##             previous step (if any). For filling global maps while using a ocean.mask you need
                      ##             to set this value relative to the global grid size (and not only the land mask). Setting this
                      ##             value to zero would mean that also slices/series without any "real" values are tried to
                      ##             be filled with the "first guess" value of the last iteration alone. This can only be done
                      ##             if the cross validation scheme is switched off (e.g. by setting amnt.artgaps and size.biggap
                      ##             to zero
, tresh.fill.first = list(tresh.fill[[1]])    ##<< single numeric value between 0 and 1 indicating a different treshold for the
                      ##             run when no first guess values from previous runs are available. As this can be specified anyway
                      ##             in the 'stepwise' sheme, supplying this value is only reasonable in the 'variances' sheme.
, var.names = 'auto'  ##<< character string: name of the variable to fill. If set to 'auto' (default), the name
                      ##             is taken from the file as the variable with a different name than the dimensions. An
                      ##             error is produced here in cases where more than one such variable exists.
, ...                 ##<< further settings to be passed to GapfillSSA
)
##details<<
## This is a wrapper function to automatically load, gapfill and save a ncdf file using SSA. It facilitates
## parallel computing and uses the GapfillSSA() function from the package spectral.methods. Refer to
## the documentation of GapfillSSA() for details of the calculations and the necessary parameters.
##
##
## dimensions
##
## It is generally possible to perform one or two dimensional SSA for gap filling. The GapfillSSA
## algorithm automatically determines the right mode depending on whether a vector or a matrix is supplied.
## In this function 'dimensions' is used to determine this. If only one dimension name is supplied, only
## vectors in the direction of this dimension are extracted and filled. If two dimension names are supplied,
## spatial grid/matrices along these dimension are extracted and SSA is computed two dimensionally.
## The vectors/matrices are automatically distributed evenly amongst all cores (if calc.parallel==TRUE) amongst
## the remaining dimensions in the ncdf file. The input ncdf file has to contain a maximum of 3 dimensions.
##
##
## stepwise calculation
##
## The algorithm can be run step wise with different settings for each step where the results from each
## step can be used as 'first guesses' for the subsequent step. To do this, amnt.artgaps, size.biggap, amnt.iters,
## n.comp, M, tresh.fill and dimensions have to be lists with their respective values for each step as their elements.
## One example for such an application would be spatio-temporal gap filling, where spatial SSA is used first
## and the results are then used as first guesses in the gap places for a subsequent temporal gap filling. For such
## a procedure dimensions has to be: list(a=c('longitude','latitude'),'time')).
##
##
## NCDF file specifications
##
## Due to limitations in the file size the ncdf file can only contain one variable (and the dimensional
## coordinate variables) (for the time beeing). This function will
## create a second ncdf file identical to the input file but with an additional variable called 'flag.orig',
## which contains zero for . In general the file is internally split into
## individual time series or grids along ALL dimensions other than those specified in 'dimensions'.
## These are individually filled and finally combined, transposed and saved in the new file.
##
## The NCDF file may contain NaN values at grid locations where no data is available (e.g. ocean tiles).
## These grid cells are excluded from the calculation prior to gap filling. To distinguish "valid" grid
## cells from empty cells, values from all grid cells for the first time step are extracted and slices
## with missing values are excluded from the analysis.
##
## The function has only been tested with ncdf files with two spatial dimensions (e.g. lat and long) and
## one time dimension. Even though it was programmed to be more flexible, its functionality can not
## be guaranteed under circumstances with more dimensions.
##
## Parallel computing
##
## If calc.parallel==TRUE, single time series are filled with parallel computing. This requires
## the package doSMP or doMP, respectively,  (and their dependencies) to be installed on the computer.
## Parallelization with other packages is theoretically possible but not yet implemented. If
## multiple cores are not available, setting calc.parallel to FALSE will cause the process to be
## calculated sequential without these dependencies. The package foreach is needed in all cases.

##seealso<<
##\code{\link{ssa}}, \code{\link{GapfillSSA}}, \code{\link{DecomposeNcdf}}
##value<<
##Nothing is returned but a ncdf file with the results is written.
{
    ##TODO extract iloop convergence information for all loops
    ##TODO test inner loop convergence scheme for scenarios 
    ##TODO indicate fraction of gaps for each time series
    ##TODO break down world into blocks
    ##TODO integrate onlytime into one dimensional variances scheme
    ##TODO facilitate one step filling process with global RMSE calculation
    ##TODO save convergence information in ncdf files
    ##TODO check for too gappy series at single dimension setting
    ##TODO create possibilty for non convergence and indicate this in results
    ##TODO facilitate run without cross validation repetition
    ##TODO test stuff with different dimension orders in the file and in settings
    ##TODO substitute all length(processes)==2 tests with something more intuitive
    ##TODO put understandable documentation to if clauses
    ##TODO remove first guess stuff
    ##TODO incorporate non convergence information in final datacube
    ##TODO facilitate easy run of different settings (e.g. with different default settings)
    ##TODO switch off "force.all.dims" in case of non neccessity
     
    #save argument values of call
    args.call.filecheck <- as.list(environment())
    args.call.global    <- call.args2string()
    if (print.status & !interactive()) {
      print('Arguments supplied to function call:')
      cat(paste(paste(paste(names(args.call.filecheck), args.call.filecheck, sep=':'),
                      collapse = '; '), '\n\n'))
    }
    
    #set seed based on file name
    if (reproducible) {
       file.name.cl <-  gsub('[[:punct:]]', '', file.name)
       ind.rev      <-  round(seq(1, nchar(file.name.cl), length.out = 5),digits = 0)
       seed         <-  as.numeric(paste(match(unlist(strsplit(file.name.cl, ''))[ind.rev], 
                                   c(letters, LETTERS, 0:9)) , collapse = '' )   ) 
    } else {
      seed <- c()
    }

    #load libraries
    if (print.status)
        cat(paste(Sys.time(), ' : Loading libraries. \n', sep=''))
    require(foreach, warn.conflicts = FALSE, quietly = TRUE)
    require(spectral.methods, warn.conflicts = FALSE, quietly = TRUE)
    require(RNetCDF, warn.conflicts = FALSE, quietly = TRUE)
    require(ncdf.tools, warn.conflicts = FALSE, quietly = TRUE)
    require(Rssa, warn.conflicts = FALSE, quietly = TRUE)
    require(abind, warn.conflicts = FALSE, quietly = TRUE)
    require(raster, warn.conflicts = FALSE, quietly = TRUE)
    require(plyr, warn.conflicts = FALSE, quietly = TRUE)
    if (calc.parallel) {
      require(multicore, warn.conflicts = FALSE, quietly = TRUE)
    }     
    if (sum(!is.na(match(c('latitude', 'longitude', 'lat', 'long'), 
                         unlist(dimensions)))) > 0)
      library(raster, warn.conflicts = FALSE, quietly = TRUE)

    # necessary variables
    step.chosen           <- matrix(NA, 2, max.steps)
    dimnames(step.chosen) <- list(c('dim','step'), paste('step', 1:max.steps))
    if (process.type == 'variances') {
      n.steps             <- max.steps
      var.steps           <- array(NA, dim = c(max.steps, max(unlist(n.comp)), 
                                   length(dimensions[[1]])))
    } else {
      n.steps             <- length(dimensions)
      step.chosen[1, ]    <- 1
      step.chosen[2, ]    <- 1:n.steps
    }

    # debugging and information variables
    finished              <- FALSE
    iterpath              <- data.frame(time = Sys.time(), var.name = 'none',
                                        process = 'none', step = 0, calc.repeat = 0,
                                        dimensions = 0,  otherdim = NA)
    included.otherdim     <- rep(FALSE, n.steps)
    args2SSA              <- list()

    
    #check input, check first guess, transfer and check ocean mask
    res.check     <- do.call(CheckInputNcdfSSA,
                             c(SSAprocess = 'Gapfill', args.call.filecheck))
    ocean.mask    <- res.check$ocean.mask

    #open ncdf files and create step files
    if (var.names[1] == 'auto')
      var.names = ncdf.get.varname(file.name)
    res.open      <- GapfillNcdfOpenFiles(file.name = file.name, var.names = var.names,
                                          n.steps = n.steps, print.status = print.status)
    dims.info     <- res.open$dims.info
    file.name.copy<- res.open$file.name.copy
    file.con.orig <- open.nc(file.name)
    
    # start parallel processing workers
    if (calc.parallel)
        RegisterParallel(package.parallel, max.cores)
    if (gaps.cv != 0) {
      processes <- c('cv', 'final')
    } else if (gaps.cv == 0) {
      processes <- c('final') 
      art.gaps.values            <- NULL            
    }

    for (var.name in var.names) {
      datacube         <- var.get.nc(file.con.orig, var.name)
      if (sum(is.na(datacube)) == 0) {
        print(paste(var.name, 'does not contain gaps. Gap filling for this data omitted!'))
        next
      } 
      ind.artgaps.out  <- array(FALSE, dim = dim(datacube))

      status.report(paste('Filling variable ', var.name, sep = ''))
      for (process in processes) {
      # insert gaps for cross validation      
      if (process == 'cv') {
        if (print.status)
          cat(paste(Sys.time(), ' : Starting cross validation loop. \n', sep = ''))        
        indices.t                  <- sample(which(!is.na(datacube)),
            floor(gaps.cv * sum(!is.na(datacube))))
        ind.artgaps.out[indices.t] <- TRUE
        art.gaps.values            <- datacube[ind.artgaps.out]
        datacube[ind.artgaps.out]  <- NA
      } else if (process == 'final') {
        if (print.status)
          cat(paste(Sys.time(), ' : Starting final filling loop. \n', sep = ''))
        datacube[ind.artgaps.out]  <- art.gaps.values
        if (length(processes) == 2)
           n.steps  <- max(step.chosen['step',])
      }

      for (h in 1:n.steps) {
        if (print.status)
          cat(paste(Sys.time(), ' : Starting step ', h, '\n',sep = ''))
        ## determine different iteration control parameters
        if (process.type == 'stepwise') {
          ind                   <- h     
          n.dims.loop           <- length(dimensions[[ind]])
          n.calc.repeat         <- 1
          dims.calc             <- 1:n.dims.loop
          ratio.test.t          <- 1
        } else if (process.type == 'variances') {
          ind                   <- 1
          n.dims.loop           <- length(dimensions[[ind]])
          if (process == 'final') {
            if (force.all.dims) {
              dims.calc         <- 1:n.dims.loop
            } else if (!force.all.dims) {  
              if (length(processes) == 2) {
                dims.calc       <- step.chosen['dim', h]
              } else if (length(processes) == 1) {
                dims.calc       <- 1
              }
            }
            n.calc.repeat       <- 1
            ratio.test.t        <- 1
          } else if (process == 'cv') {
            dims.calc           <- 1:n.dims.loop
            if (force.all.dims) {
              ratio.test.t      <- 1
            } else {
              ratio.test.t      <- ratio.test 
            }
          }                  
          if (ratio.test.t == 1) {
            n.calc.repeat       <- 1
          } else {
            n.calc.repeat       <- 2
          }	        
        }
        if (!exists('pred.measures')) {
          pred.measures <- array(NA, dim = c(3, n.steps, n.dims.loop))
          dimnames(pred.measures) <- list(c('var.res.steps','RMSE','MEF'), 
                                          paste('step',1:n.steps), 
                                          sapply(args.call.filecheck$dimensions[[1]],
                                                 function(x) paste(x, collapse='-')))
        }
        
        for (g in 1:n.calc.repeat) {
          for (l in dims.calc) {
            if (g == 2 && step.chosen['dim', h] != l)
              next
            tresh.fill.dc         <- tresh.fill[[ind]][[l]]                  
            
            ##prepare parallel iteration parameters
            if (process.type == 'stepwise') {
              amnt.iters.loop       <- amnt.iters[[h]][[1]]
              amnt.iters.start.loop <- amnt.iters.start[[h]][[1]]
            } else if (process.type == 'variances') {
              if (h == 1)
                tresh.fill.dc       <- tresh.fill.first[[ind]][[l]]
              amnt.iters.loop       <- c(h, amnt.iters[[1]][[l]][2])
              amnt.iters.start.loop <- c(max(c(1, h - 1)), 1)
            }
            if (print.status)
              cat(paste(Sys.time(), ' : Starting process for filling dimension: ',
                        paste(dimensions[[ind]][[l]], collapse=','), ' \n', sep = ''))
            iterpath <- rbind(iterpath, data.frame(time = Sys.time(), var.name = var.name
                                                   , process = process, step = h, calc.repeat = g
                                                   , dimensions = paste(dimensions[[ind]][[l]],
                                                                        collapse = ','),
                                                   otherdim = NA))
            drop.dim = FALSE
            dims.process        <- dimensions[[ind]][[l]]
            dims.process.id     <- dims.info[match(dims.process, dims.info$name), 1]
            dims.process.length <- dims.info[match(dims.process, dims.info$name), 3]
            if (length(dim(datacube)) == 1 &&  dims.process == 'time') {
              dims.cycle.id     <- 0
              dims.cycle.amnt   <- 1
              dims.cycle.length <- 1
              dims.process.id   <- 1
              dims.cycle        <- 'series'
              datacube          <- array(datacube, dim = c(1, length(datacube)))
              drop.dim          <- TRUE
            } else {
              dims.cycle        <- dims.info[ - match(dims.process, dims.info$name), 2]
              dims.cycle.id     <- dims.info[match(dims.cycle, dims.info$name), 1]
              dims.cycle.amnt   <- length(dims.cycle.id)
              dims.cycle.length <- dims.info[match(dims.cycle, dims.info$name), 3]
            }  
            datapts.n           <- prod(dims.info[match(dims.process, dims.info$name), 3])
            slices.n            <- prod(dims.cycle.length)

              
            diminfo.step <- list(dims.process = dims.process, dims.process.id = dims.process.id,
                                 dims.process.length = dims.process.length,
                                 dims.cycle.id = dims.cycle.id,
                                 dims.cycle.length = dims.cycle.length)
            
            ##determine call settings for SSA
            args.call.SSA <- list(amnt.artgaps = amnt.artgaps[[ind]][[l]],
                M = M[[ind]][[l]],
                size.biggap = size.biggap[[ind]][[l]],
                n.comp = n.comp[[ind]][[l]],
                pad.series = pad.series[[ind]][[l]],
                amnt.iters = amnt.iters.loop,
                amnt.iters.start = amnt.iters.start.loop,
                print.stat   = FALSE,
                plot.results = FALSE,
                debugging = debugging)
            if (debugging) {
              data.step <- list(iterinf = list(process = process, h = h, g = g, l = l), args = args.call.SSA)
              args2SSA[[length(args2SSA) + 1]] <- data.step
            }
            
            ##get first guess
            if (h > 1 && exists('file.name.guess.next')) {
              file.con.guess   <- open.nc(file.name.guess.next)
              first.guess      <- var.get.nc(file.con.guess, var.name)
              close.nc(file.con.guess)
            }
            ##run calculation
            ##TODO try to stop foreach loop at first error message!
            args.Datacube <- c(list(datacube = datacube, max.cores = max.cores,
                    tresh.fill.dc = tresh.fill.dc,first.guess = first.guess,
                    dims.process.id = dims.process.id, dims.cycle.id = dims.cycle.id,
                    dims.process = dims.process, dims.cycle = dims.cycle, 
                    print.status = print.status, datapts.n = datapts.n, dims.info = dims.info,
                    calc.parallel = calc.parallel, ocean.mask = ocean.mask, 
                    debugging = debugging, h = h, l = l,  MSSA = MSSA[[ind]][[l]],
                    MSSA.blocksize = MSSA.blocksize, ratio.test.t = ratio.test.t, g = g,
                    MSSA.blck.trsh = MSSA.blck.trsh, file.name = file.name), 
                    list(args.call.SSA = args.call.SSA), ratio.const = ratio.const,
                    tresh.const = tresh.const)
            if (g > 1)
              args.Datacube <- c(args.Datacube, list(slices.process = slices.process,
                      slices.constant = slices.constant,
                      values.constant = values.constant, 
                      slices.excluded = slices.excluded,
                      slices.without.gaps = slices.without.gaps))
            gapfill.results   <- do.call(GapfillNcdfDatacube, args.Datacube)
            gapfill.results   <- c(gapfill.results, diminfo.step)
            if (is.null(gapfill.results$reconstruction) && is.null(gapfill.results$data.variances) &&
                n.steps == 1) {
              print(paste('No series available for filling and only one step process',
                          'chosen. Stopping gapfilling.',  sep = ''))
              file.remove(file.name.copy)
              return(list(finished = FALSE))
            }  
            if (process.type == 'variances')
              assign(paste('gapfill.results.dim', l, sep=''), gapfill.results)
          }
     

          ##test which dimension to be used for the next step
          ##TODO whole step can be excluded for "one step" processes
          if (process.type == 'variances' & ((length(processes) == 2 && process == 'cv') |
                (length(processes) == 1 && process == 'final') )) {
            if (g == 1) {
              for (k in 1:n.dims.loop) {
                recstr.t      <- get(paste('gapfill.results.dim', k, sep = ''))[['reconstruction']]
                if (!is.null(recstr.t)) {
                  pred.per.t    <- var(art.gaps.values - recstr.t[ind.artgaps.out], na.rm = TRUE)
                  if (length(processes) == 2) {
                    pred.measures['var.res.steps',h ,k ] <- pred.per.t
                  } else if (length(processes) == 1) {                     # if single step process with "inner" cross validation
                    pred.measures['var.res.steps',h ,k ] <- 0
                  }  
                  if (process == 'cv') {
                    ind.test <- !is.na(recstr.t[ind.artgaps.out])
                    pred.measures['RMSE',h ,k ] <-  RMSE(art.gaps.values[ind.test],
                                                         recstr.t[ind.artgaps.out][ind.test])
                    pred.measures['MEF',h ,k ]  <-  MEF(art.gaps.values[ind.test],
                                                        recstr.t[ind.artgaps.out][ind.test])
                  }
                } else if (is.null(recstr.t)) {
                  pred.measures['var.res.steps',h ,k ] <- Inf
                }
              }
              step.chosen[, h] <- which(array(pred.measures['var.res.steps', , ],
                                              dim = c(n.steps, n.dims.loop) ) ==
                                        min(pred.measures['var.res.steps', , ], na.rm = TRUE),
                                        arr.ind = TRUE)[2:1]
              gapfill.results.step <- get(paste('gapfill.results.dim', step.chosen['dim', h], 
                      sep = ''))
              if (ratio.test.t != 1) {
                slices.process     <- gapfill.results.step$slices.process
                slices.constant    <- gapfill.results.step$slices.constant
                values.constant    <- gapfill.results.step$values.constant 
                slices.excluded    <- gapfill.results.step$slices.excluded
                slices.without.gaps<- gapfill.results.step$slices.without.gaps
                recstr.test        <- gapfill.results.step$reconstruction
              }
              if (print.status)
                cat(paste(Sys.time(), ' : Chose dimension(s) ',
                        paste(dimensions[[ind]][[step.chosen['dim', h]]], collapse = ' and '), 
                        ' as first guess for next step.\n', sep = ''))
            } else {
              gapfill.results.step   <- gapfill.results
              gapfill.results.step$reconstruction[!is.na(recstr.test)] <-
                                                              recstr.test[!is.na(recstr.test)] 
            }
          } else {
            if (process.type == 'variances') {
              gapfill.results.step <- get(paste('gapfill.results.dim', step.chosen['dim', h], sep = ''))
            } else {
              gapfill.results.step <- gapfill.results
            }
          }        
        }
        
        ##determine first guess for next step
        ## FIXME remove after debugging
        if (debugging) {
          file.name.t <- paste('/Net/Groups/BGI/people/jbuttlar/Scratch/Debug_Gapfill/',
                               Sys.time(), sep = '') 
          print(paste('Saving workspace to file ', file.name.t, '.rda', sep = ''))
          dump.frames(to.file = TRUE, dumpto = file.name.t)
        }
          
        if (!is.null(gapfill.results.step$reconstruction)) {
          file.name.guess.curr   <- paste(sub('.nc$', '', file.name),
                                          '_first_guess_step_',formatC(h + 1, 2, flag = '0'),
                                          '.nc', sep = '')
          file.con.guess.next    <- open.nc(file.name.guess.curr, write = TRUE)
          results.reconstruction <- gapfill.results.step$reconstruction
          
          ## use first guess from other dimensions in case of too gappy series
          if (force.all.dims) {
            dim.other            <- setdiff(1:n.dims.loop, step.chosen['dim', h])
            if (length(dim.other) != 0) {
              results.dim.other  <- get(paste('gapfill.results.dim', dim.other, sep = ''))           
              if (!is.null(results.dim.other$reconstruction)) {
                data.fill.otherdim     <- results.dim.other$reconstruction
                data.fill.otherdim[!is.na(results.reconstruction)] <- NA

                ## exclude not to be filled slices (oceans etc)
                slices.fill.other <- !(gapfill.results.step$slices.process |
                                       gapfill.results.step$slices.too.gappy)               
                if (sum(slices.fill.other) > 0) {
                  dim(slices.fill.other) <- dim(datacube)[gapfill.results.step$dims.cycle.id + 1]
                  ind.fill.other <- ind.datacube(datacube = datacube, logical.ind = slices.fill.other,
                                                 dims = gapfill.results.step$dims.cycle.id + 1)
                  data.fill.otherdim[ind.fill.other] <- NA
                }
                
                n.data.fill.otherdim   <-  sum(!is.na(data.fill.otherdim))
                if (n.data.fill.otherdim > 0) {
                  ratio <- round(n.data.fill.otherdim / sum(!is.na(results.reconstruction)) * 100, 2)
                  status.report(paste('Including ',ratio, ' % values from dropped dimension ',
                                      paste(dimensions[[ind]][[dim.other]], collapse=','),
                                      sep = ''))
                  included.otherdim[h] <- TRUE
                  iterpath[dim(iterpath)[1], 'otherdim'] <- TRUE
                  results.reconstruction[is.na(results.reconstruction)] <-
                    data.fill.otherdim[is.na(results.reconstruction)]
                }
              }              
            }
          }
          
          ##save first guess data
          if (drop.dim)
            results.reconstruction <- drop(results.reconstruction)
          var.put.nc(file.con.guess.next, var.name, results.reconstruction)
          close.nc(file.con.guess.next)
          step.use.frst.guess  <- step.chosen['step', max(which(!is.na(step.chosen['step',])))]
          file.name.guess.next <- paste(sub('.nc$', '', file.name), '_first_guess_step_',
                                        formatC(step.use.frst.guess + 1, 2, flag = '0'), '.nc', sep = '')
        }
        ##TODO: add break criterium to get out of h loop
        ##      check what happens if GapfillSSA stops further iterations due to limiting groups of eigentriples
      }
    }
      ## stop parallel workers
      if (package.parallel == 'doSMP')
        stopWorkers(w)
      
      ##save results 
      GapfillNcdfSaveResults(datacube = datacube, var.names = var.names, 
                             reconstruction = results.reconstruction,
                             args.call.global = args.call.global,
                             slices.without.gaps = gapfill.results.step$slices.without.gaps,
                             dims.cycle.id = gapfill.results.step$dims.cycle.id,
                             ocean.mask = ocean.mask, dims.process = gapfill.results.step$dims.process,
                             dims.process.id = gapfill.results.step$dims.process.id,
                             var.name = var.name, process.cells = process.cells,
                             file.name.copy = file.name.copy, keep.steps = keep.steps, 
                             print.status = print.status, n.steps = n.steps, drop.dim = drop.dim)
    }
    finished <- TRUE
    close.nc(file.con.orig)
    if (process.type == 'variances') {
      out  <-list(pred.measures = pred.measures, step.chosen = step.chosen, finished = finished,
                  iterpath = iterpath, included.otherdim = included.otherdim, SSAcallargs = args2SSA)
    } else {
      out  <- list(finished = finished)
    }
    return(out)
  }, ex = function(){
    ## prerequesites: go to dir with ncdf file and specify file.name
    setwd('')
    file.name        = 'scen_3_0.5_small.nc'
    max.cores        = 8
    calc.parallel    = TRUE
    
    ##example settings for traditional one dimensional "onlytime" setting and
    ## one step
    amnt.artgaps     <- list(list(c(0.05, 0.05)));
    amnt.iters       <- list(list(c(3, 10)));
    dimensions       <- list(list("time")); 
    M                <- list(list(12)); 
    n.comp           <- list(list(6)); 
    size.biggap      <- list(list(5)); 
    var.name         <- "auto"
    process.type     <- "stepwise"
    GapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
                amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
                size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
                M = M, process.type = process.type)
    
    
    
    ##example settings for 3 steps, stepwise and mono dimensional
    dimensions       = list(list('time'), list('time'), list('time'))
    amnt.iters       = list(list(c(1,5)), list(c(2,5)), list(c(3,5)))
    amnt.iters.start = list(list(c(1,1)), list(c(2,1)), list(c(3,1)))
    amnt.artgaps     = list(list(c(0,0)), list(c(0,0)), list(c(0,0)))
    size.biggap      = list(list(0),      list(0),      list(0))
    n.comp           = list(list(6),      list(6),      list(6))
    tresh.fill       = list(list(.2),     list(.2),     list(.2))
    M                = list(list(12),     list(12),     list(12))
    process.type     = 'stepwise'
    GapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
                amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
                size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
                M = M, process.type = process.type)
    
    ##example settings for 4 steps, stepwise and alternating between temporal and spatial
    dimensions       = list(list('time'), list(c('longitude','latitude')), list('time'), list(c('longitude','latitude')))
    amnt.iters       = list(list(c(1,5)), list(c(1,5)),                    list(c(2,5)), list(c(2,5)))
    amnt.iters.start = list(list(c(1,1)), list(c(1,1)),                    list(c(2,1)), list(c(4,1)))
    amnt.artgaps     = list(list(c(0,0)), list(c(0,0)),                    list(c(0,0)), list(c(0,0)))
    size.biggap      = list(list(0),      list(0),                         list(0),      list(0))
    n.comp           = list(list(15),     list(15),                        list(15),     list(15))
    tresh.fill       = list(list(.2),     list(0),                         list(0),     list(0))
    M                = list(list(23),     list(c(20,20)),                  list(23),     list(c(20,20)))
    process.type     = 'stepwise'
    GapfillNcdf(file.name = file.name, dimensions = dimensions, 
                amnt.iters = amnt.iters, amnt.iters.start = amnt.iters.start, 
                amnt.artgaps = amnt.artgaps, size.biggap = size.biggap, n.comp = n.comp, 
                tresh.fill = tresh.fill, M = M, process.type = process.type, max.cores = max.cores)
    
    ##example setting for process with alternating dimensions but variance criterium
    dimensions       = list(list('time', c('longitude','latitude')))
    n.comp           = list(list(5,      5))
    M                = list(list(10,     c(10,10)))
    amnt.artgaps     = list(list(c(0,0), c(0,0)))
    size.biggap      = list(list(0,      0))
    process.type     = 'variances'
    tresh.fill       = list(list(0.1,    0.1))
    max.steps        = 2
    GapfillNcdf(file.name = file.name, dimensions = dimensions, n.comp = n.comp, 
                tresh.fill = tresh.fill, max.steps = max.steps, M = M, 
                process.type = process.type, amnt.artgaps = amnt.artgaps, 
                size.biggap = size.biggap, max.cores = max.cores)
  })


##################################      create files    ########################

GapfillNcdfOpenFiles <- function(file.name, var.names, n.steps, print.status)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that prepares the output files 
##seealso<<
##\code{\link{GapfillNcdf}}
  
#open ncdf files
{
  if (print.status)
    cat(paste(Sys.time(), ' : Creating ncdf file for results. \n', sep = ''))
  file.name.copy     <- paste(sub('[.]nc$','', file.name), '_gapfill.nc', sep = '')
  copied             <- file.copy(from = file.name, to = file.name.copy, overwrite = TRUE)
  Sys.chmod(file.name.copy, mode = "0777")
  if (!copied)
    stop('Creating file for results failed!')
  
  #prepare first guess files
  for (b in 2:(n.steps + 1)) {
    file.name.guess.t  <- paste(sub('.nc$', '', file.name), '_first_guess_step_',
                                formatC(b, 2, flag = 0), '.nc', sep='')
    copied             <- file.copy(from = file.name, to = file.name.guess.t, 
                                    overwrite = TRUE)
    con.tmp            <- open.nc(file.name.guess.t, write = TRUE)
    for (var.name in var.names) {
      data.tmp           <- var.get.nc(con.tmp, var.name)
      data.tmp[]         <- NA
      var.put.nc(con.tmp, var.name, data.tmp)
    }
    close.nc(con.tmp)
    Sys.chmod(file.name.guess.t, mode = "0777")
  }
  
  #Prepare Results Ncdf File
  file.con.copy      <- open.nc(con = file.name.copy, write = TRUE)
  for (var.name in var.names) {
    var.def.nc(file.con.copy, paste(var.name, '_flag_orig', sep =''), 'NC_BYTE', 
               var.inq.nc(file.con.copy, var.name)$dimids)
    att.put.nc(file.con.copy,  paste(var.name, '_flag_orig', sep =''),'long_name','NC_CHAR',
               paste('flag indicating original values (1) and filled values (0) in ',
                     var.name, sep = ''))
    datacube                    <- var.get.nc(file.con.copy, var.name)
    data.flag                   <- array(NA, dim = dim(datacube))
    data.flag[is.na(datacube)]  <- 0
    data.flag[!is.na(datacube)] <- 1
    var.put.nc(file.con.copy, paste(var.name, '_flag_orig', sep =''), data.flag)
  }  
  dims.info                  <- ncdf.get.diminfo(file.con.copy)
  close.nc(file.con.copy)
  return(list(dims.info = dims.info, file.name.copy = file.name.copy))
}


##################################### save results #############################
GapfillNcdfSaveResults <- function(args.call.global, datacube, dims.process,  
                                   dims.cycle.id, dims.process.id, file.name.copy,  
                                   keep.steps, n.steps, ocean.mask, print.status,
                                   process.cells, reconstruction, slices.without.gaps,
                                   var.name, drop.dim, var.names)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that saves the results ncdf file. 
##seealso<<
##\code{\link{GapfillNcdf}}  
{
  dims.cycle.length   <- dim(datacube)[dims.cycle.id + 1]

  #prepare results
  data.results.final              <- datacube
  data.results.final[is.na(data.results.final)] <- 
      reconstruction[is.na(data.results.final)]
  if (sum(slices.without.gaps) > 0 & process.cells == 'gappy') {
    dim(slices.without.gaps)      <- dims.cycle.length
    ind.array                     <- ind.datacube(datacube = datacube, 
                                                 logical.ind = slices.without.gaps, 
                                                 dims = dims.cycle.id + 1)
    data.results.final[ind.array] <- datacube[ind.array]
  }
  if (sum(!is.na(match(dims.process, c('longitude','latitude')))) == 2 & 
      length(ocean.mask) > 0) {
    ind.array                     <- ind.datacube(datacube = datacube, 
                                                  logical.ind = ocean.mask, 
                                                  dims = dims.process.id + 1)
    data.results.final[ind.array] <- NA
  }

  #save results
  if (print.status)
    cat(paste(Sys.time(), ' : Writing results to file. \n', sep = ''))
  file.con.copy                   <- open.nc(file.name.copy, write = TRUE)
  if (drop.dim)
    data.results.final <- drop(data.results.final)
  var.put.nc(file.con.copy, var.name, data.results.final)
  sync.nc(file.con.copy)

  #add attributes with process information to ncdf files
  if (var.name == var.names[length(var.names)]) {
    string.args  <- args.call.global
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Filled_by', 'NC_CHAR', compile.sysinfo())
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Filled_on', 'NC_CHAR', as.character(Sys.time()))
    att.put.nc(file.con.copy, 'NC_GLOBAL', 'Filling_settings', 'NC_CHAR', string.args)
    hist.string.append <- paste('Gaps filled on ', as.character(Sys.time()), ' by ',
                                Sys.info()['user'], sep = '')
    if (is.element('history', ncdf.get.attinfo(file.con.copy, 'NC_GLOBAL')[, 'name'])) {
      hist.string    <- paste(att.get.nc(file.con.copy, 'NC_GLOBAL', 'history'), 
                              '; ', hist.string.append)
      att.put.nc(file.con.copy, 'NC_GLOBAL', 'history', 'NC_CHAR', hist.string)
    } else {
      att.put.nc(file.con.copy, 'NC_GLOBAL', 'history', 'NC_CHAR', hist.string.append)
    }
        
    ## delete first guess files
    if (!keep.steps) {
      file.name.guess.t  <- paste(sub('_gapfill.nc$', '', file.name.copy), 
                                  '_first_guess_step_', 
                                  formatC(2:(n.steps + 1), 2, flag = 0), '.nc', sep='')
      file.remove(file.name.guess.t)
    }
  }
  close.nc(file.con.copy)
  if (print.status)
    cat(paste(Sys.time(), ' : Gapfilling successfully finished. \n', sep = ''))
}


##################################   gapfill data cube #########################
GapfillNcdfDatacube <- function(tresh.fill.dc =  .1, ocean.mask = c(),  
    max.cores = 8, args.call.SSA = list(), iters.n, print.status,  datapts.n, 
    dims.info, calc.parallel = TRUE, debugging, h, l,  MSSA, MSSA.blocksize, 
    first.guess = 'mean', dims.cycle, datacube, dims.cycle.id, dims.process.id, 
    dims.process, process.cells = c('gappy','all')[1], ratio.test.t, g, slices.process = c(),
    slices.constant = c(), values.constant = c(), slices.excluded = c(), 
    slices.without.gaps= c(), MSSA.blck.trsh = MSSA.blck.trsh, file.name,
    ratio.const = ratio.const, tresh.const = tresh.const)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that handles the main datacube transformations. 
##seealso<<
##\code{\link{GapfillNcdf}}    
{
  slices.n            <- prod(dim(datacube)[dims.cycle.id + 1])
  dims.process.length <- dim(datacube)[dims.process.id + 1]
  dims.cycle.length   <- dim(datacube)[dims.cycle.id + 1]
  
  #identify valid grids
  args.identify <- list(dims.cycle = dims.cycle, dims.cycle.id = dims.cycle.id,
                        dims.process.id = dims.process.id, datacube = datacube,
                        MSSA = MSSA, dims.process =  dims.process, 
                        process.cells = c('gappy','all')[1], first.guess = first.guess,
                        ocean.mask = ocean.mask, print.status = print.status, 
		                    slices.n = slices.n, dims.process.length = dims.process.length,
                        tresh.fill.dc = tresh.fill.dc, ratio.test.t = ratio.test.t,
                        g = g, ratio.const = ratio.const, algorithm = 'Gapfill', 
                        tresh.const = tresh.const, args.call.SSA = args.call.SSA)
  if (g == 2)
    args.identify <- c(args.identify, list(slices.excluded = slices.excluded,
                                           values.constant = values.constant,
                                           slices.constant = slices.constant,
                                           slices.process = slices.process))
  results.identify      <- do.call('IdentifyCellsNcdfSSA', args.identify)
  AttachList(results.identify)
  
  #create iterator
  if (sum(slices.process) == 0) {
    data.results.finished <- array(NA, dim(datacube))
    data.variances        <- NULL
  } else {
    results.crtitercube  <- do.call(GapfillNcdfCreateItercube, 
                                    list(datacube = datacube, 
                                         slices.process = slices.process,
                                         iters.n = iters.n, slices.n = slices.n, 
                                         dims.cycle.length = dims.cycle.length, 
                                         dims.cycle.id = dims.cycle.id, 
                                         max.cores = max.cores, MSSA = MSSA, 
                                         MSSA.blocksize = MSSA.blocksize,
                                         MSSA.blck.trsh = MSSA.blck.trsh,
                                         tresh.fill.dc = tresh.fill.dc))
    AttachList(results.crtitercube)                                                           
    
    #perform (parallelized) calculation
    if (print.status)
      cat(paste(Sys.time(), ' : Starting calculation: Filling ', sum(slices.process),
              ' time series/grids of size ', datapts.n, '. \n', sep = ''))
    
    if (calc.parallel) {
      results.parallel = foreach(i = 1:max.cores
        , .combine = rbindMod
        , .multicombine = TRUE, .packages = 'spectral.methods') %dopar% GapfillNcdfCoreprocess(
                                  iter.nr = i, datacube = datacube,
                                  dims.process.id = dims.process.id, datapts.n = datapts.n, args.call.SSA = args.call.SSA,
                                  iter.gridind = iter.gridind, ind.process.cube = ind.process.cube, first.guess = first.guess,
                                  print.status = print.status, iters.n = iters.n, dims.cycle.length = dims.cycle.length, 
                                  dims.cycle.id = dims.cycle.id,  dims.process.length =  dims.process.length, MSSA = MSSA, 
                                  MSSA.blocksize = MSSA.blocksize, h = h, file.name = file.name)
    } else {
       results.parallel = foreach(i = 1:1
         , .combine =  rbindMod
         , .multicombine = TRUE, packages = 'spectral.methods') %do% GapfillNcdfCoreprocess(iter.nr = i, datacube = datacube,
                                   dims.process.id = dims.process.id, datapts.n = datapts.n, args.call.SSA = args.call.SSA,
                                   iter.gridind = iter.gridind, ind.process.cube = ind.process.cube, first.guess = first.guess,
                                   print.status = print.status, iters.n = iters.n, dims.cycle.length = dims.cycle.length, 
                                   dims.cycle.id = dims.cycle.id,  dims.process.length =  dims.process.length, MSSA = MSSA, 
                                   MSSA.blocksize = MSSA.blocksize, h = h, file.name = file.name)            
     }
    data.results.valid.cells <- results.parallel$reconstruction
    data.variances           <- results.parallel$variances

    #fill all values to results array
    if (print.status)
      cat(paste(Sys.time(), ' : Transposing results. \n', sep = ''))
    data.results.all.cells                    <- array(NA, dim = c(slices.n, datapts.n))
    if (sum(slices.process) > 0)
      data.results.all.cells[index.MSSAseries, ]<- data.results.valid.cells
    data.results.all.cells[slices.constant, ] <- rep(values.constant[slices.constant], times = datapts.n)
    
    #reshape results array to match original data cube
    data.results.rshp          <- array(data.results.all.cells, dim = c(dims.cycle.length, dims.process.length))
    dims.order.results         <- c(dims.cycle, dims.process)
    if (dim(datacube)[1] == 1 && length(dim(datacube)) == 2) {                      ## if only one series is existent
      perm.array = c(1,2)
    } else {
      perm.array                 <- match(dims.info[, 'name'], dims.order.results)
    }
    data.results.finished      <- aperm(data.results.rshp, perm.array)
  }

  return(list(reconstruction = data.results.finished, data.variances = data.variances,
              slices.without.gaps = slices.without.gaps, slices.process = slices.process, 
              max.cores = max.cores, slices.process = slices.process, slices.too.gappy = slices.too.gappy,
              slices.constant = slices.constant, values.constant = values.constant, 
              slices.excluded = slices.excluded))
}



###############################  create iteration datacube   ###################


GapfillNcdfCreateItercube  <- function(datacube, iters.n, dims.cycle.length, 
    dims.cycle.id, slices.process, max.cores, slices.n, MSSA, MSSA.blocksize,
    MSSA.blck.trsh, tresh.fill.dc)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that creates the index array used
##          in the foreach iterations to extract data.     
##seealso<<
##\code{\link{GapfillNcdf}}      
{
  ##TODO
  #make indices independent from dimension order
  index.MSSAseries   <- integer()
  index.MSSAnr       <- array(1:prod(dims.cycle.length), dim = dims.cycle.length)
  if (MSSA) {
    slices.remove    <- array(!slices.process, dim = dims.cycle.length)
    iters.n          <- prod(ceiling(dim(datacube)[dims.cycle.id + 1] / MSSA.blocksize))
    ind.process.cube <- array(FALSE, dim = c(iters.n, dims.cycle.length))
    row.block        <- 1
    col.block        <- 1
    for (p in 1:iters.n) {      
      ind.row        <- row.block:(min(c(dim(datacube)[1], (row.block + MSSA.blocksize - 1))))
      ind.col        <- col.block:(min(c(dim(datacube)[2], (col.block + MSSA.blocksize - 1))))
      mn.blck.fll    <- MSSA.blck.trsh * prod(length(ind.row), length(ind.col),
                                              dim(datacube)[-(dims.cycle.id + 1)])
      if (sum(!is.na(datacube[ind.row,ind.col,])) > mn.blck.fll) 
        ind.process.cube[p, ind.row, ind.col] <- TRUE
      #create vector with indices for the time series computed
      ind.add          <- index.MSSAnr[ind.process.cube[p,,]][!slices.remove[ind.process.cube[p,,]]]
      index.MSSAseries <- c(index.MSSAseries, ind.add)
      #determine indices for next iter
      row.block        <- row.block + MSSA.blocksize      
      if (row.block > dim(datacube)[1]) {
        row.block      <- 1
        col.block      <- col.block + MSSA.blocksize
      }         
    }
    
    ##remove ocean cells
    if (sum(!slices.process) > 0) {
      ind.process.cube[ind.datacube(datacube = ind.process.cube, 
                                    logical.ind = slices.remove, dims = c(2, 3))] <- FALSE
    }
    rows.remove <- apply(ind.process.cube, 1, function(x){sum(x) == 0})
    if (sum(rows.remove) > 0) {
      ind.process.cube <- ind.process.cube[!rows.remove, , ]
      iters.n <- iters.n - sum(rows.remove)
    } 
            
  } else if (!MSSA) {
    args.expand.grid     <- alist()
    for (d in 1:length(dims.cycle.id))
      args.expand.grid[[d]] <- 1:dim(datacube)[dims.cycle.id[d] + 1]    
    iter.grid.all <- cbind(1:slices.n, as.matrix(do.call("expand.grid",
                                                         args.expand.grid)))
    ind.process.cube     <- array(iter.grid.all[slices.process, ], dim = c(sum(slices.process), length(dims.cycle.id) + 1))
    index.MSSAseries     <- (1:slices.n)[slices.process]
  }
  max.cores              <- min(c(iters.n, max.cores))
  iters.per.cyc          <- rep(floor(iters.n / max.cores), times = max.cores)
  if (!(iters.n %% max.cores) == 0)
    iters.per.cyc[1:((iters.n %% max.cores))] <- floor(iters.n / max.cores) + 1
  iter.gridind           <- matrix(NA, ncol = 2, nrow = max.cores)
  colnames(iter.gridind) <- c('first.iter', 'last.iter')
  if (max.cores > 1)  {
    iter.gridind[, 1]    <- (cumsum(iters.per.cyc) + 1) - iters.per.cyc
    iter.gridind[, 2]    <- cumsum(iters.per.cyc)
  } else {
    iter.gridind[]       <- c(1, iters.n)
  }
  return(list(iter.gridind = iter.gridind , ind.process.cube = ind.process.cube,
              max.cores = max.cores, index.MSSAseries = index.MSSAseries))
}


##################  combine data from foreach iteration ########################
rbindMod <- function(...) 
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that combines the foreach output
##          in a convenient way
##seealso<<
##\code{\link{GapfillNcdf}}, \code{\link{foreach}}   
{
    cat(paste(Sys.time(), ' : Assembling data from parallelized computations.\n', 
        sep=''))
    assign('dummy', list(...))
    results <- try({
      vars.amnt <- dim(dummy[[1]][['variances']])[2]
      cube.cols <- sum(sapply(dummy,function(x)dim(x[['reconstruction']])[1]))
      reconstruction <- matrix(unlist(lapply(dummy, function(x)as.vector(t(x[[1]])))),
                               nrow = cube.cols, byrow = TRUE)
      variances      <- matrix(unlist(lapply(dummy, function(x)as.vector(t(x[[2]])))),
                               ncol = vars.amnt, byrow = TRUE)
      iloops.converged<- unlist(lapply(dummy, function(x)as.vector(t(x[[3]]))))
      'finished'
    })
    return(list(reconstruction = reconstruction, variances = variances, 
                iloops.converged = iloops.converged))

    
}


########################## gapfill function for single core ####################
GapfillNcdfCoreprocess <- function(iter.nr = i, print.status = TRUE, datacube, 
                                   dims.process.id, iters.n, dims.cycle.length, 
                                   dims.cycle.id, iter.gridind, ind.process.cube, 
                                   first.guess, datapts.n, args.call.SSA, file.name, 
                                   dims.process.length, MSSA, MSSA.blocksize, h)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf performs each individual series/grid 
##          extracion and handing it over to GapfillSSA
##seealso<<
##\code{\link{GapfillNcdf}}, \code{\link{foreach}}                                     
{
  iter.ind          <- iter.gridind[iter.nr, ]
  datapts.n         <- prod(dim(datacube)[dims.process.id + 1])
  n.series.steps    <- numeric()
  if (MSSA){
    ind.t           <- rep(FALSE, times = dim(ind.process.cube)[1])
    ind.t[iter.ind[1]:iter.ind[2]]       <- TRUE
    n.series.core   <- sum(ind.process.cube[ind.datacube(datacube = ind.process.cube, 
                                                         logical.ind = ind.t, dims = 1)])
  } else {
    n.series.core   <- (diff(iter.ind) + 1)
  }  
  data.results.iter <- array(NA, dim = c(n.series.core , datapts.n))
  variances         <- array(NA, dim = c(diff(iter.ind) + 1, args.call.SSA[['n.comp']]))
  iloops.converged  <- array(NA, dim = c(diff(iter.ind) + 1))
  
  for (n in 1:(diff(iter.ind) + 1)) {
    ind.total       <- rep(FALSE, iters.n)
    ind.total[(iter.ind[1] : iter.ind[2])[n]] <- TRUE 
    data.results.iter.t = try({

      args.call.t             <- args.call.SSA
      args.call.t[['seed']]   <- iter.nr * n      
      dims.extr.data          <- dims.process.length
      aperm.extr.data         <- 1:(length(dims.process.id) + 1) 
      if (MSSA) {
        ind.act.cube          <- array(ind.process.cube[ind.datacube(datacube = ind.process.cube, 
                                                                     logical.ind = ind.total, 
                                                                     dims = 1)],
                                       dim = dims.cycle.length)
        n.series.steps[n]     <- sum(ind.act.cube)
        dims.extr.data        <- c(dims.extr.data, n.series.steps[n])
        aperm.extr.data       <- c(2,1)
        perm.before           <- 1:2
        ind.extr              <- ind.datacube(datacube = datacube, 
                                              logical.ind = ind.act.cube, 
                                              dims = dims.cycle.id + 1)
      } else {
        perm.before           <- order(dims.process.id)
        ind.matrix            <- array(FALSE, dims.cycle.length)
        ind.matrix.list       <- matrix(ind.process.cube[(iter.ind[1] : iter.ind[2])[n], -1], byrow=TRUE,
                                        ncol = length(dims.cycle.length))
        ind.matrix[ind.matrix.list] <- TRUE
        ind.extr              <- ind.datacube(datacube = datacube, 
                                              logical.ind = ind.matrix, 
                                              dims = dims.cycle.id + 1)
        n.series.steps[n]     <- 1
      }
      
      series.noperm                  <- array(datacube[ind.extr], dim =  dims.extr.data)
      args.call.t[['series']]        <- aperm(series.noperm, perm = perm.before)
      if (!(class(first.guess) == 'character' && first.guess == 'mean')) {
        fg.noperm                    <- array(first.guess[ind.extr], dim =  dims.extr.data)
        args.call.t[['first.guess']] <- aperm(fg.noperm, perm = perm.before)         
      }
   
      series.filled       <- do.call(GapfillSSA, args.call.t)
      rcstr.local         <- aperm(array(series.filled$reconstr,
                                         dim = c(dims.process.length, n.series.steps[n])),
                                   aperm.extr.data)
      ind.results <- (1 : n.series.steps[n]) + (((n>1) * 
                                                 (sum( n.series.steps[1 : max(c(n - 1, 1))]))))  
      data.results.iter[ind.results, ]  <- array(rcstr.local, dim = c(n.series.steps[n], datapts.n))
      variances[n, ]                    <- as.vector(series.filled$variances)
      iloops.converged[n]               <- sum(!(series.filled$iloop_converged))     
      'completed'      
    })  
    if (class(data.results.iter.t) == 'try-error') {
      print(paste('Error occoured at iteration ', iter.nr, ' and loop ', n, '!', sep = ''))
      error.from.calc                 <- data.results.iter.t
      data.results.iter.t             <- matrix(Inf, ncol = datapts.n, nrow = 1)
      system.info                     <- sessionInfo()    
      path.file                       <- file.path('/', 'Net', 'Groups', 'BGI', 'tmp', 
          'jbuttlar', 'Cluster_jobs_debugging', sub('/Net/Groups/BGI/', '', getwd()))
      if (!file.exists(path.file))  
        system(paste('mkdir -p ', path.file, sep = ''))     
      file.name.t                     <- file.path(path.file, paste('workspace_error_', file.name, '_',
              iter.nr, '_', n, sep = '')) 

      print(paste('Saving workspace to file ', file.name.t, '.rda', sep = ''))
      dump.frames(to.file = TRUE, dumpto = file.name.t)
      stop()
    }
    if (iter.nr == 1 &&( diff(iter.ind) < 20  || 
          (n %% (ceiling((diff(iter.ind)) / 20)) == 0)))
      if (print.status)
        cat(paste(Sys.time(), ' : Finished ~',
                  round(n / (diff(iter.ind) + 1) * 100), '%. \n', sep=''))
  }
  return(list(reconstruction = data.results.iter, variances = variances, 
              lioops.converged = iloops.converged))
}
