#require(testthat)
context('cdo')

# TRUE during testthat::check()
isNotOnCRAN <- identical(Sys.getenv("NOT_CRAN"), "true")

nRec <- 30L
times <- seq(ISOdatetime(2010,1,1,0,0,0, tz = "UTC")
             , by = "30 min", length.out = nRec)
dsTest <- data.frame(
  time = times
  , soilResp = rnorm(nRec), sdSoilResp = 0.1
)
tmpDir <- tempdir()
#tmpDir <- "tmp"
# ncFileDs <- createStdNcdfFile(
#   data = dsTest
#   , file.name = file.path(tmpDir,"dsSoilResp.nc")
#   , lat.values = 53.0
#   , long.values = 13
#   , time.values = times
#   , units = rep('g/m^2',2)
# )
# single variable: can supply data as vector
ncFile <- createStdNcdfFile(
  "soilResp"
  , file.name = file.path(tmpDir,"soilResp.1.1.30.nc")
  , lat.values = 53.0
  , long.values = 13
  , time.values = dsTest$time
  , units = 'g/m2'
  , data = dsTest$soilResp
)
fileName <- ncFile

test_that('aggregateNcdf',{
  skip_on_cran()
  ans <- aggregateNcdf(fileName, path.out = tmpDir, period = 2)
  ## TODO: check generated file
  expect_equal(basename(ans), "soilResp.1.1.30_2.nc")
})

test_that('modifyNcdfDeleteVar',{
  skip_on_cran()
  # deleting the last variable causes errors with cdo, hence add a variable first
  varNameNew <- "varNew"
  varNameNew2 <- "varNew2"
  # work on tempfile to not change the original file
  tmpFile <- tempfile(); tmp <- file.copy(fileName, tmpFile)
  ans <- modifyNcdfCopyVar(
    tmpFile, var.id.orig = infoNcdfVars(fileName)$name[1]
    , var.id.copy = varNameNew)  
  ans <- modifyNcdfCopyVar(
    tmpFile, var.id.orig = infoNcdfVars(fileName)$name[1]
    , var.id.copy = varNameNew2)  
  infoVars1 <- infoNcdfVars(tmpFile)
  expect_true( varNameNew %in% infoVars1$name)
  # delete two variables at once
  tmp <- modifyNcdfDeleteVar(tmpFile, varNames = c(varNameNew, varNameNew2))
  infoVars2 <- infoNcdfVars(tmpFile)
  expect_true( !(varNameNew %in% infoVars2$name))
})

