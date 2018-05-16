createFactorDim <- function(
  ### define a new dimension with ordinal values, i.e. a factor
  ncFile                    ##<< file: scalar character string parh or nc connection
  , dimName                 ##<< name (scalar string): if the dimension
  , levels                  ##<< string vector of factor levels
) {
  if (class(ncFile) ==  'character') {
    if (file.exists(ncFile)) {
      ncFile = open.nc(ncFile, write = TRUE)
      on.exit(close.nc(ncFile))
    } else stop('File ', ncFile, ' is not existent.')
  }
  ##details<< The type of the dimension will be NC_INT (1:nLevel).
  ## The unit attribute lists the meaning of the factor levels
  infoDims <- infoNcdfDims(ncFile)
  if (dimName %in% infoDims$name) stop("dimension already defined.")
  dimLegendName <- paste0(dimName,"s")
  nLevel <- length(levels)
  dim.def.nc(ncFile, dimName, nLevel)
  var.def.nc(ncFile, dimName, "NC_INT", dimName)
  var.put.nc(ncFile, dimName, 1:nLevel) # necessary to cdo not dropping or renaming to x
  mapping <- paste(paste(1:nLevel, levels, sep = "="), collapse = ",")
  modifyNcdfDefAtts(
    ncFile,dimName,atts = 
      list(long_name = dimName, units = "1", levels = mapping
           , standard_name = dimName))
  # infoDims <- infoNcdfDims(ncFile)
  # if (!("MAX_STRING_LENGTH" %in% infoDims$name)) {
  #   #dim.def.nc(ncFile, "MAX_STRING_LENGTH", 1L + max(nchar(levels))) #+1 for trailing zero
  #   dim.def.nc(ncFile, "MAX_STRING_LENGTH", maxStringLength) #+1 for trailing zero
  # }
  # var.def.nc(ncFile, dimLegendName, "NC_CHAR", c("MAX_STRING_LENGTH", dimName))			
  # var.put.nc(ncFile, dimLegendName, levels)		
  # modifyNcdfDefAtts(
  #   ncFile,dimLegendName,atts = 
  #     list(long_name = dimLegendName, units = ""
  #          , standard_name = dimLegendName))
  # infoNcdfVars(ncFile, dimvars = TRUE)
}

.parseLevelAttr <- function(
  ### parsing levels 
  levelsAttr  ##<< scalar string of format: 1:<level1>,2:<level2>,...
){
  levels1 <- strsplit(levelsAttr,",")[[1]]
  levels2 <- strsplit(levels1,"=")
  ##value<< string vector of c(<level1>,<level2>, ...)
  sapply(levels2, "[", 2)
}

