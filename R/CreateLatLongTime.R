createLatLongTime <- function(
  ##title<< create empty lat/lon/time ncdf file
  file.name                           ##<< character string: name of the target file.
  , var.names = sub('[.]nc', '', file.name) ##<< character vector: names of the variables
                                      ##         in the target file.
  , lat.values = c()                  ##<< numeric values: coordinate values for the latitude
                                      ##   positions.
  , long.values = c()                 ##<< numeric values: coordinate values for the latitude
                                      ##   positions.
  , time.values = c()                 ##<< POSIXct vector: time values for the time dimension
  , lat.length  = length(lat.values)  ##<< integer: length of the latitude dimension
  , long.length = length(long.values) ##<< integer: length of the longitude dimension
  , time.length = length(time.values) ##<< integer: length of the time dimension
  , scale_factor = 1       ##<< numeric: scale factor
  , add_offset = 0         ##<< numeric: offset
  , type.var = 'NC_DOUBLE' ##<< character string: type of the data
  , missing_value = -9999  ##<< numeric: missing data value
  , units = '[]'           ##<< character string: units of the variables in target file.  
)
  ##description<<
  ## this function creates an empty standardized latitude/longitude/time ncdf file.
  ##value <<
  ## nothing is returned.
  ##author<<
  ## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  ##TODO: units has to work with more than one variable
  require(RNetCDF)
  file.con  <- create.nc(file.name)
  
  if (0 != lat.length) {
    dim.def.nc(file.con, 'latitude', dimlength = lat.length)
    var.def.nc(file.con, 'latitude','NC_DOUBLE', 'latitude')
    ncdf.def.all.atts(file.con, 'latitude', atts = list(long_name = "latitude",
                                              units = "degrees_north" ,
            standard_name = "latitude"))       
    if (length(lat.values) > 0)
      var.put.nc(file.con, 'latitude', lat.values[order(lat.values, decreasing = TRUE)])  
  }   
  if (0 != long.length) {    
    dim.def.nc(file.con, 'longitude', dimlength = long.length)
    var.def.nc(file.con, 'longitude','NC_DOUBLE', 'longitude')
    ncdf.def.all.atts(file.con,'longitude',atts = list(long_name = "longitude",
                                             units = "degrees_east" ,
            standard_name = "longitude"))
    if (length(long.values) > 0)
      var.put.nc(file.con, 'longitude', long.values[order(long.values)])  
  }   
  if (0 != time.length) { 
    dim.def.nc(file.con, 'time', dimlength = time.length)
    var.def.nc(file.con, 'time','NC_DOUBLE', 'time')
    if (length(time.values) > 0) {
      if (inherits(time.values, c('POSIXlt', 'POSIXct'))) {
        ncdf.def.all.atts(file.con,'time',atts = list(long_name = "time",units = "days since 1582-10-14 00:00" ,
                                            calendar = "gregorian"))     
        time.values <- as.numeric(julian(time.values, origin = as.POSIXct("1582-10-14", tz="UTC")))
      }
      var.put.nc(file.con, 'time', time.values)
    }     
  }

  # define attributes
  dims.used  <- c('latitude', 'longitude', 'time')[c(0 != lat.length, 0 != long.length, 0 != time.length)]
  for (var.name.t in var.names) {
    var.def.nc <- var.def.nc(file.con, var.name.t, type.var, dims.used)
    ncdf.def.all.atts(file.con, var.name.t, atts = list(scale_factor = scale_factor,
                                              add_offset = add_offset,
                                              missing_value = missing_value,
                                              `_FillValue` = missing_value, units = units))
  }
  hist_string <- paste('File created on ', Sys.time(), ' by ', Sys.info()['user'] , sep = '')
  att.put.nc(file.con, 'NC_GLOBAL', 'history', 'NC_CHAR', hist_string)
  close.nc(file.con)
  cat(paste('Created file', file.name), '\n')
}
