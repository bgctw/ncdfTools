#require(testthat)
context('read and updateNcdfDataframe')

# TRUE during testthat::check()
isNotOnCRAN <- identical(Sys.getenv("NOT_CRAN"), "true")

# create a test data.frame and associated ncdf File
nRec <- 30L
times <- seq(ISOdatetime(2010,1,1,0,0,0, tz = "UTC")
             , by = "30 min", length.out = nRec)
dsTest <- data.frame(
  time = times
  , soilResp = rnorm(nRec)
  , sdSoilResp = 0.1
)
dsTest$sdSoilResp[2:4] <- NA

createTestFile <- function(){
  createStdNcdfFile(
    data = dsTest
    , file.name = tempfile()
    , lat.values = 53.0
    , long.values = 13
    , units = rep('g/m^2/day',2)
  )  
}

test_that("readNcdfDataframe",{
  fName <- createTestFile()
  ans <- readNcdfDataframe(fName)
  unlink(fName)
  expect_equal(ans, dsTest, check.attributes = FALSE)
  aUnits <- attr(ans,"units")
  expect_equal(aUnits, list(soilResp = "g/m^2/day", sdSoilResp = "g/m^2/day"))
  if (requireNamespace("units")) 
    expect_equal(units::deparse_unit(ans$soilResp),"g d-1 m-2")
})

test_that("readNcdfDataframe with variable name pattern",{
  fName <- createTestFile()
  ans <- readNcdfDataframe(fName, c("^soilResp"))
  ans2 <- readNcdfDataframe(fName, c("^soilResp","^sdSoilResp"))
  unlink(fName)
  expect_true("soilResp" %in% names(ans))
  expect_true(!("sdSoilResp" %in% names(ans)))
  expect_true(all(c("soilResp","sdSoilResp") %in% names(ans2)))
})

test_that("readNcdfDataframe with dimRange",{
  fName <- createTestFile()
  ans <- readNcdfDataframe(fName, dimRange = dsTest$time[c(4,8)])
  unlink(fName)
  expect_equivalent(ans, dsTest[4:8,,drop = FALSE]) # rownames differ
})

test_that("readNcdfDataframe with dimRange higher than data",{
  fName <- createTestFile()
  expect_warning(
  ans <- readNcdfDataframe(
    fName, dimRange = c(dsTest$time[4], ISOdate(2025,1,1)))
  ,"dimension end"
  )
  unlink(fName)
  expect_equivalent(ans, dsTest[4:nrow(dsTest),,drop = FALSE]) # rownames differ
})

test_that("readNcdfDataframe with dimRange lower than data",{
  fName <- createTestFile()
  expect_warning(
    ans <- readNcdfDataframe(
      fName, dimRange = c(ISOdate(1800,1,1), dsTest$time[4]))
    ,"dimension start"
  )
  unlink(fName)
  expect_equivalent(ans, dsTest[1:4,,drop = FALSE]) # rownames differ
})



test_that("updateNcdfDataframe normal",{
  fName <- createTestFile()
  iRecMod = 10:15
  dsMod <- dsTest[iRecMod,,drop = FALSE]
  dsMod$sdSoilResp <- 0.2
  updateNcdfDataframe(ds = dsMod, file.name = fName)
  ans <- readNcdfDataframe(fName)
  unlink(fName)
  expect_equal(ans[-iRecMod,], dsTest[-iRecMod,], check.attributes = FALSE)
  expect_equal(ans[iRecMod,], dsMod, check.attributes = FALSE)
})

test_that("updateNcdfDataframe missing timeCol",{
  fName <- createTestFile()
  iRecMod = 10:15
  dsMod <- dsTest[iRecMod,,drop = FALSE]
  dsMod$time <- NULL
  expect_error(
    updateNcdfDataframe(ds = dsMod, file.name = fName)
    , "time"
  )
  unlink(fName)
})

test_that("updateNcdfDataframe missing additional columns",{
  fName <- createTestFile()
  iRecMod = 10:15
  dsMod <- dsTest[iRecMod,,drop = FALSE]
  dsMod$addColumn <- 2
  expect_error(
    updateNcdfDataframe(ds = dsMod, file.name = fName)
    , "addColumn"
  )
  unlink(fName)
})

test_that("updateNcdfDataframe first entry not in dimension values",{
  fName <- createTestFile()
  dsRow1 <- dsTest[1,,drop = FALSE]
  dsRow1$time <- dsRow1$time - 1800
  dsMod <- rbind(dsRow1, dsTest)
  expect_error(
    updateNcdfDataframe(ds = dsMod, file.name = fName)
    , "First dimension value"
  )
  unlink(fName)
})

test_that("updateNcdfDataframe across end of dimension",{
  fName <- createTestFile()
  dsRow1 <- dsTest[nrow(dsTest),,drop = FALSE]
  dsRow1$time <- dsRow1$time + 1800
  dsMod <- rbind(dsTest, dsRow1)
  expect_error(
    updateNcdfDataframe(ds = dsMod, file.name = fName)
    , "Dimension values do not match"
  )
  unlink(fName)
})

test_that("updateNcdfDataframe time slice does not match",{
  fName <- createTestFile()
  iRecMod = 10:15
  dsMod <- dsTest[iRecMod,,drop = FALSE]
  dsMod$time[2] <- dsMod$time[2] + 5
  expect_error(
    updateNcdfDataframe(ds = dsMod, file.name = fName)
    , "Dimension values do not match"
  )
  unlink(fName)
})

