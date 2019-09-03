\name{createLatLongTime}
\alias{createLatLongTime}
\title{createLatLongTime}
\description{create empty lat/lon/time ncdf file}
\usage{createLatLongTime(file.name, varNames = sub("[.]nc", 
    "", file.name), lat.values = c(), long.values = c(), 
    time.values = c(), lat.length = length(lat.values), 
    long.length = length(long.values), time.length = length(time.values), 
    ..., units = "1", timeVar = "time", user = Sys.info()["user"])}
\arguments{
  \item{file.name}{character string: name of the target file.}
  \item{varNames}{character vector: names of the
variablesin the target file.}
  \item{lat.values}{numeric values: coordinate values for the latitude
positions.}
  \item{long.values}{numeric values: coordinate values for the latitude
positions.}
  \item{time.values}{POSIXct vector: values for the time dimension}
  \item{lat.length}{integer: length of the latitude dimension}
  \item{long.length}{integer: length of the longitude dimension}
  \item{time.length}{integer: length of the time dimension}
  \item{\dots}{further arguments to \code{\link{modifyNcdfAddVars}}}
  \item{units}{string vector: units of the variables in target file.}
  \item{timeVar}{the name of the time variable}
  \item{user}{user name put to history entry}
}
\details{Creates an empty standardized latitude/longitude/time ncdf file.}
\value{Nothing is returned but a file is created. 
TODO: units has to work with more than one variable}

\author{Jannis v. Buttlar, Thomas Wutzler}





