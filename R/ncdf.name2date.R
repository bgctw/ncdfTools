ncdf.name2date <- function(file.names, fun.extr.string, fun.conv.string) {
   date   <- do.call(fun.conv.string, list( do.call(fun.extr.string, list(file.names))))
   return(date)
}
