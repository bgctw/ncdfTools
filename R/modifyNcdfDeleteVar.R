modifyNcdfDeleteVar <- function(
  ### delete variable using cdo
  fileName     ##<< scalar string name of the file, that must not be open
  , varNames   ##<< string vector of variables to delete
  , isVerbose = FALSE ##<< set to TRUE to repeat CDO command
  , intermediateFilename = paste0(fileName,"_ncdfTools",sample.int(1000,1)) ##<<
  ## name of the intermediate file generated. 
) {
  ##details<< if varName is not found among variable names, does nothing
  if (!any(varNames %in% infoNcdfVars(fileName)$name)) return(TRUE)
  ##details<< cdo writes to a temporary file, which then replaces the original.
  ## To avoid copying large files across boundaries of mounted file systems,
  ## the intermediate file is created in the same directory as the original file 
  ## by default.
  intermediate <- intermediateFilename
  # intermediate <- "tmp.nc"
  cmd <- paste0(
    "cdo delname,",paste(varNames, collapse = ",")
    , " ", fileName, " ", intermediate)
  if (isTRUE(isVerbose)) message(cmd)
  ans <- system(cmd)
  if (ans != 0) return(FALSE)
  return( file.rename(intermediate, fileName) )
}
