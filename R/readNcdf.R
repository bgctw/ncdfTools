readNcdf <- function(
    ##title<< fast reading of ncdf data
    ##description<< Convenience funtcion to automatically read in data from a ncdf file
    ##              without specifying variable names and opening file connections
    file.name ##<< character string: name of the ncdf file file to read the data from- 
) 
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  require(RNetCDF)
  file.con <- open.nc(file.name)
  data     <- var.get.nc(file.con, readNcdfVarName(file.con))
  close.nc(file.con)
  ##value<< (multidimensional) array: data from the ncdf file.
  return(data)
}  

