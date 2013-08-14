convertFilename2Date <- function(
  ##title<< convert file name to R date
    file.names        ##<< character vector: names of the files
    , fun.extr.string ##<< function
    , fun.conv.string ##<< function
  )
##description<<
## This function converts parts of ncdf file names to date strings. This is used, e.g.
## in transNcdfCutFiles.   
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
   date   <- do.call(fun.conv.string, list( do.call(fun.extr.string, list(file.names))))
   ##value<< POSIXct object with the date.
   return(date)
}