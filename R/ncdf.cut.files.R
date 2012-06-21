ncdf.cut.files <- function(
       file.names
       , time.range.out = c()
       , time.range.file =  c()
       , fun.start = function(x){}
       , fun.end = function(x){}
       , format = '')
{
  ##TODO implement possiibility to supply dates
  ##TODO implement possiibility to extract dates from file
  ##TODO useful defaults
  file.names.out <- c()
  require(chron)
  for(i in 1:length(file.names)) {
    print(paste('Processing file', file.names[i]))
    if (length(time.range.file) == 0) {
      date.start.in <- ncdf.name2date(file.names[i], fun.start, convert)
      date.end.in   <- ncdf.name2date(file.names[i], fun.end, convert)
    } else {
      date.start.in <- time.range.file[1]
      date.end.in   <- time.range.file[2]
    }  
    if (date.start.in < time.range.out[1] | date.end.in > time.range.out[2] ) {
      date.start.cut <- max(c(date.start.in, time.range.out[1]))
      date.end.cut   <- min(c(date.end.in, time.range.out[2]))
      file.cut       <- sub(do.call(fun.start, list(file.names[i])), format(as.POSIXct(date.start.cut), format=format), file.names[i])
      file.cut       <- sub(do.call(fun.end, list(file.cut)), format(as.POSIXct(date.end.cut), format=format), file.cut)
      system(paste('cdo seldate,', format(as.POSIXct(date.start.cut), '%Y-%m-%d'), ',',
              format(as.POSIXct(date.end.cut), '%Y-%m-%d'), ' ', file.names[i], ' ', file.cut, sep =''))
      file.names.out <- c(file.names.out, file.cut)
    }
  }
  invisible(file.names.out)
}  
