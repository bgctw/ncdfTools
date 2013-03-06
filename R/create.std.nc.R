create.std.nc = function
    ##title<< create an empty ncdf file with standardized attributes and dimensions
    ##description<< This function writes an empty ncdf file with variable names, dimensions and
    ##              attributes formated in a standardized way.
       (
    var.names            ##<< character string: name of the target variable in the file
    , file.name = c()    ##<< character string: name of the file. If not given, this
                         ##   is determined automatically in a standardized way from 
                         ##   the variable name and the dimension extends.
    , units = '[]'       ##<< character string: units of variable (should be compatible with udunits)
    , lat.values = c()   ##<< numeric values: coordinate values for the latitude
                         ##   positions.
    , long.values = c()  ##<< numeric values: coordinate values for the latitude
                         ##   positions.
    , time.values = c()                     ##<< POSIXct vector: time values for the time dimension
    , lat.length  = length(lat.values)      ##<< integer: length of the latitude dimension
    , long.length = length(long.values)     ##<< integer: length of the longitude dimension
    , year.start.end = c()   ##<< integer vector (length two): start and end year.
                             ##   If not given, this is determined from the time
                             ##   vector.
    , scale_factor = 1       ##<< numeric: scale factor
    , add_offset = 0         ##<< numeric: offset
    , type.var = 'NC_DOUBLE' ##<< character string: type of the data
    , missing_value = -9999  ##<< numeric: missing data value
    , con.atts = c()         ##<< RNetCDF file connection: Possible file to use as
                             ##   for copying attributes to the new file.
)
{
  require(RNetCDF)
  #copy attributes etc from other ncdf file (if chosen)
  if (class(con.atts) == 'NetCDF') {
    atts.file <- ncdf.get.attinfo(con.atts, ncdf.get.varname(con.atts))
    pars = c('units', 'scale_factor', 'add_offset', 'missing_value')
    for (par.t in pars) {
      val.var = atts.file[atts.file[,1] == par.t][2]
      if (!par.t == 'units')
        val.var = as.numeric(val.var)
      if (!is.na(val.var))
        assign(par.t, val.var)
    }
    type.var = var.inq.nc(con.atts, ncdf.get.varname(con.atts))$type
  }  
  
  if (length(year.start.end) == 0 & length(time.values) != 0)
    year.start.end  <- as.integer(format(time.values[c(1,length(time.values))], '%Y'))
  
  if(sum(c(lat.length,long.length,time.length) == 
          c(length(lat.values),length(long.values), length(time.values)))!=3)
     stop('lat(long/time.values need to have the same length as the respective length arguments!')
  if (length(time.values) > 0 && !is.element(class(time.values)[1],c('POSIXlt', 'POSIXct')))
     stop('time.values needs to be of class POSIXct!') 
  if (time.length > 0 && length(year.start.end)!=2)
     stop('Supply values for the start and the end year!') 
  if(length(file.name) == 0) {
     file.name = paste(var.names, paste(c(lat.length, long.length, time.length),collapse='.'), 'nc', sep = '.')
  } else if (!grepl('[.]nc',file.name)){
    file.name <- paste(file.name, '.nc', sep='')
  } 
  
  file.con  <- create.nc(file.name)
  
  if (0 != lat.length) {
    dim.def.nc(file.con, 'latitude', dimlength = lat.length)
    var.def.nc(file.con, 'latitude','NC_DOUBLE', 'latitude')
    ncdf.def.all.atts(file.con,'latitude',atts = list(long_name = "latitude",units = "degrees_north" ,
            standard_name = "latitude"))       
    if (length(lat.values) > 0)
      var.put.nc(file.con, 'latitude', lat.values[order(lat.values, decreasing = TRUE)])  
  }   
  if (0 != long.length) {    
    dim.def.nc(file.con, 'longitude', dimlength = long.length)
    var.def.nc(file.con, 'longitude','NC_DOUBLE', 'longitude')
    ncdf.def.all.atts(file.con,'longitude',atts = list(long_name = "longitude",units = "degrees_east" ,
            standard_name = "longitude"))
    if (length(long.values) > 0)
      var.put.nc(file.con, 'longitude', long.values[order(long.values)])  
  }   
  if (0 != time.length) { 
    dim.def.nc(file.con, 'time', dimlength = time.length)
    var.def.nc(file.con, 'time','NC_DOUBLE', 'time')
    ncdf.def.all.atts(file.con,'time',atts = list(long_name = "time",units = "days since 1582-10-14 00:00" ,
            calendar = "gregorian"))     
    if (length(time.values) > 0) {
      time.ncdf <- as.numeric(julian(time.values, origin = as.POSIXct("1582-10-14", tz="UTC")))
      var.put.nc(file.con, 'time', time.ncdf)

    }     
  }   
  
  dims.used  <- c('latitude', 'longitude', 'time')[c(0!=lat.length ,0!=long.length,0!=time.length)]
  for (var.name.t in var.names) {
    var.def.nc <- var.def.nc(file.con, var.name.t, type.var, dims.used)
    ncdf.def.all.atts(file.con, var.name.t, atts = list(scale_factor = scale_factor, add_offset = add_offset,
                                              missing_value = missing_value, `_FillValue` = missing_value, units = units))
  }
  hist_string <- paste('File created on ', Sys.time(), ' by ', Sys.info()['user'] , sep = '')
  att.put.nc(file.con, 'NC_GLOBAL', 'history', 'NC_CHAR', hist_string)
  close.nc(file.con)
  cat(paste('Created file', file.name), '\n')
  invisible(file.name)
}
