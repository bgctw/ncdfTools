NcdfGetLatLonTime <- function(file.con) {
  dimind.latlontime <- pmatch(c('lat', 'lon', 'time'),  ncdf.get.varinfo(file.con, order.var='id')[,'name'])  -1
  out <- list(latitude=c(), longitude=c(), time = c())
  for (i in 1:3) {
    if (!is.na(dimind.latlontime[i]))
      out[[i]] <- var.get.nc(file.con,  dimind.latlontime[1])
  }
  return(out)
}
