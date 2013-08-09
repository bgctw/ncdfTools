convertFilename2Date <- function(
    file.names
    , fun.extr.string
    , fun.conv.string) 
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
   date   <- do.call(fun.conv.string, list( do.call(fun.extr.string, list(file.names))))
   return(date)
}
