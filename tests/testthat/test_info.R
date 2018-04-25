#require(testthat)
context('info')

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
  , file.name = file.path(tmpDir,"dsSoilResp.nc")
  , lat.values = 53.0
  , long.values = 13
  , time.values = times
  , units = rep('g/m^2',2)
)
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

test_that('infoNcdfDims',{
  ans <- infoNcdfDims(fileName)
  expect_true( is.data.frame(ans) )
  expect_equal(ans$id, 0:2)
  expect_true(all(c("latitude","longitude","time") %in% ans$name))
  expect_equal(ans$length[match(c("latitude","longitude","time"),ans$name)], c(1,1,30))
})

test_that('infoNcdfVars',{
  ans <- infoNcdfVars(fileName, order.var = 'id')
  expect_true( is.data.frame(ans) )
  #expect_true(all(c("soilResp","sdSoilResp") %in% ans$name))
  #expect_equal(ans$n.dims[match(c("soilResp","sdSoilResp"),ans$name)], c(3,3))
  expect_true(all(c("soilResp") %in% ans$name))
  expect_equal(ans$n.dims[match(c("soilResp"),ans$name)], c(3))
  ##TODO
  #expect_equal(ans$n.dims[match(c("soilResp","sdSoilResp"),ans$name)], c("g/m^2","g/m^2"))
})

test_that('infoNcdfAtts global',{
  ans <- infoNcdfAtts(fileName)
  expect_true(all(c("history") %in% ans[,'name']))
})

test_that('infoNcdfAtts of a variable',{
  ans <- infoNcdfAtts(fileName, "soilResp")
  expect_true(all(c(
    "scale_factor", "add_offset", "missing_value", "_FillValue","units") 
    %in% ans[,'name']))
})

test_that('readCoordinatesNcdf',{
  ans <- readCoordinatesNcdf(fileName)
  expect_true(is.list(ans))
  expect_true(all(c(
    "latitude", "longitude", "time") 
    %in% names(ans)))
  expect_equal(as.vector(ans$latitude), 53)
  expect_equivalent(as.vector(ans$longitude), 13)
  expect_equal(length(ans$time), length(times) )
})

test_that('readNcdfVarName',{
  ans <- readNcdfVarName(fileName)
  expect_equal( ans, "soilResp" )
})

test_that('readNcdf',{
  ans <- readNcdf(fileName)
  #TODO
  #expect_equal( ans, "soilResp" )
})




test_that('convertDateNcdf2R',{
  ans <- convertDateNcdf2R(fileName)
  expect_true( inherits(ans, "POSIXct") )
  #TODO expect_equal( ans[1], times[1] )
})

test_that('modifyNcdfAppendHistory',{
  hist1 <- infoNcdfAtts(fileName)["history","value"]
  histAdd <- "__encouterThisCodeAgain__"
  modifyNcdfAppendHistory( fileName, histAdd)
  hist2 <- infoNcdfAtts(fileName)["history","value"]
  expect_true( length(grep(histAdd, hist2)) != 0 )
})

test_that('modifyNcdfCopyAtts',{
  ## TODO, right now having not differences in test file
  #ncCon <- RNetCDF::open.nc(fileName)
  #RNetCDF::close.nc(ncCon)
})

test_that('modifyNcdfCopyMetadata',{
  ## TODO, right now having not differences in test file
})

test_that('modifyNcdfCopyVar',{
  ## TODO, right now having not differences in test file
})

test_that('modifyNcdfDefAtts',{
  attributes.define <- list(
    LongName = 'This is the long name',
    missingValue = -99999,
    units = 'm/s')
  ## needs an open connection to a valid ncdf file pointed to by file.con
  file.con   <- RNetCDF::create.nc(file.path(tempdir(),'test.nc'))
  RNetCDF::dim.def.nc(file.con, 'testdim')
  RNetCDF::var.def.nc(file.con, 'test', 'NC_CHAR', 'testdim')
  modifyNcdfDefAtts(file.con, 'test', atts = attributes.define)
  ## show all attributes
  infoAtt <- infoNcdfAtts(file.con, 'test')
  RNetCDF::close.nc(file.con)
  expect_true( all(names(attributes.define) %in% infoAtt[,'name']))
  expect_equal( infoAtt[,'value'][match(names(attributes.define), infoAtt[,'name'])]
                ,unlist(attributes.define))
})

test_that('plotDatacube',{
  # TODO: need a real spatially resolved ncdf-File
  #plotDatacube(fileName)
})

test_that('checkNcdfFile',{
  ans <- checkNcdfFile(fileName)
  #TODO expect_true(ans)
})




