transNcdfCutFiles <- function(
  ### cut margins of ncdf files
  file.names ##<< vector of character strings: file names to process.
  , time.range.out = c()
  , time.range.file =  c() ##<< POSIXct vector of length two or 'auto': 
  ## time range of the  original files. If not supplied, this is 
  ##   determined automatically from the file name 
  ##   via .convertFilename2Date and fun.start/fun.end.
  , fun.start = c()        ##<< see time.range.file
  , fun.end = c()          ##<< see time.range.file
  , format = ''
  , convert = .getChronDateFromName1
) {
  # Thomas: do not understand the function without an example
  ##details<< Convenience wrapper around cdo to cut outer (time) margins 
  ##              of Ncdf files.
  ##seealso<< \code{\link{transNcdfMerge}}              
  ##TODO implement possibility to supply dates
  ##TODO implement possibility to extract dates from file
  ##TODO useful defaults
  Sys.setenv(TZ = 'UTC')
  file.names.out <- c()
  for (i in 1:length(file.names)) {
    print(paste('Processing file', file.names[i]))
    if (length(time.range.file) == 0) {
      date.start.in <- .convertFilename2Date(file.names[i], fun.start, convert)
      date.end.in   <- .convertFilename2Date(file.names[i], fun.end, convert)
    } else if (time.range.file == 'auto') {
      con.t        <- open.nc(file.names[i])
      dates.range <- range(readNcdfTime(con.t))
      date.start.in <- dates.range[1]
      date.end.in   <- dates.range[2]
      close.nc(con.t)
    } else {
      date.start.in <- time.range.file[1]
      date.end.in   <- time.range.file[2]
    }  
    if (date.start.in < time.range.out[1] | date.end.in > time.range.out[2] ) {
      date.start.cut <- max(c(date.start.in, time.range.out[1]))
      date.end.cut   <- min(c(date.end.in, time.range.out[2]))
      if (is.null(fun.start)) {
        file.name.stripped <- sub('[.]nc$', '', sub(
          '[[:digit:]]{2,4}[.]', '', sub('[[:digit:]]{2,4}[.]', '', file.names[i])))
        file.cut <- paste(
          file.name.stripped, format(date.start.cut, '%Y')
          , format(date.end.cut, '%Y'), 'nc', sep = '.')
      } else {
        file.cut <- sub(do.call(fun.start, list(
          file.names[i])), format(as.POSIXct(date.start.cut), format = format)
          , file.names[i])
        file.cut <- sub(do.call(fun.end, list(
          file.cut)), format(as.POSIXct(date.end.cut), format = format)
          , file.cut)
      }
      cmd <- paste0(
        'cdo seldate,', format(as.POSIXct(date.start.cut), '%Y-%m-%dT%H:%M')
        , ',', format(as.POSIXct(date.end.cut), '%Y-%m-%dT%H:%M'), ' '
        , file.names[i], ' ', file.cut)
      system(cmd)
      file.names.out <- c(file.names.out, file.cut)
    }
  }
  ##value<< character string: names of the file names after cutting.
  invisible(file.names.out)
}  

