createStdNcdfFile <- function(
  ### create an new ncdf file with standardized attributes and dimensions
  var.names = setdiff(names(data), timeVar)   ##<< string vector: 
  ## name of the target variables in the file
  , file.name = c()    ##<< character string: name of the file. If not given, this
  ##   is determined automatically in a standardized way from 
  ##   the variable name and the dimension extends.
  , units = '[]'       ##<< string vector: units of variable (should be 
  ## compatible with udunits)
  , lat.values = numeric()   ##<< numeric values: coordinate values for the latitude
  ##   positions.
  , long.values = numeric()  ##<< numeric values: coordinate values for the longitude
  ##   positions.
  , time.values = data$time           ##<< POSIXct vector: values for the time dimension
  , lat.length  = length(lat.values)  ##<< integer: length of the latitude dimension
  , long.length = length(long.values) ##<< integer: length of the longitude dimension
  , time.length = length(time.values) ##<< integer: length of the time dimension
  , year.start.end = c()   ##<< integer vector (length two): start and end year.
  ##   If not given, this is determined from the time
  ##   vector.
  , scale_factor = 1       ##<< numeric: scale factor
  , add_offset = 0         ##<< numeric: offset
  , type.var = 'NC_DOUBLE' ##<< character string: type of the data
  , missing_value = -9999  ##<< numeric: missing data value
  , con.atts = c()         ##<< RNetCDF file connection: Possible file to use as source
  , timeVar = 'time'       ##<< the name of the time variable
  ##   for copying attributes to the new file.
  , data = data.frame()    ##<< named list of cubes or a data.frame with values to store
  , ...                    ##<< further arguments to \code{\link{createLatLongTime}}
  ## such as units, user, timeVar
) {
  ##details<< 
  ##  This function writes an empty ncdf file with variable names, dimensions and
  ##  attributes formatted in a standardized way.
  ##
  ## All variables, except time, are stored using the same specification
  ## (scale_factor, add_offset, missing_value, type.var)
  #
  #copy attributes etc from other ncdf file (if chosen)
  if (class(con.atts) == 'NetCDF') {
    atts.file <- infoNcdfAtts(con.atts, readNcdfVarName(con.atts))
    pars = c('units', 'scale_factor', 'add_offset', 'missing_value')
    for (par.t in pars) {
      val.var = atts.file[atts.file[,1] == par.t][2]
      if (!par.t == 'units')
        val.var = as.numeric(val.var)
      if (!is.na(val.var))
        assign(par.t, val.var)
    }
    type.var = var.inq.nc(con.atts, readNcdfVarName(con.atts))$type
  }  
  if (length(year.start.end) == 0 & length(time.values) != 0)
    year.start.end  <- as.integer(format(
      time.values[c(1,length(time.values))], '%Y'))
  if (sum(c(lat.length,long.length,time.length) == 
          c(length(lat.values),length(long.values), length(time.values))) != 3)
    stop('lat(long/time.values need to have the same length as the '
         , 'respective length arguments!')
  if (length(time.values) > 0 && 
      !is.element(class(time.values)[1], c('POSIXlt', 'POSIXct')))
    stop('time.values needs to be of class POSIXct!') 
  if (time.length > 0 && length(year.start.end) != 2)
    stop('Supply values for the start and the end year!') 
  if (length(file.name) == 0) {
    file.name = paste(
      var.names[1], paste(c(lat.length, long.length, time.length), collapse = '.')
      , 'nc', sep = '.')
  } else if (!grepl('[.]nc',file.name)) {
    file.name <- paste(file.name, '.nc', sep = '')
  } 
  createLatLongTime(
    file.name = file.name, lat.values = lat.values
    , lat.length = lat.length, long.values = long.values
    , long.length = long.length, time.values = time.values
    , time.length = time.length, varNames = var.names
    , scale_factor = scale_factor, add_offset = add_offset
    , type.var = type.var, missing_value = missing_value
    , units = units)
  con.t <- open.nc(file.name, write = TRUE)
  on.exit(close.nc(con.t))
  ##details<< if a single variable is stored, data can be given as a cube instead
  ## of a list or data.frame
  if (is.numeric(data) && length(var.names) == 1L)
    data <- setNames(list(data),var.names)
  for (varName in var.names) {
    if (varName %in% names(data)) var.put.nc(
      con.t, varName, data[[varName]]
      , count = c(lat.length, long.length, time.length))
  }
  ##value<< character string: name off the file created.
  invisible(file.name)
}

