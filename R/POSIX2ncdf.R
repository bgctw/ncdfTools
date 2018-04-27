ncdf2POSIX <- function(
  ### convert ncdf time to POSIXct
  x  ##<< POSIXct vector
  , unit = "days since 1582-10-15 00:00" ##<< unit in which x is given
){
  # if (!requireNamespace("udunits2")) stop(
  #   "need to install udunits2 package before calling ncdf2POSIX")
  # udunits2::ud.convert(
  #   as.numeric(x), unit, "seconds since 1970-01-01")
  utcal.nc(unit, x, type = "c")
}

POSIX2ncdf <- function(
  ### convert POSIXct to ncdf time
  x  ##<< ncdf time
  , unit = "days since 1582-10-15 00:00" ##<< unit to convert to
){
  # if (!requireNamespace("udunits2")) stop(
  #   "need to install udunits2 package before calling POSIX2ncdf")
  # udunits2::ud.convert(
  #   as.numeric(x), "seconds since 1970-01-01", unit)
  utinvcal.nc(unit,x)
}
attr(POSIX2ncdf,"ex") <- function(){
  timesOrig <- seq(
    ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
  unit <- "days since 1582-10-15 00:00"
  timesDays <- POSIX2ncdf(timesOrig, unit)
  timesPosix <- ncdf2POSIX(timesDays, unit)
  all( timesPosix == timesOrig)
}


.daysSinceOrigin2POSIX <- function(
  ### convert julian days since origin to POSICct time
  x  ##<< POSIXct vector
  , origin = ISOdatetime(1582,10,15,0,0,0, tz = 'UTC') ##<
  ## default is the start of the Gregorian calendar
){
  ##seealso<< \code{\link{.POSIX2DaysSinceOrigin}}
  ##details<< converts unit "days since 1582-10-15 00:00"
  ## the start of the gregorian calencar to POSIXct
  origin + x*3600*24
}

.POSIX2DaysSinceOrigin <- function(
  ### convert POSICct time to julian days since
  x  ##<< POSIXct vector
  , origin = ISOdatetime(1582,10,15,0,0,0, tz = 'UTC') ##<
  ## default is the start of the Gregorian calendar
){
  ##seealso<< \code{\link{daysSinceOrigin2POSIX}}
  ##details<< converts a POSIXct to unit "days since 1582-10-15 00:00"
  ## the start of the gregorian calencar
  as.numeric(julian(x, origin = origin))
}
attr(.POSIX2DaysSinceOrigin,"ex") <- function(){
  timesOrig <- seq(
    ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
  timesDays <- .POSIX2DaysSinceOrigin(timesOrig)
  timesPosix <- .daysSinceOrigin2POSIX(timesDays)
  all( timesPosix == timesOrig)
}
