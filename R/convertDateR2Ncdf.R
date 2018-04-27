convertDateR2Ncdf = function(
  ### convert time vectors in ncdf files to Julian days since the start of Gregorian calendar   
  ncdf.obj              ##<< character string or ncdf connection: 
  ## ncdf file for which to convert the dates    
  , date.vec='auto'     ##<< POSIXct vector: date vectors for the time dimension. 
  ## If set to 'auto', this is tried to be extracted from the ncdf file
  , origin="1582-10-15"  ##<< character string: origin to be used for the time  
  ## vector. This start of the Gregorian calendar should be kept to avoid possible 
  ## mistakes due to flawed conversions.
  , write.to.ncdf = TRUE ##<< logical: whether writing  time to the ncdf file.                      
  , timeVar = 'time'  ##<< variable holding the values of time
) {
  ##details<< Set a time vector in a ncdf file to a standardized 
  ## format which is readable by most software. It transfers the time vector 
  ## to days since the start of the Gregorian calendar.
  if (class(ncdf.obj) == 'character')
    if (!file.exists(ncdf.obj))
      stop('Specified file does not exist!')
  if (class(ncdf.obj) == 'NetCDF') {
    file.con = ncdf.obj
  } else {
    file.con   = open.nc(ncdf.obj,write = TRUE)
    on.exit(close.nc(file.con))
  }
  if (!is.element('time',infoNcdfDims(file.con)$name))
    stop('No time dimension present in specified ncdf file.')
  # determine date vector
  if (class(date.vec) ==  "character"  && date.vec == 'auto') {
    infoAttsTime <- infoNcdfAtts(file.con, timeVar)
    units = infoAttsTime[ , 'value'][infoAttsTime[, 'name'] == 'units']
    orig.test <- try({
      as.POSIXct(as.POSIXlt(sub('^.*since ', '', units), tz = 'UTC'))
      }, silent = TRUE)
    if ((class(orig.test) == 'try-error') || !(sub(' since.*$','',units) == 'days'))
      stop('date format in ncdf file is in a non implemented format. '
           , 'Supply date vector by hand.')
    date.vec.conv <- as.numeric(var.get.nc(file.con,'time') + 
                                  julian(orig.test,as.POSIXct(origin)))
  } else {
    date.vec.conv <- as.numeric(julian(
      date.vec, origin = as.POSIXlt(origin, tz = "UTC")))
  }   
  ## write results to ncdf file
  if (write.to.ncdf) {
    if (!is.element('time',infoNcdfVars(file.con)$name))
      var.def.nc(file.con,'time', 'NC_float', 'time')    
    var.put.nc(file.con, 'time', date.vec.conv)
    atts.def <- list(long_name = 'time', calendar = 'gregorian'
                     , units = paste('days since ', origin, sep = ''))
    modifyNcdfDefAtts(file.con, 'time', atts.def)
    history.string <- paste('time vector converted by ', 
                            Sys.info()['user'],' on ',Sys.time(),sep = '')
    if (is.element('history', infoNcdfAtts(file.con, 'NC_GLOBAL')[, 'name'])) 
      history.string <- paste(
        att.get.nc(file.con, 'NC_GLOBAL', 'history'), '; '
        , history.string, sep = '')
    att.put.nc(
      file.con,'NC_GLOBAL','history','NC_CHAR'
      , paste(att.get.nc(file.con,'NC_GLOBAL','history')
              , '; ', history.string,sep = ''))
    sync.nc(file.con)
  }
  ##value<<
  ## (invisibly): the time vector. Additionally the time vector is 
  ## written to the respective file.
  return(date.vec.conv)
}    

