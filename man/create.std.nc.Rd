\name{create.std.nc}
\alias{create.std.nc}
\title{create an empty ncdf file with standardized attributes and dimensions}
\description{This function writes an empty ncdf file with variable names, dimensions and
attributes formated in a standardized way.}
\usage{create.std.nc(var.name, file.name = c(), units = "[]", lat.values = c(), 
    long.values = c(), time.values = c(), lat.length = length(lat.values), 
    long.length = length(long.values), time.length = length(time.values), 
    year.start.end = c(), scale_factor = 1, add_offset = 0, type.var = "NC_DOUBLE", 
    missing_value = -9999, con.atts = c())}
\arguments{
  \item{var.name}{character string: name of the target variable in the file}
  \item{file.name}{
}
  \item{units}{character string: units of variable (should be compatible with udunits)}
  \item{lat.values}{
}
  \item{long.values}{
}
  \item{time.values}{POSIXct vector: time values for the time dimension}
  \item{lat.length}{integer: length of the latitude dimension}
  \item{long.length}{integer: length of the longitude dimension}
  \item{time.length}{integer: length of the time dimension}
  \item{year.start.end}{
}
  \item{scale_factor}{numeric: scale factor}
  \item{add_offset}{numeric: offset}
  \item{type.var}{character string: type of the data}
  \item{missing_value}{numeric: missing data value}
  \item{con.atts}{
}
}



\author{Jannis v. Buttlar}





