createLatLongTime <- function(
  ### create empty lat/lon/time ncdf file
  file.name                 ##<< character string: name of the target file.
  , varNames = sub('[.]nc', '', file.name) ##<< character vector: names of the 
                            ##  variablesin the target file.
  , lat.values = c()        ##<< numeric values: coordinate values for the latitude
                            ##   positions.
  , long.values = c()       ##<< numeric values: coordinate values for the latitude
                            ##   positions.
  , time.values = c()                 ##<< POSIXct vector: values for the time dimension
  , lat.length  = length(lat.values)  ##<< integer: length of the latitude dimension
  , long.length = length(long.values) ##<< integer: length of the longitude dimension
  , time.length = length(time.values) ##<< integer: length of the time dimension
  , ...                    ##<< further arguments to \code{\link{modifyNcdfAddVars}}
  , units = '1'            ##<< string vector: units of the variables in target file.  
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
  # define history before adding variables
  hist_string <- paste0(Sys.time(),': File created by ', user)
  att.put.nc(file.con, 'NC_GLOBAL', 'history', 'NC_CHAR', hist_string)
  modifyNcdfAddVars( file.con, varNames, units = units, dimNames = dims.used, ...)
  message('Created file', file.name)
}

#' @export
modifyNcdfAddVars <- function(
  ### add a variable definition 
  ncFile                 ##<< character string: name of the target file.
  , varNames            ##<< character vector: names of the
  , units = '1'           ##<< string vector: units of the variables in target file.  
  , dimNames = c('latitude', 'longitude', 'time')
  , isStopOnOverriding = TRUE ##<< set to FALSE to disregard variables alread defined
  , scale_factor = 1       ##<< numeric: scale factor
  , add_offset = 0         ##<< numeric: offset
  , type.var = 'NC_DOUBLE' ##<< character string: type of the data
  , missing_value = -9999  ##<< numeric: missing data value
  , dimVars = 'time'       ##<< the name of the time variable
  , user = Sys.info()['user'] ##<< user name put to history entry  
){
  if (class(ncFile) ==  'character') {
    if (file.exists(ncFile)) {
      ncFile = open.nc(ncFile, write = TRUE)
      on.exit(close.nc(ncFile))
    } else stop('File ', ncFile, ' is not existent.')
  }
  if (!length(varNames)) return(character(0))
  if (length(units) != length(varNames)) stop(
    "lenght of units argument must equal lenght of varNames=", length(varNames)
    , " but was ",length(units))
  infoVars <- infoNcdfVars(ncFile)
  varNamesExisting <- intersect(infoVars$name, varNames)
  iVarsCreate <- if (length(varNamesExisting)) {
    if (isStopOnOverriding) stop(
      "Following variables already exist: "
      , paste(varNamesExisting, collapse = ","))
    which(!(varNames %in% varNamesExisting))
  } else seq_along(varNames)
  for (i in iVarsCreate)  {
    var.name.t <- varNames[i]
    unit <- units[i]
    var.def.nc <- var.def.nc(ncFile, var.name.t, type.var, dimNames)
    modifyNcdfDefAtts( ncFile, var.name.t, atts = list(
      scale_factor = scale_factor
      , add_offset = add_offset
      , missing_value = missing_value
      , `_FillValue` = missing_value, units = unit))
  }
  modifyNcdfAppendHistory(
    ncFile
    , paste0("added variables ",paste(varNames[iVarsCreate], collapse = ","))
    , user = user)  
  varNames[iVarsCreate]
}
