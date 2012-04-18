GapfillNcdf <- structure(function(
##title<< fill gaps in time series or spatial fields inside a ncdf file using SSA.
##description<< Wrapper function to automatically fill gaps in series or spatial fields inside a ncdf file and save the results
##              to another ncdf file.
file.name             ##<< character: name of the ncdf file to decompose.  The file has to be in the current working directory!
, process.type = c('stepwise', 'variances')[1]
, M                   ##<< list of single integers: window length  or embedding dimension in time steps. If not
                      ##   given,  a default value of 0.5*length(time series) is computed.                             
, dimensions = list(list('time'))
                      ##<< list of string vectors: setting along which dimensions to perform SSA. These names
                      ##   have to be identical to the names of the dimensions in the ncdf file. Set this to
                      ##   'time' to do only temporal gap filling or to (for example) c('latitude','longitude')
                      ##   to do 2 dimensional spatial gap filling. See the description for details on how to
                      ##   perform spatio-temporal gap filling.
, MSSA =  rep(list(   rep(list(FALSE), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of logicls: Whether to perform MSSA for this dimension (see description 
                      ##   for details). Has to have the same structure as dimensions.
, MSSA.blocksize = 1  ##<< integer: size of the quadratical block used for MSSA.  
, gaps.cv        = 0
, MSSA.blck.trsh = 0                                  
, amnt.artgaps = rep(list(   rep(list(c(0.05, 0.05)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of numeric vectors: the relative ratio (length gaps/series length) of
                      ##  artificial gaps to include to determine the iteration with the best
                      ##   prediction (c(ratio big gaps, ratio small gaps))
, size.biggap = rep(list(   rep(list(20) , times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of single integers: length of the big artificial gaps (in time steps) (see ?GapfillSSA for details)
, amnt.iters = rep(list(   rep(list(c(10, 10)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors: amount of iterations performed for the outer and inner
                      ##   loop (c(outer,inner)) (see ?GapfillSSA for details)
, amnt.iters.start = rep(list(   rep(list(c(1, 1)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors: index of the iteration to start with (outer, inner). If this
                      ##   value is >1, the reconstruction (!) part is started with this iteration. Currently
                      ##   it is only possible to set this to values >1 if amnt.artgaps and size.biggap == 0.
, n.comp = lapply(amnt.iters, FUN = function(x)x[[1]][[1]][1] * 2)
                      ##<< list of single integers: amount of eigentriples to extract (default (if no values are
                      ##   supplied) is 2*amnt.iters[1] (see ?GapfillSSA for details)
, pad.series = rep(list(   rep(list(c(0, 0)), times = length(dimensions[[1]]))) , times = length(dimensions))
                      ##<< list of integer vectors (of size 2): length of the extracts from series to use for
                      ##   padding. Only possible in the one dimensional case. See the documentation of GapfillSSA for details!
, tresh.fill = {tresh.fill <- rep(list(rep(list(0), times = length(dimensions[[1]]))) , times = length(dimensions));
                tresh.fill[[1]][[1]] <- 0.1; tresh.fill}
                      ##<< list of numeric fractions (0-1): This value determines the fraction of valid values below which
                      ##   series/grids will not be filled in this step and are filled with the first guess from the
                      ##   previous step (if any). For filling global maps while using a ocean.mask you need
                      ##   to set this value relative to the global grid size (and not only the land mask). Setting this
                      ##   value to zero would mean that also slices/series without any "real" values are tried to
                      ##   be filled with the "first guess" value of the last iteration alone. This can only be done
                      ##   if the cross validation scheme is switched off (e.g. by setting amnt.artgaps and size.biggap
                      ##   to zero
, tresh.fill.first = list(tresh.fill[[1]])    ##<< single numeric value between 0 and 1 indicating a different treshold for the
                      ##   run when no first guess values from previous runs are available. As this can be specified anyway
                      ##   in the 'stepwise' sheme, supplying this value is only reasonable in the 'variances' sheme.
, max.steps = 10
, ratio.test = 1
, force.all.dims = FALSE
, var.name = 'auto'   ##<< character string: name of the variable to fill. If set to 'auto' (default), the name
                      ##   is taken from the file as the variable with a different name than the dimensions. An
                      ##   error is produced here in cases where more than one such variable exists.
, ocean.mask = c()    ##<< logical matrix: contains TRUE for every ocean grid cell and FALSE for land cells. Ocean grid
                      ##   cells will be set to missing after spatial SSA and will be excluded from temporal SSA.
                      ##   The matrix needs to have dimensions identical in order and size to the spatial dimensions
                      ##   in the ncdf file. As an alternative to a R matrix, the name of a ncdf file can be supplied.
                      ##   It should only contain one non coordinate variable with 1 at ocean cells and 0 at land cells.
, process.cells = c('gappy','all')[1]
                      ##<< character string: which grid/series to process. 'gappy' means that only series grids with actual
                      ##   gaps will be processed, 'all' would result in also non gappy grids to be subjected to SSA. The
                      ##   first option results in faster computation times as reconstructions for non gappy grids/series
                      ##   are technically not needed for gap filling, whereas the second option provides a better
                      ##   understanding of the results trajectory to the final results.
, first.guess = 'mean'##<< character string: if 'mean', standard SSA procedure is followed (using zero as
                      ##   the first guess. Otherwise this is the file name of a ncdf file with the same dimensions
                      ##   (with identical size!) as the file to fill which contains values used as a
                      ##   first guess (for the first step of the process!). This name need to be exactly
                      ##   "<filename>_first_guess_step_1.nc".
, keep.steps = TRUE   ##<< logical: whether to keep the files with the results from the single steps                      
, print.status = TRUE ##<< logical: whether to print status information during the process
, calc.parallel = TRUE##<< logical: whether to use parallel computing. Needs packages doMC, foreach or doSMP (and
                      ##   their dependencies) to be installed.
, package.parallel = 'doMC' ##<< character: one of 'doSMP' or 'doMC': package to use for linking foreach to
                      ##   parallel computing back end.
, max.cores = 8       ##<< integer: maximum number of cores to use.
, save.debug.info = FALSE
, reproducible = FALSE##<< logical: Whether a seed based on the characters of the file name should be set
                      ##            which forces all random steps, including the nutrlan SSA algorithm to be
                      ##            exactly reproducible.
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
##\code{\link{new.SSA}}, \code{\link{GapfillSSA}}, \code{\link{decompose.ncdf}}
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
     
    #save argument values of call
    args.call.filecheck <- as.list(environment())
    args.call.global    <- call.args2string()
    if (print.status & !interactive()) {
      print('Arguments supplied to function call:')
      print(args.call.filecheck)
    }
    
    #set seed based on file name
    if (reproducible) {
       file.name.cl <-  gsub('[[:punct:]]', '', file.name)
       ind.rev      <-  round(seq(1,nchar(file.name.cl),length.out=5),digits=0)
       seed         <-  as.numeric(paste(match(unlist(strsplit(file.name.cl,''))[ind.rev], 
                                   c(letters,LETTERS,0:9)) ,collapse='' )   ) 
    } else {
      seed <- c()
    }  
       
    #load libraries
    if (print.status)
        cat(paste(Sys.time(), ' : Loading libraries. \n', sep=''))
    require(foreach)
    require(spectral.methods)
    require(RNetCDF)
    require(ncdf.tools)
    require(Rssa)
    require(abind)
    require(raster)
    require(plyr)
    if (sum(!is.na(match(c('latitude', 'longitude', 'lat', 'long'), 
                         unlist(dimensions)))) > 0)
    library(raster)

    # necessary variables
    if (process.type == 'variances') {
      n.steps           <- max.steps
      var.steps         <- array(NA, dim = c(max.steps, max(unlist(n.comp)), 
                                 length(dimensions[[1]])))
      step.chosen       <- matrix(NA, 2, max.steps)
      dimnames(step.chosen) <- list(c('dim','step'), paste('step', 1:max.steps))
    } else {
      n.steps           <- length(amnt.artgaps)
    }
    ##TODO put to check arguments
    if (missing(file.name) )
        stop('file.name needs to be supplied!')
    
    #check input, check first guess, transfer and check ocean mask
    res.check     <- do.call(GapfillNcdfCheckInput, args.call.filecheck)
    var.name      <- res.check[[1]]
    ocean.mask    <- res.check[[2]]

    #open ncdf files and create step files
    res.open      <- GapfillNcdfOpenFiles(file.name = file.name, var.name = var.name,
                                          n.steps = n.steps, print.status = print.status)
    dims.info     <- res.open$dims.info
    datacube      <- res.open$datacube
    file.name.copy<- res.open$file.name.copy
    
    # start parallel processing workers
    if (calc.parallel)
        RegisterParallel(package.parallel, max.cores)
    if (gaps.cv != 0) {
      processes <- c('cv', 'final')
    } else if (gaps.cv == 0) {
      processes <- c('final') 
      art.gaps.values            <- NULL            
    }
    ind.artgaps.out  <- array(FALSE, dim = dim(datacube))        
            
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
          n.dims.loop <- length(dimensions[[ind]])             
        } else if (process.type == 'variances') {
          ind                   <- 1
          n.dims.loop           <- length(dimensions[[ind]])
          if (process == 'final') {
            if (length(processes) == 2) {
              dims.calc           <- step.chosen['dim', h]
            } else if (length(processes) == 1) {
              dims.calc           <- 1
            }
            n.calc.repeat       <- 1
            ratio.test.t        <- 1
          } else if (process == 'cv') {
            dims.calc           <- 1:n.dims.loop
            if (force.all.dims && h == 1) {
              ratio.test.t <- 1
            } else {
              ratio.test.t <- ratio.test 
            }
          }                  
          if (ratio.test.t == 1) {
            n.calc.repeat <- 1
          } else {
            n.calc.repeat <- 2
          }	        
        }
        if (!exists('pred.measures')) {
          pred.measures <- array(NA, dim = c(3, n.steps, n.dims.loop))
          dimnames(pred.measures) <- list(c('var.res.steps','RMSE','MEF'), 
                                          paste('step',1:n.steps), 
                                          sapply(call.args$dimensions[[1]], function(x) paste(x, collapse='-')))
        }
        
        for (g in 1:n.calc.repeat) {
          for (l in dims.calc) {
            if (g == 2 && step.chosen['dim', h] != l)
              next
            tresh.fill.dc         <- tresh.fill[[ind]][[l]]                  
            
            ## ToDo remove
            iterinf <- list(process = process, h = h, g = g, l = l, ratio.test.t = ratio.test.t,
                            n.dims.loop = n.dims.loop, 
                            n.calc.repeat = n.calc.repeat, dims.calc = dims.calc)
            print(iterinf)
            
            ##prepare parallel iteration parameters
            if (process.type == 'stepwise') {
              amnt.iters.loop       <- amnt.iters[[h]][[1]]
              amnt.iters.start.loop <- amnt.iters.start[[h]][[1]]
            } else if (process.type == 'variances') {
              if (h == 1)
                tresh.fill.dc         <- tresh.fill.first[[ind]][[l]]
              amnt.iters.loop       <- c(h, amnt.iters[[1]][[l]][2])
              amnt.iters.start.loop <- c(max(c(1, h - 1)), 1)
            }
            if (print.status)
              cat(paste(Sys.time(), ' : Starting process for filling dimension: ',
                      paste(dimensions[[ind]][[l]], collapse=','), ' \n', sep = ''))
            dims.process        <- dimensions[[ind]][[l]]
            dims.process.id     <- dims.info[match(dims.process, dims.info$name), 1]
            dims.process.length <- dims.info[match(dims.process, dims.info$name), 3]
            dims.cycle          <- dims.info[ - match(dims.process, dims.info$name), 2]
            dims.cycle.id       <- dims.info[match(dims.cycle, dims.info$name), 1]
            dims.cycle.amnt     <- length(dims.cycle.id)
            dims.cycle.length   <- dims.info[match(dims.cycle, dims.info$name), 3]
            datapts.n           <- prod(dims.info[match(dims.process, dims.info$name), 3])
            slices.n            <- prod(dims.cycle.length)
            diminfo.step <- list(dims.process = dims.process, dims.process.id = dims.process.id,
                dims.process.length = dims.process.length, dims.cycle.id = dims.cycle.id,
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
                plot.results = FALSE)         
            ##get first guess
            if (h > 1 && exists('file.name.guess.next')) {
              file.con.guess   <- open.nc(file.name.guess.next)
              first.guess      <- var.get.nc(file.con.guess, sub('[.]nc', '', file.name.guess.next))
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
                    save.debug.info = save.debug.info, h = h, l = l,  MSSA = MSSA[[ind]][[l]],
                    MSSA.blocksize = MSSA.blocksize, ratio.test.t = ratio.test.t, g = g,
                    MSSA.blck.trsh = MSSA.blck.trsh, file.name = file.name), 
                list(args.call.SSA = args.call.SSA))
            if (g > 1)
              args.Datacube <- c(args.Datacube, list(slices.process = slices.process,
                      slices.constant = slices.constant,
                      values.constant = values.constant, 
                      slices.excluded = slices.excluded,
                      slices.without.gaps = slices.without.gaps))
            gapfill.results   <- do.call(GapfillNcdfDatacube, args.Datacube)
            gapfill.results   <- c(gapfill.results, diminfo.step)
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
            gapfill.results.step <- gapfill.results
          }        
        }
       
        ##determine first guess for next step
        if (!is.null(gapfill.results.step$reconstruction)) {
          file.name.guess.curr              <- paste(sub('.nc$', '', file.name),
              '_first_guess_step_',formatC(h + 1, 2, flag = '0'),
              '.nc', sep = '')
          file.con.guess.next               <- open.nc(file.name.guess.curr, write = TRUE)
          data.first.guess                  <- gapfill.results.step$reconstruction
          #use first guess from other dimensions in case of too gappy series
          if (force.all.dims) {
            dim.other          <- setdiff(1:n.dims.loop, step.chosen['dim', h])
            if (length(dim.other) != 0) {
              results.dim.other  <- get(paste('gapfill.results.dim', dim.other, sep = ''))           
              ind.array     <- array(gapfill.results.step$slices.too.gappy,
                                     dim = results.dim.other$dims.process.length)
              if (sum(ind.array) > 0) {
                ind.datacube  <- ind.datacube(datacube, ind.array,
                                              dims = results.dim.other$dims.process.id + 1)
                if (!is.null(results.dim.other$reconstruction))
                  data.first.guess[ind.datacube] <- results.dim.other$reconstruction[ind.datacube]
              }
            }
          }
          #save first guess data
          var.put.nc(file.con.guess.next, sub('[.]nc$', '', file.name.guess.curr), 
              data.first.guess)
          close.nc(file.con.guess.next)
          step.use.frst.guess  <- step.chosen['step', max(which(!is.na(step.chosen['step',])))]
          file.name.guess.next <- paste(sub('.nc$', '', file.name), '_first_guess_step_',
                                        formatC(step.use.frst.guess + 1, 2, flag = '0'), '.nc', sep = '')
        }
        ##TODO: add break criterium to get out of h loop
        ##      check what happens if GapfillSSA stops further iterations due to limiting groups of eigentriples
      }
    }
    # stop parallel workers
    if (package.parallel == 'doSMP')
      stopWorkers(w)
 
    #save results 
    GapfillNcdfSaveResults(datacube = datacube,
        reconstruction = gapfill.results.step$reconstruction,
        args.call.global = args.call.global,
        slices.without.gaps = gapfill.results.step$slices.without.gaps,
        dims.cycle.id = gapfill.results.step$dims.cycle.id,
        ocean.mask = ocean.mask, dims.process = gapfill.results.step$dims.process,
        dims.process.id = gapfill.results.step$dims.process.id,
        var.name = var.name, process.cells = process.cells,
        slices.process = gapfill.results.step$slices.process,
        file.name.copy = file.name.copy, keep.steps = keep.steps, 
        print.status = print.status, n.steps = n.steps)
    if (process.type == 'variances')
      return(list(pred.measures = pred.measures, step.chosen = step.chosen))
}, ex = function(){
  #prerequesites: go to dir with ncdf file and specify file.name
  setwd('')
  file.name        = 'scen_3_0.5_small.nc'
  max.cores        = 8
  calc.parallel    = TRUE

  #example settings for 3 steps, stepwise and mono dimensional
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

  #example settings for 4 steps, stepwise and alternating between temporal and spatial
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

  #example setting for process with alternating dimensions but variance criterium
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





##################################  check input ################################
GapfillNcdfCheckInput <- function(max.cores, package.parallel, calc.parallel, 
    print.status, first.guess, pad.series, process.cells, ocean.mask, tresh.fill,
    var.name, amnt.iters.start, amnt.iters, file.name, process.type, size.biggap, 
    amnt.artgaps, M, n.comp, dimensions, max.steps, tresh.fill.first, reproducible,
    save.debug.info, MSSA, MSSA.blocksize, keep.steps, ratio.test.t, force.all.dims,
    debug, gaps.cv,  MSSA.blck.trsh)
{
  ##title<< helper function for GapfillNcdf
  ##details<< helper function for GapfillNcdf that checks the consistency of the 
  ##          input paramters.
  ##seealso<<
  ##\code{\link{GapfillNcdf}}
  
  ##TODO
  # include test for MSSA and windowlength=1
  
  ##TODO
  #check for tresh.fill.first
  #check input file
  ##TODO add checks
  ## - single dimension variances and thresh.fill.first, tresh.fill
  ## - facilitate old school SSA via gaps.cv, max.steps = 1, amnt.artgaps !=0 and length(dimensions) == 1



  
  if (!file.exists(file.name))
    stop('Input ncdf file not found. Check name!')
  check.passed = ncdf.check.file(file.name = file.name, 
                                 dims = unique(unlist(dimensions)), 
                                 type = 'relaxed')
  if (!check.passed)
    stop('NCDF file not consistent with CF ncdf conventions!')
  file.con.orig <- open.nc(file.name)
  if (var.name=='auto') {
    var.name <- setdiff(ncdf.get.varinfo(file.con.orig)$name,
        c(ncdf.get.diminfo(file.con.orig)$name,'doy', 'year', 'flag.orig'))
    if (length(var.name) > 1)
      stop('More than one non-dimensional/coordinate variable available in file!')
  } else {
    var.name=var.name
    if (!is.element(var.name, ncdf.get.varinfo(file.con.orig)$name))
      stop('Specified variable name does not exist in ncdf file!')
  }
  if(sum(is.na(match(unique(unlist(dimensions)), c('longitude', 'latitude', 'time')))) > 0)
    stop('Every dimensions value has to be one of time, longitude, latitude!')
  dims.not.exist <- is.na(match(unlist(dimensions), ncdf.get.diminfo(file.con.orig)[, 'name']))
  if(sum(dims.not.exist)>0)
    stop(paste('Dimension(s) ', paste(unlist(dimensions)[dims.not.exist], collapse=', '),
            'not existent in ncdf file!', sep=''))

  # check first guess file
  name.first.guess.std <- paste(sub('.nc', '', file.name),'_first_guess_step_1.nc', sep = '')
  if (!(first.guess == 'mean')) {
    if (!(file.exists(first.guess))) {
      stop('Specified first.guess file not existent!')
    } else if (!(first.guess == name.first.guess.std)) {
      stop('Name for supplied first guess file does not fit the standardized scheme!')
    }
    check.passed = ncdf.check.file(file.name = first.guess, 
                                   dims = ncdf.get.diminof(file.con.orig)[, 'name'], 
                                   type = "relaxed")
    if (!check.passed)
      stop('First guess NCDF file not consistent with CF ncdf conventions!')
  }

  #transfer and check ocean mask
  lengths.dim.nontime <- ncdf.get.diminfo(file.con.orig)['length'][!(ncdf.get.diminfo(file.con.orig)['name'] == 'time')]

  data.t                    <- var.get.nc(file.con.orig, var.name)
  if (!is.null(ocean.mask) && class(ocean.mask)=='character') {
    if (!(file.exists(ocean.mask)))
      stop('File for ocean mask not existent!')
    check.passed <- ncdf.check.file(file.name = ocean.mask, 
                                    dims=c('longitude','latitude'), type = 'relaxed')
    if (!check.passed)
      stop('ocean mask NCDF file not consistent with CF ncdf conventions!')
    con.ocean   <- open.nc(ocean.mask)
    var.names.t <- ncdf.get.varinfo(con.ocean)[,'name']
    var.name.om <- var.names.t[is.na(match(var.names.t, c('time', 'longitude', 'latitude')))]
    if (length(var.name.om) > 1)
      stop('More then one variable existent in ocean mask!')
    for (par.check in c('longitude', 'latitude')) {
      if(!identical(var.get.nc(file.con.orig,par.check), 
                    var.get.nc(con.ocean, par.check)))
        stop(paste(par.check,' values need to be identical in ocean.mask and',
                   ' input ncdf file!'))
    }
    ocean.cells <- var.get.nc(con.ocean, var.name.om)
    ocean.mask  <- array(FALSE, dim = dim(ocean.cells))
    ocean.mask[ocean.cells == 1 ] <- TRUE
    close.nc(con.ocean)
    ind.array <- ind.datacube(data.t, ocean.mask,
                             (1:3)[is.element(ncdf.get.diminfo(file.con.orig)[, 'name'], 
                             c('longitude', 'latitude'))])
    if (sum(!is.na(data.t[ind.array])) > 0)
      stop('Data contains non NA values at oceaniter.nr grid positions!')
  }
  if (length(ocean.mask) > 0 && !(dim(ocean.mask) == lengths.dim.nontime))
    stop(paste('The ocean mask has to have identical dimensions as the spatial',
               ' dimensions in the ncdf file!', sep = ''))

  # check consitency of inputs
  n.steps           <- length(amnt.artgaps)
  if (!is.element(process.cells,c('gappy', 'all')))
    stop('process.cells has to be one of \'all\' or \'gappy\'!')
  if (!is.element(process.type,c('stepwise', 'variances')))
    stop('process.type has to be one of \'stepwise\' or \'variances\'!')
  if (max.cores>1 & !calc.parallel)
    stop('More than one core can only be used if calc.parallel==TRUE!')
  if(all(unlist(c(tresh.fill, tresh.fill.first)) < 0 | unlist(c(tresh.fill, tresh.fill.first)) > 1))
    stop('All values in tresh.fill (and tresh.fill.first) need to be between 0 and 1!')
  if (process.type == 'variances') {
    args.check <- c('dimensions', 'n.comp', 'M', 'amnt.artgaps', 'size.biggap', 'tresh.fill')
    n.dims     <- length(dimensions[[1]])
    for (m in 1:length(args.check)) {
      if (length(get(args.check[m])[[1]]) != n.dims)
        stop(paste(args.check[m],' needs to be of the same length as dimensions',
                   '[[1]] for process.type == \'variances\'!', sep = ''))
      if(!(class(get(args.check[m]))) == 'list')
        stop(paste('Argument ',args.check[m], ' is not a list!'))
      if (length(get(args.check[m])) != 1)
        stop(paste(args.check[m],' needs to be of length 1 for process.type ==',
                   ' \'variances\' !', sep = ''))
    }
  }
  if (process.type == 'stepwise') {
    args.list = c('amnt.artgaps', 'size.biggap', 'n.comp', 'M', 'pad.series', 
                 'tresh.fill', 'amnt.iters', 'amnt.iters.start')
    for (n in 1:length(args.list)) {
      if((class(get(args.list[n]))) != 'list')
        stop(paste('Argument ', args.list[n], ' is not a list!'))
      if (length(get(args.list[n])[[1]]) != length(dimensions[[1]]))
        stop(paste('Argument ', args.list[n], ' has to be a list of the same ',
                   'length as dimensions for process.type == \'stepwise\'!'))
#      if (! all(sapply(get(args.list[n]), length) == 1 ))
#        stop(paste('Argument ', args.list[n], '[[1..n]] can only be a list of ',
#                   'length one for process.type == \'stepwise\'!', sep = ''))
    }
    for (o in 1:length(dimensions))
      if (sapply(dimensions[o] , function(x) length(x)) > 2)
        stop('Settings imply SSA with more than two dimensions which is not implemented.')
    step.wrong <- (unlist(tresh.fill) == 0 & (!(unlist(size.biggap) == 0) | 
            !(all(unlist(amnt.artgaps) == 0))))
  }
  close.nc(file.con.orig)
  return(invisible(list(var.name, ocean.mask)))

}



##################################      create files    ########################

GapfillNcdfOpenFiles <- function(file.name, var.name, n.steps, print.status)
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
    data.tmp           <- var.get.nc(con.tmp, var.name)
    data.tmp[]         <- NA
    var.rename.nc(con.tmp, sub('[.]nc$', '', file.name), sub('[.]nc$', '', 
                                                             file.name.guess.t))
    var.put.nc(con.tmp, sub('[.]nc$', '', file.name.guess.t), data.tmp)
    close.nc(con.tmp)
    Sys.chmod(file.name.guess.t, mode = "0777")
  }
  
  #prepare results ncdf file
  file.con.copy      <- open.nc(con = file.name.copy, write = TRUE)  
  var.def.nc(file.con.copy,'flag.orig','NC_INT', 
             var.inq.nc(file.con.copy, var.name)$dimids)
  att.put.nc(file.con.copy,'flag.orig','long_name','NC_CHAR',
             'flag indicating original values (1) and filled values (0)')
  datacube                    <- var.get.nc(file.con.copy, var.name)
  if(sum(is.na(datacube))==0)
    stop('Data does not contain any gaps. Gap filling not possible.')
  data.flag                   <- array(NA, dim=dim(datacube))
  data.flag[is.na(datacube)]  <- 0
  data.flag[!is.na(datacube)] <- 1
  var.put.nc(file.con.copy, 'flag.orig', data.flag)
  var.rename.nc(file.con.copy, var.name, sub('[.]nc$', '', file.name.copy))
  dims.info                  <- ncdf.get.diminfo(file.con.copy)
  close.nc(file.con.copy)
  return(list(dims.info = dims.info, datacube = datacube, 
              file.name.copy = file.name.copy))
}


##################################### save results #############################
GapfillNcdfSaveResults <- function(datacube, reconstruction, args.call.global, 
    slices.without.gaps, dims.cycle.id, ocean.mask, dims.process.id, var.name, 
    dims.process, slices.process, file.name.copy, print.status, process.cells, 
    n.steps, keep.steps)
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
    ind.array                     <- ind.datacube(datacube, slices.without.gaps, 
                                                  dims.cycle.id + 1)
    data.results.final[ind.array] <- datacube[ind.array]
  }
  if (sum(!is.na(match(dims.process, c('longitude','latitude')))) == 2 & 
      length(ocean.mask) > 0) {
    ind.array                     <- ind.datacube(datacube, ocean.mask, 
                                                  dims.process.id + 1)
    data.results.final[ind.array] <- NA
  }

  #save results
  if (print.status)
    cat(paste(Sys.time(), ' : Writing results to file. \n', sep = ''))
  file.con.copy                   <- open.nc(file.name.copy, write = TRUE)
  var.put.nc(file.con.copy, paste(var.name, '_gapfill', sep=''), data.results.final)
  sync.nc(file.con.copy)

  #add attributes with process information to ncdf files
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
  close.nc(file.con.copy)
  
  #delete first guess files
  if (!keep.steps) {
      file.name.guess.t  <- paste(sub('_gapfill.nc$', '', file.name.copy), 
                                  '_first_guess_step_', 
                                  formatC(2:(n.steps + 1), 2, flag = 0), '.nc', sep='')
      file.remove(file.name.guess.t)
  }

  if (print.status)
    cat(paste(Sys.time(), ' : Gapfilling successfully finished. \n', sep = ''))
}


##################################   gapfill data cube #########################
GapfillNcdfDatacube <- function(tresh.fill.dc =  .1, ocean.mask = c(),  
    max.cores = 8, args.call.SSA = list(), iters.n, print.status,  datapts.n, 
    dims.info, calc.parallel = TRUE, save.debug.info, h, l,  MSSA, MSSA.blocksize, 
    first.guess = 'mean', dims.cycle, datacube, dims.cycle.id, dims.process.id, 
    dims.process, process.cells = c('gappy','all')[1], ratio.test.t, g, slices.process = c(),
    slices.constant = c(), values.constant = c(), slices.excluded = c(), 
    slices.without.gaps= c(), MSSA.blck.trsh = MSSA.blck.trsh, file.name)
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that handles the main datacube transformations. 
##seealso<<
##\code{\link{GapfillNcdf}}    
  
##TODO
#remove h, save.debug.info
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
                        g = g, l = l, h = h)
  if (g == 2)
    args.identify <- c(args.identify, list(slices.excluded = slices.excluded,
                                           values.constant = values.constant,
                                           slices.constant = slices.constant,
                                           slices.process = slices.process))
  results.identify      <- do.call(GapfillNcdfIdentifyCells, args.identify)
  AttachList(results.identify)
  
  #create iterator
  if (sum(slices.process) == 0) {
    if (print.status)
      cat(paste(Sys.time(), ' : No series/grids available for filling. Most probably only',
              ' totally gappy and totally gap-free grids/series exist.\n', sep=''))
    data.results.step <- NULL
    data.variances    <- NULL
  } else {
    results.crtitercube  <- do.call(GapfillNcdfCreateItercube, 
                                    list(datacube = datacube, 
                                         slices.process = slices.process,
                                         iters.n = iters.n, slices.n = slices.n, 
                                         dims.cycle.length = dims.cycle.length, 
                                         dims.cycle.id = dims.cycle.id, 
                                         max.cores = max.cores, MSSA = MSSA, 
                                         MSSA.blocksize = MSSA.blocksize,
                                         MSSA.blck.trsh = MSSA.blck.trsh))
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
    data.results.all.cells[slices.constant, ] <- rep(values.constant[slices.constant], 
                                                     each = datapts.n)
    #reshape results array to match original data cube
    data.results.rshp          <- data.results.all.cells
    dim(data.results.rshp)     <- c(dims.cycle.length, dims.process.length)
    dims.order.results         <- c(dims.cycle, dims.process)
    perm.array                 <- match(dims.info[, 'name'], dims.order.results)
    data.results.step          <- aperm(data.results.rshp, perm.array)
  }

  return(list(reconstruction = data.results.step, data.variances = data.variances,
              slices.without.gaps = slices.without.gaps, slices.process = slices.process, 
              max.cores = max.cores, slices.process = slices.process, slices.too.gappy = slices.too.gappy,
              slices.constant = slices.constant, values.constant = values.constant, 
              slices.excluded = slices.excluded))
}


#########################      identify valid cells          ###################

GapfillNcdfIdentifyCells <- function(dims.cycle, dims.cycle.id, dims.process.id, datacube,
                                     MSSA, dims.process, process.cells = c('gappy','all')[1],
                                     first.guess = 'mean', ocean.mask = c(), print.status,
                                     slices.n, dims.process.length, tresh.fill.dc, ratio.test.t,
                                     g , slices.without.gaps = rep(FALSE, slices.n), h, l,
                                     slices.too.gappy = rep(FALSE, slices.n),
                                     slices.constant = rep(FALSE, slices.n),
                                     slices.process = rep(TRUE, slices.n),
                                     slices.ocean = rep(FALSE, slices.n),
                                     values.constant = integer(length = slices.n),
                                     slices.excluded = rep(FALSE, slices.n))
##title<< helper function for GapfillNcdf
##details<< helper function for GapfillNcdf that identifies the grid cells to process. 
##seealso<<
##\code{\link{GapfillNcdf}}       

{
  ##FIXME
  # possibility to identify gap less MSSA blocks

  ##ToDo: remove h and l from argument list

  ##ToDo
  #determine grid cells to process

  if (print.status)
    cat(paste(Sys.time(), ' : Identifying valid cells ...\n', sep=''))
  
  if (!MSSA) {  
    if (g == 1) {
      amnt.na                 <- apply(datacube, MAR = dims.cycle.id + 1 ,
                                       function(x) sum(is.na(x)) / prod(dim(datacube)[dims.process.id + 1])   )
      if ((length(ocean.mask) > 0 ) & (sum(!is.na(match(c('longitude','latitude'), 
                                                        dims.process))) == 2))
        amnt.na <- 1- apply(datacube, MAR = dims.cycle.id + 1 ,
                         function(x) sum(!is.na(x[as.vector(!ocean.mask)])) / sum(!ocean.mask)   )
      if (process.cells == 'gappy') {
        slices.without.gaps       <- as.vector((amnt.na == 0))
      } else {
        slices.without.gaps       <- rep(FALSE, slices.n)
      }
      if (length(ocean.mask) > 0 & sum(!is.na(match(c('longitude','latitude'), 
                                                    dims.cycle))) == 2) {
        slices.ocean           <- as.vector(ocean.mask)
      } else {
        slices.ocean           <- rep(FALSE, slices.n)
      }
      slices.too.gappy           <- as.vector(amnt.na >= (1 - (tresh.fill.dc)))
      if ((length(first.guess) > 1) & tresh.fill.dc == 0) {
        amnt.na.first.guess    <- apply(first.guess, MAR = dims.cycle.id + 1,
                                        function(x)sum(is.na(x)) / prod(dims.process.length)   )
        if ((length(ocean.mask) > 0 ) & (sum(!is.na(match(c('longitude','latitude'), dims.process))) == 2))
           amnt.na.first.guess  <- 1- apply(first.guess, MAR = dims.cycle.id + 1 ,
                                            function(x) sum(!is.na(x[as.vector(!ocean.mask)])) / sum(!ocean.mask)   )
        slices.too.gappy[amnt.na.first.guess < 0.9] <- FALSE
      }
      slices.too.gappy[slices.ocean] <- FALSE
      slices.constant            <- as.vector(apply(datacube, MAR = dims.cycle.id + 1,
                                                    function(x){length(unique(na.omit(as.vector(x)))) == 1}))
      if (sum(slices.constant) > 0 && print.status)
        cat(paste(Sys.time(), ' : ', sum(slices.constant),' constant grids/slices',
                  ' were found and will be filled with constant values!\n', sep=''))
      values.constant            <-  as.vector(apply(datacube, MAR = dims.cycle.id + 1,
                                                     mean, na.rm = TRUE))
      slices.constant[slices.without.gaps & slices.ocean & slices.too.gappy] <- FALSE
      slices.process             <- !slices.constant & !slices.ocean & 
                                    !slices.too.gappy & !slices.without.gaps
      slices.excluded            <- logical(slices.n)

      ##extract only a ratio of the slices to calculate for variance testing
      if (ratio.test.t != 1) {
        slices.test.n      <- ceiling(sum(slices.process) * ratio.test.t)
        ind.slices.process <- sample(which(slices.process), slices.test.n)
        slices.excluded[setdiff(which(slices.process), ind.slices.process)] <- TRUE
        slices.process[-ind.slices.process] <- FALSE
      }

      ##add slices usually not filled in case no validation data is available later
      if (sum(slices.process) > 0 && mean(amnt.na[slices.process]) > 0.8) {
        ind.added                      <- order(amnt.na, rnorm(length(amnt.na)))[sum(slices.process)]
        slices.process[ind.added]      <- TRUE
        slices.without.gaps[ind.added] <- FALSE
      }
    } else {
      slices.process <- slices.excluded
    }
  } else if (MSSA) {
    if (length(ocean.mask) > 0) {
      slices.ocean                 <- as.vector(ocean.mask)
      slices.process[slices.ocean] <- FALSE
    }
  }  
  iters.n <- sum(slices.process)
  return(list(iters.n = iters.n, slices.process = slices.process, 
              values.constant = values.constant, slices.constant = slices.constant, 
              slices.without.gaps = slices.without.gaps, slices.excluded = slices.excluded,
              slices.too.gappy = slices.too.gappy))
}

###############################  create iteration datacube   ###################


GapfillNcdfCreateItercube  <- function(datacube, iters.n, dims.cycle.length, 
    dims.cycle.id, slices.process, max.cores, slices.n, MSSA, MSSA.blocksize,
    MSSA.blck.trsh)
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
    ind.process.cube <- array(FALSE,dim = c(iters.n, dims.cycle.length))    
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
    #remove ocean cells
    if (sum(!slices.process) > 0) {
      ind.process.cube[ind.datacube(ind.process.cube, slices.remove, c(2,3))] <- FALSE
      rows.remove <- apply(ind.process.cube,1,function(x){sum(x)==0})
      if (sum(rows.remove) > 0) {
        ind.process.cube <- ind.process.cube[!rows.remove,,]
        iters.n <- iters.n - sum(rows.remove)
      } 
    }  
  } else if (!MSSA) {
    ind.process.cube           <- array(FALSE,dim = c(slices.n, dims.cycle.length))        
    args.expand.grid     <- alist()
    for (d in 1:length(dims.cycle.id + 1)) args.expand.grid[[d]] <- 
          1:dim(datacube)[dims.cycle.id[d] + 1]    
    iter.grid.all <- cbind(1:slices.n, as.matrix(do.call("expand.grid",
                                                         args.expand.grid)))
    iter.grid.process    <- iter.grid.all[slices.process, ]   
    ind.process.cube[iter.grid.process] <- TRUE
    ind.process.cube       <- array(ind.process.cube[slices.process], 
                                    dim = c(iters.n, dims.cycle.length))
    index.MSSAseries     <- (1:slices.n)[slices.process]
  }
  max.cores              <- min(c(iters.n, max.cores))
  iters.per.cyc          <- rep(floor(iters.n / max.cores), times = max.cores)
  if (!(iters.n %% max.cores) == 0)
    iters.per.cyc[1:((iters.n %% max.cores))] <- floor(iters.n / max.cores) + 1
  iter.gridind           <- matrix(NA, ncol = 2, nrow = max.cores)
  colnames(iter.gridind) <- c('first.iter','last.iter')
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
    vars.amnt <- dim(dummy[[1]][['variances']])[2]
    cube.cols <- sum(sapply(dummy,function(x)dim(x[['reconstruction']])[1]))
    reconstruction <- matrix(unlist(lapply(dummy, function(x)as.vector(t(x[[1]])))),
                             nrow = cube.cols, byrow = TRUE)
    variances      <- matrix(unlist(lapply(dummy, function(x)as.vector(t(x[[2]])))),
                             ncol = vars.amnt, byrow = TRUE)
    iloops.converged<- unlist(lapply(dummy, function(x)as.vector(t(x[[3]]))))
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
  ##TODO
  #remove h
  iter.ind         <- iter.gridind[iter.nr, ]
  datapts.n        <- prod(dim(datacube)[dims.process.id + 1])
  n.series.steps   <- numeric()

  if (MSSA)  {
    ind.t          <- rep(FALSE, times = dim(ind.process.cube)[1])
    ind.t[iter.ind[1]:iter.ind[2]]       <- TRUE
    n.series.core  <- sum(ind.process.cube[ind.datacube(ind.process.cube, 
                                                        ind.t, dims = 1)])
  } else {
    n.series.core  <- (diff(iter.ind) + 1)
  }  
  data.results.iter<- array(NA, dim = c(n.series.core , datapts.n))
  variances        <- array(NA, dim = c(diff(iter.ind) + 1, args.call.SSA[['n.comp']]))
  iloops.converged  <- array(NA, dim = c(diff(iter.ind) + 1))
  
  for (n in 1:(diff(iter.ind) + 1)) {
    ind.total = rep(FALSE, iters.n)
    ind.total[(iter.ind[1] : iter.ind[2])[n]] = TRUE 
    data.results.iter.t = try({
      if (iter.nr == 1 &&( diff(iter.ind) < 20  || 
            (n %% (ceiling((diff(iter.ind)) / 20)) == 0)))
        if (print.status)
          cat(paste(Sys.time(), ' : Finished ~',
                    round(n / (diff(iter.ind) + 1) * 100), '%. \n', sep=''))
      ind.act.cube <- array(ind.process.cube[ind.datacube(ind.process.cube, 
                                                          ind.total, 1)],
                            dim = dims.cycle.length)
      ##TODO check how this behaves in non MSSA mode
      n.series.steps[n]       <- sum(ind.act.cube)
      dims.extr.data          <- dims.process.length
      aperm.extr.data         <- 1:(length(dims.process.id) + 1)
      args.call.t             <- args.call.SSA
      args.call.t[['seed']]   <- iter.nr * n       
      if (MSSA) {
        dims.extr.data        <- c(dims.extr.data, n.series.steps[n])
        aperm.extr.data       <- c(2,1)
        perm.before           <- 1:2
      } else {
        perm.before           <- order(dims.process.id)
      }
      series.noperm           <- array(datacube[ind.datacube(datacube, 
                                                             ind.act.cube, 
                                                             dims.cycle.id+1)],
                                       dim =  dims.extr.data)
      args.call.t[['series']] <- aperm(series.noperm, perm = perm.before)
      if (!(class(first.guess) == 'character' && first.guess == 'mean')) {
        fg.noperm  <- array(first.guess[ind.datacube(first.guess, ind.act.cube,
                                                     dims.cycle.id+1)], 
                            dim =  dims.extr.data)
        args.call.t[['first.guess']] <- aperm(fg.noperm, perm = perm.before)         
      }
   
      series.filled       <- do.call(GapfillSSA, args.call.t)
      list(reconstruction = aperm(array(series.filled$reconstr,
             dim = c(dims.process.length, n.series.steps[n])),
             aperm.extr.data), variances = series.filled$variances,
           iloop_converged = sum(!(series.filled$iloop_converged)))
    })
    if (class(data.results.iter.t) == 'try-error') {
      print(paste('Error occoured at iteration ', iter.nr, ' and loop ', n, '!', sep = ''))
      print(data.results.iter.t)
      error.from.calc                 <- data.results.iter.t
      data.results.iter.t             <- matrix(Inf, ncol = datapts.n, nrow = 1)
      system.info                     <- sessionInfo()
      file.name.t                     <- paste('workspace_error_', file.name, '_',
                                               iter.nr, '_', n, sep = '')
      print(paste('Saving workspace to file ', file.name.t, '.rda', sep = ''))
      dump.frames(to.file = TRUE, dumpto = file.name.t)
    }
    ind.results <- (1 : n.series.steps[n]) + (((n>1) * 
            (sum( n.series.steps[1 : max(c(n - 1, 1))]))))  
    data.results.iter[ind.results, ]  <- array(data.results.iter.t$reconstruction, 
                                               dim = c(n.series.steps[n], datapts.n))
    variances[n, ]                    <- as.vector(data.results.iter.t$variances)
    iloops.converged[n]               <- data.results.iter.t$iloop_converged
  }
  return(list(reconstruction = data.results.iter, variances = variances, 
              lioops.converged = iloops.converged))
}
