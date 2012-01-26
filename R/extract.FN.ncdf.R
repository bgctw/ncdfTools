extract.FN.ncdf <- function(path = getwd(), sites, pars, time.ends, dim.borders) 
{
  require(RNetCDF)
  require(chron)
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
    timevec.ends <- as.chron(date.ncdf2R(timevec.t[c(1,length(timevec.t))], units = 'days'))
    ind.start    <- which(abs(times - timevec.ends[1]) == min(abs(times - timevec.ends[1])))
    ind.end      <- which(abs(times - timevec.ends[2]) == min(abs(times - timevec.ends[2])))
    
    vars.available <- ncdf.get.varinfo(con.data)[,'name'] 
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
  setwd(path)
  return(data.extr)
}
