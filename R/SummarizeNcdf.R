SummarizeNcdf = function(ncdf.obj) {
  close.file = FALSE
  if (class(ncdf.obj) == 'character') {
    ncdf.obj   <- open.nc(ncdf.obj)
    close.file <- TRUE
  }

  res <- system(paste('cdo sinfo ', ncdf.obj, sep = ''), intern = TRUE)

  read.table(res, header = TRUE)


  
  if (close.file)
    close.nc(ncdf.obj)


  
}
