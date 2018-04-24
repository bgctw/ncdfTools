modifyNcdfAppendHistory <- function(
  ### automatically append string to ncdf history
  file ##<< character sting or RNetCDF file connection: file to write to.
  , string ##<< character string: string to append to the history
  , user = Sys.info()['user'] ##<< character string of the user
) {
  ##details<<
  ## Convenience function to append a string together with the current date 
  ## and the user to the history attribute of an Ncdf file. 
  if (class(file) == 'character') {
    con <- open.nc(file, write = TRUE)
    on.exit(close.nc(con))
  } else con = file
  history = ''
  if (is.element('history', infoNcdfAtts(con, 'NC_GLOBAL')[, 'name'])) {
    history <- att.get.nc(con, 'NC_GLOBAL', 'history')
  } 
  history.new <- paste0(history,  '\n', Sys.time(), ': ', string, ' by ', user)
  att.put.nc(con, 'NC_GLOBAL', 'history', 'NC_CHAR', history.new)
  ##value<< nothing is returned
}
