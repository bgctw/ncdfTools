aggregateNcdf <- function(
  fileName ##<< character vector: names of the files to aggregate.
  , period ##<< integer or one of hour, day, month or year: period to agggregate to. In case
           ##   of an integer value, the unit is timesteps.
  ) {

  ##test input
  if (!checkInstalled('cdo'))
    stop('cdo not found. Please install it.')

  if (inherits(period, 'character')) {
    cdoOperator <- paste(switch(period, hourly='hour', daily='day', monthly='mon',
                        yearly='year', 'not_available'), 'mean', sep = '')
    if(cdoPrefix == 'not_vailable')
      stop(paste('Period \'', period, '\' not implemented!', sep = ''))
  } else if (inherits(period, 'numeric')) {
    cdoOperator      <- paste('timselmean,', period, sep = '') 
  } else {
    stop('Plase only supply numeric or character values for \'period\'!')
  }
  
  ## determine cdo command values
  fileNameOut <- sub('[.]nc', paste('_', period, '.nc', sep = ''), fileName)
  cdoCmd      <- paste('cdo ', cdoOperator, ' ', fileName, ' ', fileNameOut, sep = '')

  ##run aggregation
  system(cdoCmd)
  cat(paste('Created file ', fileNameOut, '.\n', sep = ''))
  invisible(fileNameOut)
}


