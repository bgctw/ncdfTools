#require(testthat)
context('misc')

test_that('classR2Ncdf',{
  expect_equal( classR2Ncdf(1L), "NC_INT")
  expect_equal( classR2Ncdf(1.01), "NC_DOUBLE")
  expect_equal( classR2Ncdf(33000), "NC_DOUBLE")
  expect_equal( classR2Ncdf('site'), "NC_CHAR")
})


test_that('POSIX2ncdf and back',{
  #if (require(udunits2)) {
  timesOrig <- seq(
    ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
  unit <- "days since 1582-10-15 00:00"
  timesDays <- POSIX2ncdf(timesOrig, unit)
  timesPosix <- ncdf2POSIX(timesDays, unit)
  expect_true(all( timesPosix == timesOrig))
  #}
})

test_that('.POSIX2DaysSinceOrigin and back',{
  timesOrig <- seq(
    ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
  timesDays <- ncdfTools:::.POSIX2DaysSinceOrigin(timesOrig)
  unit <- "days since 1582-10-15 00:00"
  timesDaysExp <- POSIX2ncdf(timesOrig, unit)
  expect_equal( timesDays, timesDaysExp)
  timesPosix <- ncdfTools:::.daysSinceOrigin2POSIX(timesDays)
  expect_true(all( timesPosix == timesOrig))
})


# TODO test writing and reading times in NetCDF files
test_that('read and write ncdf time',{
  nRec <- 30L
  times <- seq(ISOdatetime(2010,1,1,0,0,0, tz = "UTC")
               , by = "30 min", length.out = nRec)
  dsTest <- data.frame(
    time = times
    , soilResp = rnorm(nRec), sdSoilResp = 0.1
  )
  tmpDir <- tempdir()
  #tmpDir <- "tmp"
  ncFileDs <- createStdNcdfFile(
    data = dsTest
    , file.name = file.path(tmpDir,"dsTestTime.nc")
    , lat.values = 53.0
    , long.values = 13
    , time.values = times
    , units = rep('g/m^2',2)
  )
  ans <- readNcdfTime(ncFileDs)  
  expect_equal(ans, times)
  #
  # modify file to use different origin
  origin2 <-  ISOdatetime(1970,1,1,0,0,0, tz = "UTC")
  ans <- modifyNcdfWriteTime(ncFileDs, origin = origin2)
  expect_equal( ans, ncdfTools:::.POSIX2DaysSinceOrigin(times, origin = origin2))
  ansInfo <- infoNcdfAtts(ncFileDs, var.id = "time")
  expect_equal(ansInfo["units","value"], "days since 1970-01-01")
  ans <- readNcdfTime(ncFileDs)  
  expect_equal(ans, times)
  #
  # convert to standard time units again
  ans <- modifyNcdfWriteTime(ncFileDs)
  expect_equal( ans, ncdfTools:::.POSIX2DaysSinceOrigin(times))
  ansInfo <- infoNcdfAtts(ncFileDs, var.id = "time")
  expect_equal(ansInfo["units","value"], "days since 1582-10-15")
  ans <- readNcdfTime(ncFileDs)  
  expect_equal(ans, times)
})

