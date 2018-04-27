#require(testthat)
context('misc')

test_that('classR2Ncdf',{
  expect_equal( classR2Ncdf(1L), "NC_INT")
  expect_equal( classR2Ncdf(1.01), "NC_DOUBLE")
  expect_equal( classR2Ncdf(33000), "NC_DOUBLE")
  expect_equal( classR2Ncdf('site'), "NC_CHAR")
})


test_that('.POSIX2DaysSinceOrigin and back',{
  timesOrig <- seq(
    ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
  timesDays <- ncdfTools:::.POSIX2DaysSinceOrigin(timesOrig)
  timesPosix <- ncdfTools:::.daysSinceOrigin2POSIX(timesDays)
  expect_true(all( timesPosix == timesOrig))
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

# TODO test writing and reading times in NetCDF files
