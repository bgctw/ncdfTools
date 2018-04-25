#require(testthat)
context('fluxnet')

.tmp.f <- function(){
  bgiDir <- '~/bgi'
  path <- file.path(bgiDir, 'data/DataStructureMDI/DATA/site/Fluxnet/halfhourly/level5_new_v2_newRpot_UncNew/Data')
  sites <- c('DE-Wet.2002.2006.hourly.nc','DK-Ris.2004.2005.hourly.nc')
  time.ends <- structure(c(ISOdate(2004,1,1,0,0,0,tz = "UTC"), ISOdate(2005,1,1,0,0,0,tz = "UTC")), tzone = "UTC")
  pars <- c("NEE_f_UncNew","NEE_fsd_UncNew","NEE_fqcOK","Rg_f","Rg_fqcOK", "Tair_f","Tair_fqcOK")
  ans <- readFLUXNETNcdf(path, sites, pars = pars, time.ends = time.ends)
}

