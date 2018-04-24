readFLUXNETNcdf <- function(
  ### read data from FLUXNET Ncdf file.
  path = getwd()  ##<< character string: path to the input file(s)
  , sites         ##<< character string: ids of the sites to extract
  , pars = 'all'  ##<< character string: names of the variables to extract
  , time.ends     ##<< POSIXct object: start and end date of the period to extract.
  , dim.borders = list(1)##<< list: indices for other dimensions
  ){
  owd <- setwd(path)
  on.exit(setwd(owd))
  # times      <- seq(
  #   from = time.ends[1], to = time.ends[2], by = "30 min")
  times <- seq.dates(
    from=as.chron(time.ends[1]), to = as.chron(time.ends[2])
    , by = chron::times("00:30:00"))
  file.test  <- list.files()[grep(sites[1], list.files())]
  ## get all var names if not supplied
  if (length(pars) == 1 && pars == 'all') {
    pars = infoNcdfVars(file.test)$name
  }
  data.extr <- array(NA, dim = c(
    length(sites), length(pars), length(times), length(dim.borders)))
  dimnames(data.extr) <- list(sites, pars, as.character(times))
  ##TODO make the datacube size more general and universal   
  counter = 0 
  processSite <- function(site.t){
    # body of loop across sites, in function so that on.exit can be used
    # for closing the ncdf file
    file.ind  <- grep(site.t, list.files())
    if (length(file.ind) == 0)
      stop('File for ', site.t, ' is missing.')
    if (length(file.ind) > 1)
      stop(site.t, 'is a non unique or missing site name.')
    file.t       <- list.files()[file.ind]
    con.data     <- open.nc(file.t)
    on.exit(close.nc(con.data))
    timevec.t    <- var.get.nc(con.data, 'time')
    time.vec.t.R <- as.chron(convertDateNcdf2R(timevec.t, units = 'days'))
    #
    timevec.ends <- time.vec.t.R[c(1,length(timevec.t))]
    ind.start    <- which(abs(times - timevec.ends[1]) == 
                            min(abs(times - timevec.ends[1])))
    ind.end      <- which(abs(timevec.ends[2] - times) == 
                            min(abs(timevec.ends[2] - times)))
    values.use   <- which(time.vec.t.R >= as.chron(time.ends[1]) &  
                            time.vec.t.R <= as.chron(time.ends[2]))
    vars.available <- infoNcdfVars(con.data)$name
    for (par.t in pars) {
      if (is.element(par.t, vars.available)) {
        data.read <-  var.get.nc(con.data, par.t)
        dim.create <- c(
          dim(data.read)[1], max(c(dim(data.read)[2], 1), na.rm = TRUE))               
        for (j in 1:length(dim.borders))
          if (dim.borders[[j]] > dim.create[2]) stop(
            par.t, 'in file ', file.t, 'does not have', dim.borders[[j]]
            , 'dimensions!')
        data.extr[site.t, par.t, ind.start:ind.end, j] <- 
          rowSums(matrix(array(data.read, dim = dim.create)[
            , dim.borders[[j]]], ncol = length(dim.borders[[j]])) )[values.use]
      }
    }
  }
  for (site.t in sites) {
    processSite(site.t)
    counter = counter + 1
    print(paste('finished file ', counter, ' of ', length(sites), sep = ''))    
  }
  ##value<< array: FLUXNET data
  return(data.extr)
}
