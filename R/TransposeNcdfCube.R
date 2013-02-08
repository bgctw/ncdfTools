TransposeNcdfCube  = function(data.object, file.con = c(),
  var.name = c()) {

  if (inherits(data.object,  "NetCDF")) {
    file.con <- data.object
    if (length(var.name) == 0)
      var.name = ncdf.get.varname(file.con)
    datacube <- var.get.nc(file.con, var.name)
  } else if (inherits(data.object,  "array")) {
    datacube     <- data.object
    if (!inherits(file.con,  "NetCDF"))
      stop('Please supply a valid pointer to a ncdf file via file.con!')
  } else {
    stop(paste('Function not designed for data.object of class', class(data.object), '!'))
  }
  dims.file      <- ncdf.get.diminfo(file.con)[,'name'][var.inq.nc(file.con, var.name)$dimids + 1]
  new.dimorder   <- pmatch(c('lat', 'lon', 'time'), dims.file)
  if (sum(unique(diff(new.dimorder)) != 1) > 0)
    datacube   <- aperm(datacube, new.dimorder)
  lat.values     <- var.get.nc(file.con, pmatch('lat', ncdf.get.varinfo(file.con, order.var = 'id')$name) - 1) 
  lon.values     <- var.get.nc(file.con, pmatch('lon', ncdf.get.varinfo(file.con, order.var = 'id')$name) - 1)
  if (sum(unique(diff(order(lat.values, decreasing = TRUE))) != 1) > 0)
    datacube   <- datacube[order(lat.values, decreasing = TRUE), , ]
  if (sum(unique(diff(order(lon.values))) != 1) > 0)
    datacube   <- datacube[, order(lon.values), ]
  return(datacube = datacube)
}
