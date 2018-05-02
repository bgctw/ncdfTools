---
output: 
  rmarkdown::html_vignette:
    keep_md: true
vignette: >
  %\VignetteEngine{knitr::rmarkdown_notangle}
  %\VignetteIndexEntry{typical use case}
  %\usepackage[UTF-8]{inputenc}
---








# Typical workflow

## Creating a new point-nc-File

```r
require(ncdfTools)
nRec <- 30L
times <- seq(ISOdatetime(2010,1,1,0,0,0, tz = "UTC")
             , by = "30 min", length.out = nRec)
dsTest <- data.frame(
  time = times
  , soilResp = rnorm(nRec)
  , sdSoilResp = 0.1
)
dsTest$sdSoilResp[2:4] <- NA
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
```

## Getting information on file structure

Dimensions

```r
infoNcdfDims(ncFile)
```

```
##   id      name length min max step
## 1  0  latitude      1  NA  NA   NA
## 2  1 longitude      1  NA  NA   NA
## 3  2      time     30  NA  NA   NA
```

Variables

```r
#infoNcdfVars(ncFile, order.var = 'id')
infoNcdfVars(ncFileDs, order.var = 'id')
```

```
##   id       name  unit n.dims      type n.values range    1.dim     2.dim
## 4  3   soilResp g/m^2      3 NC_DOUBLE        0       latitude longitude
## 5  4 sdSoilResp g/m^2      3 NC_DOUBLE        0       latitude longitude
##   3.dim dim.id.1 dim.id.2 dim.id.3
## 4  time        0        1        2
## 5  time        0        1        2
```

global attributes

```r
as.data.frame(infoNcdfAtts(ncFile))
```

```
##            name                                      value    type
## history history 2018-05-02 15:34:23: File created by twutz NC_CHAR
```
and variable attributes

```r
as.data.frame(infoNcdfAtts(ncFile, "soilResp"))
```

```
##                        name value      type
## scale_factor   scale_factor     1 NC_DOUBLE
## add_offset       add_offset     0 NC_DOUBLE
## missing_value missing_value -9999 NC_DOUBLE
## _FillValue       _FillValue -9999 NC_DOUBLE
## units                 units  g/m2   NC_CHAR
```

Coordinate values

```r
readCoordinatesNcdf(ncFile)
```

```
## $latitude
## [1] 53
## 
## $longitude
## [1] 13
## 
## $time
##  [1] 156037.0 156037.0 156037.0 156037.1 156037.1 156037.1 156037.1
##  [8] 156037.1 156037.2 156037.2 156037.2 156037.2 156037.2 156037.3
## [15] 156037.3 156037.3 156037.3 156037.4 156037.4 156037.4 156037.4
## [22] 156037.4 156037.5 156037.5 156037.5 156037.5 156037.5 156037.6
## [29] 156037.6 156037.6
```

Try matching the main variable (not dimensions, having most dimenstion, matching filename)

```r
readNcdfVarName(ncFile)
```

```
## [1] "soilResp"
```

typing-sparse reading of a single variable from ncdf-File

```r
ans <- readNcdf(ncFile) 
all(ans - dsTest$soilResp < 1e-10 )
```

```
## [1] TRUE
```


checking file structure compliance to CF/COARDS/MDI ncdf conventions

```r
checkNcdfFile(ncFile)
```

```
## Warning in checkNcdfFile(ncFile): Consider adding the following global
## attributes: title, reference, provided_by, created_by
```

```
## File check passed!
```

## Modifying NetCDF files in place
appending string to the history

```r
modifyNcdfAppendHistory( ncFile, "another history entry")
cat(infoNcdfAtts(ncFile)["history","value"])
```

```
## 2018-05-02 15:34:23: File created by twutz
## 2018-05-02 15:34:23: another history entry by twutz
```
see also modifyNcdfDefAtts, modifyNcdfCopyAtts, modifyNcdfCopyMetadata, modifyNcdfCopyVar.

## Conversion between R and NetCDF
Dates

```r
ncCon <- RNetCDF::open.nc(fileName)
timesNCOrig <- RNetCDF::var.get.nc(ncCon, 'time')
RNetCDF::close.nc(ncCon)
head(timesR <- readNcdfTime(fileName))
```

```
## [1] "2010-01-01 00:00:00 UTC" "2010-01-01 00:30:00 UTC"
## [3] "2010-01-01 01:00:00 UTC" "2010-01-01 01:30:00 UTC"
## [5] "2010-01-01 02:00:00 UTC" "2010-01-01 02:30:00 UTC"
```

```r
all( (POSIX2ncdf(timesR) - timesNCOrig) == 0)
```

```
## [1] TRUE
```

## CDO commands
time aggregation

```r
tmpDir <- tempdir()
ans <- aggregateNcdf(ncFile, path.out = tmpDir, period = 2)
```

```
## Created file /tmp/RtmpSfjhyV/soilResp.1.1.30_2.nc
```


