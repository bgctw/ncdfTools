ncdf.merge.files <- function(
      file.names
      , name.change = function(x){x}
      , time.diff = NULL
      , fun.start =  function(x){substr(x, nchar(x)-15, nchar(x)-10)}
      , fun.end   =  function(x){substr(x, nchar(x)-8, nchar(x)-3)}
      , time.range.out = c() 
      , format ='%Y%m'
      , convert = function(x)chron(paste(x, '15', sep=''), format='ymd', out.format='d-m-y')
)
{
  ##TODO useful defaults
  
  date.start.in <- ncdf.name2date(file.names, fun.start, convert)
  date.end.in   <- ncdf.name2date(file.names, fun.end, convert)
  
  file.names    <- file.names[order(date.start.in)]
  date.end.in   <- date.end.in[order(date.start.in)]
  date.start.in <- date.start.in[order(date.start.in)]
  
  if (length(time.range.out) == 2) {
    files.remove <- c(which(date.end.in < time.range.out[1]),
        which(date.start.in > time.range.out[2]))
    if (length(files.remove) > 0 ) {
      file.names    <- file.names[-files.remove]
      date.end.in   <- date.end.in[-files.remove]
      date.start.in <- date.start.in[-files.remove]
    }  
  }  
  
  if (!is.null(time.diff)) {
    if( sum(!(date.start.in[-1] - date.end.in[-length(date.end.in)] <= time.diff)) > 0 ) {
      paste('Time period missing!')
      return('Time period missing!')
    }  
  }
  
  date.start.out <- date.start.in[1]
  date.end.out <- date.end.in[length(date.end.in)]
  if (length(time.range.out) == 2) {
    files.delete <- c() 
    if (date.start.in[1] < time.range.out[1]) {
      file.start.new <- ncdf.cut.files(file.names[1], time.range.out =  c(time.range.out[1], date.end.in[1]),
          fun.start= fun.start, fun.end = fun.end, format = format, convert = convert)
      file.names[1]  <- file.start.new
      files.delete   <- c(files.delete, file.start.new)
      date.start.out <- time.range.out[1]
    } 
    if (date.end.in[length(date.end.in)] > time.range.out[2]) {
      file.end.new <- ncdf.cut.files(file.names[length(file.names)],
          time.range.out =  c(date.start.in[length(date.start.in)], time.range.out[2]),
          fun.start= fun.start, fun.end = fun.end, format = format, convert = convert)
      file.names[length(file.names)]  <- file.end.new
      files.delete <- c(files.delete, file.end.new)
      date.end.out <- time.range.out[2]
    } 
  }
  
  system('export SKIP_SAME_TIME=1')
  ofile  <- do.call(name.change, list(sub(do.call(fun.end, list(file.names[1])),
              do.call(fun.end, list(file.names[length(file.names)])),
              file.names[1])))
  system(paste('cdo -O mergetime ', paste(file.names, collapse =' '), ' ', ofile, sep ='') )   
  if (length(files.delete) > 0 )
    for (file.t in files.delete)
      file.remove(file.t)
  invisible(list(file.out = ofile, date.range = c(date.start.out, date.end.out)))
}
