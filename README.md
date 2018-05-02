
<!-- 
README.md is generated from README.Rmd. Please edit that file
#knitr::knit("README.Rmd") 
rmarkdown::render("README.Rmd") 
maybe clear cache before
-->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/ncdfTools)](http://cran.r-project.org/package=ncdfTools) [![Travis-CI Build Status](https://travis-ci.org/bgctw/ncdfTools.svg?branch=master)](https://travis-ci.org/bgctw/ncdfTools)

Overview
--------

`ncdfTools` provides convenious functions on top of RNetCDF.

Getting information on stored data:

- on variables: infoNcdfVars
- on dimensions: infoNcdfDims
- on attributes (global and for variables): infoNcdfAtts
- read coordinate or dimension values from ncdf file: readCoordinatesNcdf
- guess (single) variable name: readNcdfVarName
- fast reading of ncdf data: readNcdf and readNcdfDataframe

Modifying NetCDF files

- copy variable values between ncdf files: modifyNcdfCopyVar
- delete variable using cdo: modifyNcdfDeleteVar
- appending history attribute: modifyNcdfAppendHistory
- copy all attributes between different variables: modifyNcdfCopyAtts
- copy attributes and dimensions between ncdf files: modifyNcdfCopyMetadata
- define several ncdf attributes at once: modifyNcdfDefAtts
- set or read the values of the time dimension in a netCDF file: 
  modifyNcdfWriteTime and readNcdfTime

Conversion between R and NetCDF

- convert ncdf time to POSIXct and back: POSIX2ncdf and ncdf2POSIX

Constructing and executing cdo commands producing new ncdf-Files:

- aggregate data across time: aggregateNcdf
- merge several ncdf files: transNcdfMerge
- cut outer (time) margins of Ncdf files: transNcdfCutFiles
- transpose Ncdf datacube: transNcdfRotate
- cut subset out of ncdf file: transNcdfSubset

Futher functionality:

- checking file structure compliance to CF/COARDS/MDI ncdf conventions: checkNcdfFile
- determines ncdf class from R class: classR2Ncdf
- close all open ncdf connections: closeAllNcfiles
- checking file structure compliance to CF/COARDS/MDI ncdf conventions: checkNcdfFile
- read data from FLUXNET Ncdf file: readFLUXNETNcdf

Some functionality is tailored for use at BGI department at bgc-jena.mpg.de

- read data from FLUXNET Ncdf file: readFLUXNETNcdf


Installation
------------

- install required system libraries libnetcdf-dev, udunits-bin and libudunits2-dev
- install [RNetCDF package](http://r-forge.r-project.org/projects/rnetcdf)
- install this package
  -  currently only from source from [git.bgc-jena.mpg.de](https://git.bgc-jena.mpg.de/twutz/ncdfTools)

``` r
# Release stable version from CRAN
# not yet: install.packages("ncdfTools")

# The development version from GitHub using devtools:
# install.packages("devtools")
# not yet devtools::install_github("bgctw/ncdfTools")
```

Usage
-----

See  examples are in [vignette(ncdfToolsUseCase)](https://git.bgc-jena.mpg.de/twutz/ncdfTools/blob/master/vignettes/ncdfToolsUseCase.md) 

