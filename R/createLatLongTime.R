createLatLongTime <- function(
  ### create empty lat/lon/time ncdf file
  file.name                 ##<< character string: name of the target file.
  , var.names = sub('[.]nc', '', file.name) ##<< character vector: names of the 
                            ##  variablesin the target file.
  , lat.values = c()        ##<< numeric values: coordinate values for the latitude
                            ##   positions.
  , long.values = c()       ##<< numeric values: coordinate values for the latitude
                            ##   positions.
  , time.values = c()                 ##<< POSIXct vector: values for the time dimension
  , lat.length  = length(lat.values)  ##<< integer: length of the latitude dimension
  , long.length = length(long.values) ##<< integer: length of the longitude dimension
  , time.length = length(time.values) ##<< integer: length of the time dimension
  , scale_factor = 1       ##<< numeric: scale factor
  , add_offset = 0         ##<< numeric: offset
  , type.var = 'NC_DOUBLE' ##<< character string: type of the data
  , missing_value = -9999  ##<< numeric: missing data value
  , units = '[]'           ##<< character string: units of the variables in target file.  
  , timeVar = 'time'       ##<< the name of the time variable
  , user = Sys.info()['user'] ##<< user name put to history entry
) {
  ##details<<
  ## Creates an empty standardized latitude/longitude/time ncdf file.
  ##value<<
  ## Nothing is returned but a file is created. 
  ##TODO: units has to work with more than one variable
  file.con  <- create.nc(file.name)
  on.exit(close.nc(file.con))
  if (0 != lat.length) {
    dim.def.nc(file.con, 'latitude', dimlength = lat.length)
    var.def.nc(file.con, 'latitude','NC_DOUBLE', 'latitude')
    modifyNcdfDefAtts(  
      file.con, 'latitude'
      , atts = list(long_name = "latitude", units = "degrees_north"
                    , standard_name = "latitude"))       
    if (length(lat.values) > 0) var.put.nc(
      file.con, 'latitude', lat.values[order(lat.values, decreasing = TRUE)])  
  }   
  if (0 != long.length) {    
    dim.def.nc(file.con, 'longitude', dimlength = long.length)
    var.def.nc(file.con, 'longitude','NC_DOUBLE', 'longitude')
    modifyNcdfDefAtts(
      file.con,'longitude',atts = 
        list(long_name = "longitude", units = "degrees_east"
             , standard_name = "longitude"))
    if (length(long.values) > 0)
      var.put.nc(file.con, 'longitude', long.values[order(long.values)])  
  }   
  if (0 != time.length) { 
    dim.def.nc(file.con, timeVar, dimlength = time.length)
    var.def.nc(file.con, timeVar,'NC_DOUBLE', 'time')
    if (length(time.values) > 0) {
      if (inherits(time.values, c('POSIXlt', 'POSIXct'))) {
        modifyNcdfDefAtts(file.con,timeVar,atts = list(
          long_name = "time", units = "days since 1582-10-15 00:00" ,
          calendar = "gregorian"))     
        time.valuesDays <- .POSIX2DaysSinceOrigin(time.values)
      }
      var.put.nc(file.con, timeVar, time.valuesDays)
    }     
  }
  # define attributes
  dims.used  <- c('latitude', 'longitude', timeVar)[
    c(0 != lat.length, 0 != long.length, 0 != time.length)]
  for (var.name.t in var.names) {
    var.def.nc <- var.def.nc(file.con, var.name.t, type.var, dims.used)
    modifyNcdfDefAtts( file.con, var.name.t, atts = list(
      scale_factor = scale_factor
      , add_offset = add_offset
      , missing_value = missing_value
      , `_FillValue` = missing_value, units = units))
  }
  hist_string <- paste0(Sys.time(),': File created by ', user)
  att.put.nc(file.con, 'NC_GLOBAL', 'history', 'NC_CHAR', hist_string)
  message('Created file', file.name)
}