readNcdfSubset <- function(file.name, dim.values = list(latitudes =c(), longitudes=c(), timesteps=c()),
                       values.type =c('range', 'indices', 'values')[2],
                       filename.new = sub('[.]nc', '_subs.nc', file.name)) {
  ##ToDo facilitated other scenarios than lat/lon/time
  require(RNetCDF)

  #determine dimension indices
  dim.indices=list(longitudes=c(), latitudes=c(), timesteps=c())
  con.source <- open.nc(file.name)
  dimvals.src        <- NcdfGetLatLonTime(con.source)  
  if (values.type == 'range') {
    for (i in 1:3) 
      dim.indices[[i]] <-  which(dimvals.src[[i]] >= min(dim.values[[i]]) &
                                 dimvals.src[[i]] <= max(dim.values[[i]]))
  } else  if (values.type == 'indices') {
    dim.indices = dim.values
  } else if (values.type == 'values') {
    for (i in 1:3) 
      dim.indices[[i]] <- match(dim.values[[i]], dimvals.src[[i]])
  } else {
    stop(paste('Value for values.type of \'', values.type, '\' not supported!', sep = ''))
  }

  # create target file
  lat.values.target  <- dimvals.src$latitude[dim.indices$latitudes]
  lon.values.target  <- dimvals.src$longitude[dim.indices$longitudes]
  time.values.target <- dimvals.src$time[dim.indices$timesteps]
  var.name.new <- sub('.*/', '', sub('[.]nc', '', filename.new))
  createLatLongTime(var.names = var.name.new, file.name = filename.new,
                    lat.values = lat.values.target, long.values = lon.values.target,
                    time.values = time.values.target)

  # load, transpose and subset source data
  data.orig   <- transNcdfRotate(con.source)
  close.nc(con.source)
  data.target <- array(data.orig[IndVectors2IndMatrix(dim.indices$latitudes,
                                                      dim.indices$longitudes,
                                                      dim.indices$timesteps)],
                       dim =  sapply(dim.indices, length))

  # write to target
  con.target <- open.nc(filename.new, write = TRUE)  
  var.put.nc(con.target, var.name.new, data.target)
  close.nc(con.target)
  cat(paste('Created file ', filename.new, '\n', sep = ''))
  invisible(filename.new)
}


