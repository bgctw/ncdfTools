readNcdfTime  =  function(
  ### read the time from netCDF and convert to POSIXct
  time.source ##<< numeric vector or ncdf connection: either a file name or a 
  ##  ncdf file connection
  , timeVar = 'time'  ##<< variable holding the values of time
  , tzone = "UTC"     ##<< timezone formatting applied to the return value.
) {
  if (class(time.source) ==  'character') {
    if (file.exists(time.source)) {
      time.source = open.nc(time.source)
      on.exit(close.nc(time.source))
    } else stop('File ', time.source, ' is not existent.')
  }
  if (class(time.source) == 'NetCDF') {
    attget.result <- try({
      infoAttsTime <- infoNcdfAtts(time.source, timeVar)
      units.file      <- infoAttsTime[, 'value'][infoAttsTime[, 'name'] == 'units']
    }, silent = TRUE)
    date.vec     <- as.numeric(var.get.nc(time.source, timeVar)) 
  } else stop('time.source needs to be a filename or a ncdf file connection!')
  time.out <- ncdf2POSIX(date.vec, units.file, tzone = tzone)
  ##value<< POSIXct vector: time vector in native R format
  return(time.out)
}

