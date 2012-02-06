create.std.nc = function
    ##title<< create an empty ncdf file with standardized attributes and dimensions
    ##description<< This function writes an empty ncdf file with variable names, dimensions and
    ##              attributes formatted in a standardized way.
       (
    var.name               ##<< character string: name of the target variable in the file
    , var.units = '[]'       ##<< chracter string: units of variable (should be compatible with udunits)
    , lat.values = c()
    , long.values = c()
    , time.values = c()      ##<< POSIXct vector: time values for the time dimension
    , lat.length  = length(lat.values)      ##<< integer: length of the latitude dimension
    , long.length = length(long.values)     ##<< integer: length of the longitude dimension
    , time.length = length(time.values)     ##<< integer: length of the time dimension
    , year.start.end = c(0,0)
    , scale_factor = 1       ##<< numeric: scale factor
    , add_offset = 0         ##<< numeric: offset
    , type.var = 'NC_DOUBLE' ##<< character string: type of the data
    , missing_value = -9999) ##<< numeric: missing data value
{
  file.name = paste(var.name, paste(c(lat.length, long.length, time.length),collapse='.'), 'nc', sep = '.')
  
  file.con  <- create.nc(file.name)
  
  if (0 == lat.length) {
    dim.def.nc(file.con, 'latitude', dimlength = lat.length)
    var.def.nc(file.con, 'latitude','NC_DOUBLE', 'latitude')
    ncdf.def.all.atts(file.con,'latitude',atts = list(long_name = "latitude",units = "degrees_north" ,
            standard_name = "latitude"))       
  }   
  if (!is.null(long.length)) {    
    dim.def.nc(file.con, 'longitude', dimlength = long.length)
    var.def.nc(file.con, 'longitude','NC_DOUBLE', 'longitude')
    ncdf.def.all.atts(file.con,'longitude',atts = list(long_name = "longitude",units = "degrees_east" ,
            standard_name = "longitude"))
  }   
  if (!is.null(lat.length)) { 
    dim.def.nc(file.con, 'time', dimlength = time.length)
    var.def.nc(file.con, 'time','NC_DOUBLE', 'time')
    ncdf.def.all.atts(file.con,'time',atts = list(long_name = "time",units = "days since 1584-10-14 00:00" ,
            calendar = "gregorian"))       
  }   
  
  
  dims.used  <- c('longitude', 'latitude', 'time')[c(!is.null(lat.length),!is.null(long.length),!is.null(lat.length))]
  var.def.nc <- var.def.nc(file.con, var.name, type.var, dims.used)
  ncdf.def.all.atts(file.con, var.name, atts = list(scale_factor = scale_factor, add_offset = add_offset,
          missing_value = missing_value, `_FillValue` = missing_value, units = var.units))
  close.nc(file.con)
}
