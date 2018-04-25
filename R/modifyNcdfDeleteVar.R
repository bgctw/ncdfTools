modifyNcdfDeleteVar <- function(
  ### delete variable using cdo
  fileName     ##<< scalar string name of the file, that must not be open
  , varNames   ##<< string vector of variables to delete
) {
  ##details<< if varName is not found among variable names, does nothing
  if (!any(varNames %in% infoNcdfVars(fileName)$name)) return(TRUE)
  # cdo writes to a temporary file, which then replaces the original
  intermediate <- tempfile()
  # intermediate <- "tmp.nc"
  cmd <- paste0(
    "cdo delname,",paste(varNames, collapse = ",")
    , " ", fileName, " ", intermediate)
  ans <- system(cmd)
  if (ans != 0) return(FALSE)
  return( file.rename(intermediate, fileName) )
}
