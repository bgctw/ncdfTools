convertDateR2Ncdf = function(
##title<< convert time vectors in ncdf files to julian days since the start of Gregorian calendar   
##description<< This function automatically converts time vectors in ncdf files to a standardized Gregorian calendar
       ncdf.obj              ##<< character string or ncdf connection: ncdf file for which to convert the dates    
      , date.vec='auto'      ##<< POSIXct vector: date vectors for the time dimension. If set to 'auto', this
                             ##   is tried to be extracted from the ncdf file
      , origin="1582-10-14"  ##<< character string: origin to be used for the time vector. This start of the 
                             ##   Gregorian calendar should be kept to avoid possible mistakes due to erronous
                             ##   conversions.
      , write.to.ncdf = TRUE                       
)
##details<< This function sets a time vector in a ncdf file to a standardized format which is readable by
##           most software. It transfers the time vector to days since the start of the Gregorian calendar.
##value<< (invisibly): the time vector. Additionally the time vector is written to the respective file.
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  close.connection = TRUE
  if (class(ncdf.obj)=='character')
    if(!file.exists(ncdf.obj))
      stop('Specified file does not exist!')
  if (class(ncdf.obj)=='NetCDF') {
    file.con=ncdf.obj
    close.connection = FALSE
  } else {
    file.con   = open.nc(ncdf.obj,write=TRUE)
  }
  if (!is.element('time',ncdf.get.diminfo(file.con)$name))
    stop('No time dimension present in specified ncdf file.')
  if (class(date.vec) ==  "character"  && date.vec=='auto')
  {
    units = ncdf.get.attinfo(file.con, 'time')[ , 'value'][ncdf.get.attinfo(file.con, 'time')[, 'name'] == 'units']
    orig.test <- try({as.POSIXct(as.POSIXlt(sub('^.*since ', '', units), tz = 'UTC'))}, silent=TRUE)
    if ((class(orig.test)=='try-error') || !(sub(' since.*$','',units)=='days'))
      stop('date format in ncdf file is in a non implemented format. Supply date vector by hand.')
    date.vec.conv <- as.numeric(var.get.nc(file.con,'time') + julian(orig.test,as.POSIXct(origin)))
  } else {
      date.vec.conv <- as.numeric(julian(date.vec, origin = as.POSIXlt(origin, tz="UTC")))
  }   
  
  if (write.to.ncdf) {
    if (!is.element('time',ncdf.get.varinfo(file.con)$name))
      var.def.nc(file.con,'time', 'NC_float', 'time')
    
    var.put.nc(file.con, 'time', date.vec.conv)
    atts.def <- list(long_name = 'time', calendar = 'gregorian', units = paste('days since ', origin, sep = ''))
    modifyNcdfDefAtts(file.con, 'time', atts.def)
    history.string <- paste('time vector converted by ',Sys.info()['user'],' on ',Sys.time(),sep='')
    if (is.element('history', ncdf.get.attinfo(file.con, 'NC_GLOBAL')[, 'name'])) 
      history.string <- paste(att.get.nc(file.con, 'NC_GLOBAL', 'history'), '; ', history.string, sep = '')
    att.put.nc(file.con,'NC_GLOBAL','history','NC_CHAR'
        , paste(att.get.nc(file.con,'NC_GLOBAL','history'),'; ',history.string,sep=''))
    sync.nc(file.con)
  }
  if (class(ncdf.obj)=='NetCDF' && close.connection) 
    close.nc(file.con)
  
}    

