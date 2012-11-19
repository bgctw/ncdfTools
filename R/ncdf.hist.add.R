ncdf.hist.add = function(file, string) {
   if (class(file) == 'character') {
     con <- open.nc(file, write = TRUE)
   } else {
     con = file
   }
   history = ''
   if (is.element('history', ncdf.get.attinfo(con, 'NC_GLOBAL')[, 'name'])) {
     history <- att.get.nc(con, 'NC_GLOBAL', 'history')
   } 
   history.new <- paste(history,  Sys.time(), ':', string, 'by', Sys.info()['user'])
   att.put.nc(con, 'NC_GLOBAL', 'history', 'NC_CHAR', history.new)
   if (class(file) == 'character')
     close.nc(file)
}
