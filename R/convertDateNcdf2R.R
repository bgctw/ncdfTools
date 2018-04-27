convertDateNcdf2R  =  function(
  ### convert ncdf time vector to POSIXct
  time.source ##<< numeric vector or ncdf connection: either a number of time 
  ##   units since origin or a ncdf file connection, In the latter case, the time 
  ##   vector is extracted from the ncdf file, This file, and especially the 
  ##   time variable, has to follow the CF ncdf conventions.
  , units = 'days' ##<< character string: units of the time source. If the source
  ##   is a ncdf file, this value is ignored and is read from that file.
  , origin = ISOdatetime(1582,10,15,0,0,0, tz = 'UTC') ##<< POSIXct object:
  ##   Origin or day/hour zero of the time source. If the source
  ##   is a ncdf file, this value is ignored and is read from that file.
  , time.format =  character() ##<< may specify parsing format for time unit
  , timeVar = 'time'  ##<< variable holding the values of time
) {
  ##description<< This function converts a time vector from a ncdf file or a 
  ## vector of Julian days (or seconds, minutes, hours)
  ## since a specified origin into a POSIXct R vector.
  # usage gets to long, if specified as default
  if (!length(time.format)) time.format <- c(
    '%Y-%m-%d', '%Y-%m-%d %H:%M:%S', '%Y-%m-%d %H:%M'
    , '%Y-%m-%d %Z %H:%M', '%Y-%m-%d %Z %H:%M:%S')
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
      origin.char     <- sub('^.*since ', '', units.file)
      units <-  sub(' since.*', '', units.file)
    }, silent = TRUE)
    for (formatT in time.format) {
      origin <- strptime(origin.char, format = formatT,  tz =  'UTC')
      if (!is.na(origin))
        break
    }
    if (is.na(origin))
      stop('Not possible to determine origin. Wrong format supplied?')
    date.vec     <- as.numeric(var.get.nc(time.source, timeVar)) 
  } else {
    if (!is.numeric(time.source))
      stop('time.source needs to be numeric if not a ncdf file connection!')
    date.vec  <- time.source
  }
  if (!is.element(units, c('seconds', 'minutes', 'hours', 'days')))
    stop(paste('Unit ', units, ' is not implemented.', sep  =  ''))
  multiplicator      <- switch(
    units, days = 60 * 60 * 24, hours = 60 * 60, minutes = 60, seconds = 1)
  time.out <- origin + date.vec * multiplicator
  # twutz??
  if (origin < ISOdatetime(1582,10,30,0,0,0, tz = 'UTC')) 
    time.out <- time.out + 10 * 24 * 60 * 60
  ##value<< POSIXct vector: time vector in native R format
  return(time.out)
}

