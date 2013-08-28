readFLUXNETNcdf <- function(
  ##title<< read data from FLUXNET Ncdf file.
    path = getwd()  ##<< character string: path to the input file(s)
    , sites         ##<< character string: ids of the sites to extract
    , pars          ##<< character string: names of the variables to extract
    , time.ends     ##<< POSIXct object: start and end date of the period to extract.
    , dim.borders   ##<< list: values for other dimensions
  )
  ##description<<
  ## This function reads data from standard FLUXNET ncdf files and returns it in
  ## an R object.
{
  owd <- setwd(path)
  times = seq(from=as.chron(time.ends[1]), to = as.chron(time.ends[2]), by = times("00:30:00"))
  
  data.extr <- array(NA, dim = c(length(sites), length(pars), length(times), length(dim.borders)))
  dimnames(data.extr) <- list(sites, pars, as.character(times))
  
  ##TODO make the datacube size more general and universal 
  
  counter = 0 
  for (site.t in sites) {
    file.ind  <- grep(site.t, list.files())
    if (length(file.ind) > 1)
      stop(paste(site.t, 'is a non unique or missing site name.', sep= ''))
    
    file.t       <- list.files()[file.ind]
    con.data     <- open.nc(file.t)
    timevec.t    <- var.get.nc(con.data, 'time')
    timevec.ends <- as.chron(convertDateNcdf2R(timevec.t[c(1,length(timevec.t))], units = 'days'))
    ind.start    <- which(abs(times - timevec.ends[1]) == min(abs(times - timevec.ends[1])))
    ind.end      <- which(abs(timevec.ends[2]- times) == min(abs(timevec.ends[2] - times)))
    
    vars.available <- .infoNcdfVars(con.data)[,'name'] 
    for (par.t in pars) {
      if (is.element(par.t, vars.available)) {
        for (j in 1:length(dim.borders))    
           data.extr[site.t, par.t, ind.start:ind.end, j] <- 
               rowSums(matrix(var.get.nc(con.data, par.t)[, dim.borders[[j]]], ncol = length(dim.borders[[j]])) )
      }
    }
    close.nc(con.data)
    counter = counter + 1
    print(paste('finished file ', counter, ' of ', length(sites), sep = ''))    
  }
  setwd(owd)
  ##value<<
  ## array: FLUXNET data
  return(data.extr)
}
