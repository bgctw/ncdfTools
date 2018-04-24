#require(testthat)
context('misc')

test_that('classR2Ncdf',{
  expect_equal( classR2Ncdf(1L), "NC_INT")
  expect_equal( classR2Ncdf(1.01), "NC_DOUBLE")
  expect_equal( classR2Ncdf(33000), "NC_DOUBLE")
  expect_equal( classR2Ncdf('site'), "NC_CHAR")
})

