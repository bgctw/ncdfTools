CheckInputNcdfSSA <- function(SSAprocess, ...)
{
  ##title<< helper function for Ncdf SSA routines
  ##details<< helper function for Ncdf SSA routines that checks the consistency of the 
  ##          input paramters.
  ##seealso<<
  ##\code{\link{GapfillNcdf}}, \code{\link{DecomposeNcdf}} 
    
  ##TODO
  # include test for MSSA and windowlength=1
  
  ##TODO
  #check for tresh.fill.first
  #check input file
  ##TODO add checks
  ## - single dimension variances and thresh.fill.first, tresh.fill
  ## - facilitate old school SSA via gaps.cv, max.steps = 1, amnt.artgaps !=0 and length(dimensions) == 1
  ##TODO check intercorelation between ratio.test and gaps.cv
  require(BGIFileChecks, warn.conflicts = FALSE, quietly = TRUE)
  args <- list(...)
      
  if (is.null(args$file.name) )
    stop('file.name needs to be supplied!')
  
  if (!file.exists(args$file.name))
    stop('Input ncdf file not found. Check name!')
  if (SSAprocess == 'Decompose') {
     dims.check  <- 'time'
  } else {
     dims.check <- unique(unlist(args$dimensions))
  }  
  check.passed <- CheckNcdfFile(file.name = args$file.name, 
                                 dims = dims.check, 
                                 type = 'relaxed') 
  if (!check.passed)
    stop('NCDF file not consistent with CF ncdf conventions!')
  file.con.orig <- open.nc(args$file.name)
  if (args$var.names[1] != 'auto')
    for (var.name in args$var.names)
      if (!is.element(var.name, ncdf.get.varinfo(file.con.orig)$name))
        stop(paste('Variable name ', var.name, 'does not exist in ncdf file!', sep = ''))
  
  if(sum(is.na(match(unique(unlist(args$dimensions)), c('longitude', 'latitude', 'time')))) > 0)
    stop('Every dimensions value has to be one of time, longitude, latitude!')
  dims.not.exist <- is.na(match(unlist(args$dimensions), ncdf.get.diminfo(file.con.orig)[, 'name']))
  if(sum(dims.not.exist) > 0)
    stop(paste('Dimension(s) ', paste(unlist(args$dimensions)[dims.not.exist], collapse = ', '),
            'not existent in ncdf file!', sep = ''))

  if (SSAprocess == 'Decompose' ) {
    if (is.null(args$borders.wl))
      stop('Argument borders.wl needs to be supplied!')
    if (!class(args$borders.wl) == 'list')
      stop('Wrong class for borders.wl! Needs to be a list!')
    args.return    <- list(file.con.orig = file.con.orig)    
  } else if (SSAprocess == 'Gapfill') {
    ## check first guess file
    name.first.guess.std <- paste(sub('.nc', '', args$file.name),'_first_guess_step_1.nc', sep = '')
    if (!(args$first.guess == 'mean')) {
      if (!(file.exists(args$first.guess))) {
        stop('Specified first.guess file not existent!')
      } else if (!(args$first.guess == name.first.guess.std)) {
        stop('Name for supplied first guess file does not fit the standardized scheme!')
      }
      check.passed = CheckNcdfFile(file.name = args$first.guess, 
        dims = ncdf.get.diminfo(file.con.orig)[, 'name'], 
        type = "relaxed")
      if (!check.passed)
        stop('First guess NCDF file not consistent with CF ncdf conventions!')
    }
    
    ##transfer and check ocean mask
    lengths.dim.nontime <- ncdf.get.diminfo(file.con.orig)['length'][!(ncdf.get.diminfo(file.con.orig)['name'] == 'time')]
    
    if (!is.null(args$ocean.mask) && class(args$ocean.mask) == 'character') {
      if (!(file.exists(args$ocean.mask)))
        stop('File for ocean mask not existent!')
      check.passed <- CheckNcdfFile(file.name = args$ocean.mask, 
                                      dims=c('longitude', 'latitude'), type = 'relaxed')
      if (!check.passed)
        stop('ocean mask NCDF file not consistent with CF ncdf conventions!')
      con.ocean   <- open.nc(args$ocean.mask)
      var.names.t <- ncdf.get.varinfo(con.ocean)[, 'name']
      var.name.om <- var.names.t[is.na(match(var.names.t, c('time', 'longitude', 'latitude')))]
      if (length(var.name.om) > 1)
        stop('More then one variable existent in ocean mask!')
      for (par.check in c('longitude', 'latitude')) {
        if(!identical(var.get.nc(file.con.orig, par.check), 
                      var.get.nc(con.ocean, par.check)))
          stop(paste(par.check,' values need to be identical in ocean.mask and',
                     'input ncdf file!'))
      }
      ocean.cells <- var.get.nc(con.ocean, var.name.om)
      args$ocean.mask  <- array(FALSE, dim = dim(ocean.cells))
      args$ocean.mask[ocean.cells == 1 ] <- TRUE
      data.orig      <- var.get.nc(file.con.orig, ncdf.get.varname(file.con.orig))
      oceancells.data<- sum(!is.na(data.orig[ind.datacube(data.orig, args$ocean.mask, c(1,2))]))
      if (oceancells.data > 0)
        stop('Some ocean cells seem to contain data. Is the ocean.mask file correctly set up?')
      close.nc(con.ocean)
    }
    if (length(args$ocean.mask) > 0 && !(dim(args$ocean.mask) == lengths.dim.nontime))
    stop(paste('The ocean mask has to have identical dimensions as the spatial',
               ' dimensions in the ncdf file!', sep = ''))
    
    ## check consitency of input   
    n.steps           <- length(args$amnt.artgaps)
    if (!is.element(args$process.cells, c('gappy', 'all')))
      stop('process.cells has to be one of \'all\' or \'gappy\'!')
    if (!is.element(args$process.type, c('stepwise', 'variances')))
      stop('process.type has to be one of \'stepwise\' or \'variances\'!')
    if (args$max.cores > 1 & !args$calc.parallel)
      stop('More than one core can only be used if calc.parallel==TRUE!')
    if(all(unlist(c(args$tresh.fill, args$tresh.fill.first)) < 0 | unlist(c(args$tresh.fill, args$tresh.fill.first)) > 1))
      stop('All values in tresh.fill (and tresh.fill.first) need to be between 0 and 1!')
    if (args$process.type == 'variances') {
      args.check <- c('dimensions', 'n.comp', 'M', 'amnt.artgaps', 'size.biggap', 'tresh.fill')
      n.dims     <- length(args$dimensions[[1]])
      for (m in 1:length(args.check)) {
        if (length(args[[args.check[m]]][[1]]) != n.dims)
          stop(paste(args.check[m],' needs to be of the same length as dimensions',
                     '[[1]] for process.type == \'variances\'!', sep = ''))
        if(!(class(args[[args.check[m]]])) == 'list')
          stop(paste('Argument ',args.check[m], ' is not a list!'))
        if (length(args[[args.check[m]]]) != 1)
          stop(paste(args.check[m],' needs to be of length 1 for process.type ==',
                   ' \'variances\' !', sep = ''))
      }
    }  else if (args$process.type == 'stepwise') {
      args.list = c('amnt.artgaps', 'size.biggap', 'n.comp', 'M', 'pad.series', 
        'tresh.fill', 'amnt.iters', 'amnt.iters.start', 'MSSA')
      for (n in 1:length(args.list)) {
        if(class(args[[args.list[n]]]) != 'list')
          stop(paste('Argument ', args.list[n], ' is not a list!'))
        if (length(args[[args.list[n]]]) != length(args$dimensions))
          stop(paste('Argument ', args.list[n], ' has to be a list of the same ',
                     'length as dimensions for process.type == \'stepwise\'!'))
        ##      if (! all(sapply(get(args.list[n]), length) == 1 ))
        ##        stop(paste('Argument ', args.list[n], '[[1..n]] can only be a list of ',
        ##                   'length one for process.type == \'stepwise\'!', sep = ''))
      }
      for (i in 1:length(args$MSSA)) {
        for (j in 1:length(args$MSSA[i]))
          if (args$MSSA[[i]][[j]] & length(args$M[[i]][[j]]) != 2)
            stop('If MSSA ought to be computed, all corresponding Ms need to be of length 2.')
      } 
      for (o in 1:length(args$dimensions))
        if (sapply(args$dimensions[o] , function(x) length(x)) > 2)
          stop('Settings imply SSA with more than two dimensions which is not implemented.')
      step.wrong <- (unlist(args$tresh.fill) == 0 & (!(unlist(args$size.biggap) == 0) | 
                             !(all(unlist(args$amnt.artgaps) == 0))))
    }
    close.nc(file.con.orig)
    args.return <- list(ocean.mask = args$ocean.mask)
    
  }
  return(invisible(args.return))  
}
