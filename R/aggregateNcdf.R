aggregateNcdf <- function(fileName, period) {

  ##test input
  cdoPrefix <- switch(period, hourly='hour', daily='day', monthly='mon',
                      yearly='year', 'not_available')
  if(cdoPrefix == 'not_vailable')
    stop(paste('Period \'', period, '\' not implemented!', sep = ''))
  if (!checkInstalled('cdo'))
    stop('cdo not found. Please install it.')
  
  ## determine cdo command values
  fileNameOut <- sub('[.]nc', paste('_', period, '.nc', sep = ''), fileName)
  cdoCmd    <- paste('cdo ', cdoPrefix, 'mean ', fileName, ' ', fileNameOut, sep ='')

  ##run aggregation
  system(cdoCmd)
  cat(paste('Created file ', fileNameOut, '.\n', sep = ''))
  invisible(fileNameOut)
}


