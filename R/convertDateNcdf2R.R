convertDateNcdf2R  =  function(
##title<< convert ncdf time vector to POSIXct
        time.source ##<< numeric vector or ncdf connection: either a number of time units since
                    ##   origin or a ncdf file connection, In the latter case, the time 
                    ##   vector is extracted from the ncdf file, This file, and especially the 
                    ##   time variable, has to follow the CF ncdf conventions.
        , units = 'days' ##<< character string: units of the time source. If the source
                    ##   is a ncdf file, this value is ignored and is read from that file.
        , origin = as.POSIXct('1582-10-14', tz = 'UTC'
                    ##<< POSIXct object: origin or day/hour zero of the time
                    ##   source. If the source is a ncdf file, this value is ignored and is read from that file.
            )
)
  ##description<< This function converts a time vector from a ncdf file or a vector of Julian days (or seconds, minutes, hours)
  ##              since a specified origin into a POSIXct R vector.
{
  require(RNetCDF, warn.conflicts = FALSE, quietly = TRUE)
  if (class(time.source) == 'NetCDF') {
    attget.result <- try({
      time.units      <- infoNcdfAtts(time.source, 'time')[, 'value'][infoNcdfAtts(time.source, 'time')[, 'name'] == 'units']
      origin.file     <- as.POSIXct(sub('^.*since ', '', time.units), tz = 'UTC')
    }, silent = TRUE)
    if ((class(attget.result) == 'try-error') || !(sub(' since.*$', '', time.units) == 'days')) {
      cat('Date format in ncdf file is in a non implemented format.\n')
      return(var.get.nc(time.source, 'time'))
    }    
    units          <- sub(' since.*$', '', time.units)
    date.vec.conv  <- as.numeric(var.get.nc(time.source, 'time') + julian(origin.file, as.POSIXct(origin)))
  } else {
    if (!is.numeric(time.source))
      stop('time.source needs to be numeric if not a ncdf file connection!')
    date.vec.conv  <- time.source
  }
  if (!is.element(units, c('seconds', 'minutes', 'hours', 'days')))
    stop(paste('Unit ', units, ' is not implemented.', sep  =  ''))
  multiplicator      <- switch(units, days = 60 * 60 * 24, hours = 60 * 60, minutes = 60, seconds = 1)
  time.out           <- as.POSIXct(date.vec.conv * multiplicator, origin = origin, tz = 'UTC')
  time.out                ##value<< POSIXct vector: time vector in native R format
}

