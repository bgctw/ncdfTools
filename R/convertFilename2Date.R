.convertFilename2Date <- function(
  ### convert file name to R date
    file.names        ##<< character vector: names of the files
    , fun.extr.string ##<< function
    , fun.conv.string ##<< function
  )
##details<<
## This function converts parts of ncdf file names to date strings. This is used, e.g.
## in transNcdfCutFiles.   
##seealso<<
##\code{\link{transNcdfCutFiles}}  
{
   date   <- do.call(fun.conv.string, list( do.call(fun.extr.string, list(file.names))))
   ##value<< POSIXct object with the date.
   return(date)
}
