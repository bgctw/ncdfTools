checkInstalled <- function(
  ##title<< check whether external program is installed
  commandName ##<< character string: name of the program/command to check
  )
  ##description<<
  ## This function checks whether an external program is installed on the machine.
  ##author<<
  ##Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
 out <- try(system(paste('which', commandName), intern = TRUE), silent = TRUE)
 if (length(out) == 0) {
   output <- FALSE
 } else {
   output <- TRUE
 }
 ##value<< logical: whether the program is installed.
 return(output)
}
