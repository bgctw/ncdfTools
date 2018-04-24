checkNcdfFile <- function(
  ### check ncdf file for consistency with CF/COARDS/MDI ncdf conventions
  file.name     ##<<character string: file name to check
  , dims = c('longitude', 'latitude', 'time') ##<< vector of strings:
                ## names of the dimensions which need to be in the file.
  , type = 'strict'  ##<< character string:
                ##   if 'strict', then all aspects are checked. If this
                ##   is any other value, only aspects relevant for the processing of
                ##   decomp.ncdf are checked.
  , var.check ='single' ##<< character string: If 'single', then readNcdfVarName
                ## is used to infer the name of the variable in the target file
                ## which will then be checked,
) {
  ##description<< 
  ## Check whether a ncdf file is consistent with 
  ## the parts of the COARDS/CF
  ##ncdf conventions that the MDI group agreed on.
  con.check     <- open.nc(file.name)
  on.exit(close.nc(con.check))
  infoVars <- infoNcdfVars(con.check)
  infoDims <- infoNcdfDims(con.check, extended = FALSE)
  dims.nonvalid <- is.na(match(dims, c('longitude', 'latitude', 'time')))
  if (sum(dims.nonvalid) > 0) stop(
    'Function is not designed to check dimensions ', dims[dims.nonvalid], '!')
  #check dimensions
  dims.exists <- match(dims, infoDims$name)
  if (sum(is.na(dims.exists)) > 0) {
    warning('Dimension ', dims[is.na(dims.exists)], ' not existent!')
    return(invisible(FALSE))
  }
  if (type == 'strict') {
    #check coordinate variables
    dims.exists <- match(dims, infoVars$name)
    if (sum(is.na(dims.exists)) > 0)  {
      warning('Coordinate variable for dim '
              , paste(dims[is.na(dims.exists)], collapse = ",")
              , ' not existent!')
      return(invisible(FALSE))
    }
    for (dim.t in dims) {
      if (!(sum(!is.na(var.get.nc(con.check, dim.t))) == 
            dim.inq.nc(con.check, dim.t)$length)) {
        warning('Coordinate variable for dim ', dim.t, ' has missing values!')
        return(invisible(FALSE))
      }
    }
    #check file name
    var.name <- sub('[.].*', '', file.name)
    if (!is.element(var.name, infoVars$name)) stop(
      'File does not have the main variable which has to be named ', var.name
      , '(according to the file name '
      ,' targetvar.NumberLatitudes.NumberLongitudes.Year.nc )')    
    #check attributes
    variables <- infoVars$name[is.na(match(infoVars$name, infoDims$name))]
    variables <- variables[!is.element(
      variables, c("flag.orig", 'borders.low', 'borders.up'))]
    if (length(variables) > 1 && var.check == 'single')
      variables  <- readNcdfVarName(file.name)
    atts.check <- c('_FillValue', 'missing_value', 'add_offset', 'scale_factor', 'units')
    for (var.t in variables) {
      atts.found <- match(atts.check, infoNcdfAtts(con.check, var.t)[, 'name'])
      if (sum(is.na(atts.found)) > 0) {
        warning('Variable ', var.t, ' does not have attributes '
                , paste(atts.check[is.na(atts.found)], collapse = ',  '), '')
        return(invisible(FALSE))
      }
    }
    #check time vector
    if (is.element('time', dims)) {
      if (!is.element('units', infoNcdfAtts(con.check, 'time')[, 'name'])) {
        cat('Time variable needs units attribute!')
        return(invisible(FALSE))
      }
      att.time.units <- att.get.nc(con.check, 'time', 'units')
      if (!(att.time.units == 'days since 1582-10-14 00:00')) {
        cat('Change time vector to days since 1582-10-14 00:00 !')
        return(invisible(FALSE))
      }
    }
    #check non obligatory global atts
    if (type == 'strict') {
      atts.check.global <- c('title', 'reference', 'history', 'provided_by', 'created_by')
      atts.missing      <- is.na(match(
        atts.check.global, infoNcdfAtts(con.check, 'NC_GLOBAL')[, 'name']))
      if (sum(atts.missing) > 0)
        warning('Consider adding the following global attributes: '
                , paste(atts.check.global[atts.missing], collapse = ',  '), '')
    }
  } # if strict
  #check missing_values attribute
  atts.check <- c('_FillValue', 'missing_value')
  for (var.t in variables) {
    infoAtts <- infoNcdfAtts(con.check, var.t)
    varInq <- var.inq.nc(con.check, var.t)
    if (sum(is.na(match(atts.check, infoAtts$name))) == 2) {
      warning('One of the attributes _FillValue or missing_value has to be'
              , ' available for variable ', var.t, '!.')
      return(invisible(FALSE))
    }
    for (att.t in atts.check) {
      if (!is.na(match(att.t, infoAtts$name))) {
        if (!(att.inq.nc(con.check, var.t, att.t)$type == varInq$type)) {
          warning('Attribute ', att.t, ' of variable ', var.t, ' needs to be'
                  , ' of the same class as ', var.t, '.')
          return(invisible(FALSE))
        }
      }
    }
  }
  message('File check passed!')
  ##value<< logical: (invisible) whether the file passed the check
  return(invisible(TRUE))
}
