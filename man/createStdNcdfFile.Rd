\name{createStdNcdfFile}
\alias{createStdNcdfFile}
\title{createStdNcdfFile}
\description{create an new ncdf file with standardized attributes and dimensions}
\usage{createStdNcdfFile(var.names = setdiff(names(data), 
    timeVar), file.name = c(), units = "[]", 
    lat.values = numeric(), long.values = numeric(), 
    time.values = data$time, lat.length = length(lat.values), 
    long.length = length(long.values), time.length = length(time.values), 
    year.start.end = c(), scale_factor = 1, 
    add_offset = 0, type.var = "NC_DOUBLE", 
    missing_value = -9999, con.atts = c(), 
    timeVar = "time", data = data.frame(), 
    ...)}
\arguments{
  \item{var.names}{string vector:
name of the target variables in the file}
  \item{file.name}{character string: name of the file. If not given, this
is determined automatically in a standardized way from 
the variable name and the dimension extends.}
  \item{units}{string vector: units of variable (should be
compatible with udunits)}
  \item{lat.values}{numeric values: coordinate values for the latitude
positions.}
  \item{long.values}{numeric values: coordinate values for the longitude
positions.}
  \item{time.values}{POSIXct vector: values for the time dimension}
  \item{lat.length}{integer: length of the latitude dimension}
  \item{long.length}{integer: length of the longitude dimension}
  \item{time.length}{integer: length of the time dimension}
  \item{year.start.end}{integer vector (length two): start and end year.
If not given, this is determined from the time
vector.}
  \item{scale_factor}{numeric: scale factor}
  \item{add_offset}{numeric: offset}
  \item{type.var}{character string: type of the data}
  \item{missing_value}{numeric: missing data value}
  \item{con.atts}{RNetCDF file connection: Possible file to use as source}
  \item{timeVar}{the name of the time variable
for copying attributes to the new file.}
  \item{data}{named list of cubes or a data.frame with values to store}
  \item{\dots}{further arguments to \code{\link{createLatLongTime}}
such as units, user, timeVar}
}
\details{This function writes an empty ncdf file with variable names, dimensions and
attributes formatted in a standardized way.

All variables, except time, are stored using the same specification
(scale_factor, add_offset, missing_value, type.var)

if a single variable is stored, data can be given as a cube instead
of a list or data.frame}
\value{character string: name off the file created.}

\author{Jannis v. Buttlar, Thomas Wutzler}





