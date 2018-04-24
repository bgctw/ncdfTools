#require(testthat)
context('cdo')

tmpDir <- tempdir()
fileName <- file.path(tmpDir,"soilResp.1.1.30.nc")
nRec <- 30L
times <- seq(ISOdatetime(2010,1,1,0,0,0, tz = "UTC")
             , by = "30 min", length.out = nRec)
soilResp <- rnorm(nRec)
file <- createStdNcdfFile(
  c("soilResp","sdSoilResp")
  , file.name = fileName
  , lat.values = 53.0
  , long.values = 13
  , time.values = times
  , units = rep('g/m^2',2)
)

test_that('aggregateNcdf',{
  ans <- aggregateNcdf(file, path.out = tmpDir, period = 2)
  ## TODO: check generated file
  expect_equal(basename(ans), "soilResp.1.1.30_2.nc")
})