## Adding and deleting variables

Here, functions from RNetCDF package are used.
First the variable, needs to be created, this is done easiest by copying an
existing one, so that dimensions and attributes are taken care of.

```r
require(RNetCDF)
varName <- "soilRespSquared"
# work on tempfile to not change the original file
tmpFile <- tempfile(); tmp <- file.copy(fileName, tmpFile)
ncCon <- open.nc(tmpFile, write = TRUE)
tryCatch({
  resp <- var.get.nc(ncCon, 'soilResp')
  ans <- modifyNcdfCopyVar(
    ncCon, var.id.orig = "soilResp", var.id.copy = varName)
  #TODO change unit
  respSquared <- resp^2
  var.put.nc(ncCon, 'soilRespSquared', respSquared, count = c(1,1,length(resp)))
}, finally = {
 close.nc(ncCon)
})
infoNcdfVars(tmpFile)  # note line with variable soilRespSquared
```

```
##   id            name unit n.dims      type n.values range    1.dim
## 4  3        soilResp g/m2      3 NC_DOUBLE        0       latitude
## 5  4 soilRespSquared g/m2      3 NC_DOUBLE        0       latitude
##       2.dim 3.dim dim.id.1 dim.id.2 dim.id.3
## 4 longitude  time        0        1        2
## 5 longitude  time        0        1        2
```

```r
# delete variable again (uses CDO command)
tmp <- modifyNcdfDeleteVar(tmpFile, varNames = varName)
infoNcdfVars(tmpFile)  # note that soilRespSquared disappeared
```

```
##   id     name unit n.dims      type n.values range     1.dim    2.dim
## 4  3 soilResp g/m2      3 NC_DOUBLE        0       longitude latitude
##   3.dim dim.id.1 dim.id.2 dim.id.3
## 4  time        1        0        2
```

## Reading and writing data.frames

First write a dta.frame to file. 
Note that colum 'time' by default is written to the time dimension.

```r
tmpFile <- tempfile()
str(dsTest)
```

```
## 'data.frame':	30 obs. of  3 variables:
##  $ time      : POSIXct, format: "2010-01-01 00:00:00" "2010-01-01 00:30:00" ...
##  $ soilResp  : num  0.932 0.108 0.386 1.418 1.329 ...
##  $ sdSoilResp: num  0.1 NA NA NA 0.1 0.1 0.1 0.1 0.1 0.1 ...
```

```r
fName <- createStdNcdfFile(
  data = dsTest
  , file.name = tmpFile
  , lat.values = 53.0
  , long.values = 13
  , units = rep('g/m2',2)
  )
```

```
## Created file/tmp/RtmpSfjhyV/file3f65227d09b6.nc
```

```r
infoNcdfVars(fName, dimvars = TRUE)
```

```
##   id       name                        unit n.dims      type n.values
## 1  0   latitude               degrees_north      1 NC_DOUBLE        0
## 2  1  longitude                degrees_east      1 NC_DOUBLE        0
## 5  4 sdSoilResp                        g/m2      3 NC_DOUBLE        0
## 4  3   soilResp                        g/m2      3 NC_DOUBLE        0
## 3  2       time days since 1582-10-15 00:00      1 NC_DOUBLE        0
##   range    1.dim     2.dim 3.dim dim.id.1 dim.id.2 dim.id.3
## 1       latitude      <NA>  <NA>        0       NA       NA
## 2           <NA> longitude  <NA>        1       NA       NA
## 5       latitude longitude  time        0        1        2
## 4       latitude longitude  time        0        1        2
## 3           <NA>      <NA>  time        2       NA       NA
```

Use RNetCDF to read data into a general list.

```r
require(RNetCDF)
ncCon <- open.nc(fName)
tryCatch({
  ans <- read.nc(ncCon)
}, finally = {
 close.nc(ncCon)
})
str(ans)
```

```
## List of 5
##  $ latitude  : num [1(1d)] 53
##  $ longitude : num [1(1d)] 13
##  $ time      : num [1:30(1d)] 156037 156037 156037 156037 156037 ...
##  $ soilResp  : num [1:30(1d)] 0.932 0.108 0.386 1.418 1.329 ...
##  $ sdSoilResp: num [1:30(1d)] 0.1 NA NA NA 0.1 0.1 0.1 0.1 0.1 0.1 ...
```

Use ncdfTools to read single dimensional data into a data.frame.
The default single dimension is time and is by default converted to POSIXct.

```r
ans <- readNcdfDataframe(fName)
head(ans)
```

```
##                  time   soilResp sdSoilResp
## 1 2010-01-01 00:00:00  0.9323777        0.1
## 2 2010-01-01 00:30:00  0.1078955         NA
## 3 2010-01-01 01:00:00  0.3860979         NA
## 4 2010-01-01 01:30:00  1.4179382         NA
## 5 2010-01-01 02:00:00  1.3292335        0.1
## 6 2010-01-01 02:30:00 -1.2187975        0.1
```

