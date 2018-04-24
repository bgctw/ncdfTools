transNcdfSubset <- function(
  ### cut subset out of ncdf file
  file.name         ##<< character string: name of the file to create. 
  , dim.values = list(latitudes = c(), longitudes = c(), timesteps = c()) ##<<
  ## see values.type
  , values.type = c('range', 'indices', 'values')[2] ##<< character string:
  ## type of the dim.values supplied. 'range' means that the lower an upper
  ## border are supplied, 'indices' means that 1:n indices are supplied,
  ## 'values' means actual coordinate values. 
  , filename.new = sub('[.]nc', '_subs.nc', file.name) ##<< character string: 
  ## name of the results file.
) {
  ##details<<
  ## This function reads a subset of lat/lon/time values out of a ncdf file 
  ## and creates a target ncdf file with the results.
  ##ToDo facilitated other scenarios than lat/lon/time
  ##TODO merge with transNcdfCutTimes
  #determine dimension indices
  dim.indices = list(longitudes = c(), latitudes = c(), timesteps = c())
  con.source <- open.nc(file.name)
  on.exit(close.nc(con.source))
  dimvals.src        <- readCoordinatesNcdf(con.source)  
  if (values.type == 'range') {
    for (i in 1:3) 
      dim.indices[[i]] <-  which(dimvals.src[[i]] >= min(dim.values[[i]]) &
                                   dimvals.src[[i]] <= max(dim.values[[i]]))
  } else  if (values.type == 'indices') {
    dim.indices = dim.values
  } else if (values.type == 'values') {
    for (i in 1:3) 
      dim.indices[[i]] <- match(dim.values[[i]], dimvals.src[[i]])
  } else stop(
    'Value for values.type of \'', values.type, '\' not supported!')
  # create target file
  lat.values.target  <- dimvals.src$latitude[dim.indices$latitudes]
  lon.values.target  <- dimvals.src$longitude[dim.indices$longitudes]
  time.values.target <- dimvals.src$time[dim.indices$timesteps]
  var.name.new <- sub('.*/', '', sub('[.]nc', '', filename.new))
  createLatLongTime(
    var.names = var.name.new, file.name = filename.new,
    lat.values = lat.values.target, long.values = lon.values.target,
    time.values = time.values.target)
  # load, transpose and subset source data
  data.orig   <- transNcdfRotate(con.source)
  data.target <- array(data.orig[
    indexVec2Mat(dim.indices$latitudes,
                 dim.indices$longitudes,
                 dim.indices$timesteps)],
    dim =  sapply(dim.indices, length))
  # write to target
  con.target <- open.nc(filename.new, write = TRUE)  
  on.exit(close.nc(con.target))
  var.put.nc(con.target, var.name.new, data.target)
  cat(paste('Created file ', filename.new, '\n', sep = ''))
  ##value<< character string: name of the file created.
  invisible(filename.new)
}


