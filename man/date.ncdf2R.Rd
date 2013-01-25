\name{date.ncdf2R}
\alias{date.ncdf2R}
\title{convert ncdf time vector to POSIXct}
\description{This function converts a time vector from a ncdf file or a vector of Julian days (or seconds, minutes, hours)
since a specified origin into a POOSIXct R vector.}
\usage{date.ncdf2R(time.source, units = "days", origin = as.POSIXct("1582-10-14", 
    tz = "UTC"))}
\arguments{
  \item{time.source}{numeric vector or ncdf connection: either a number of time units since
origin or a ncdf file connection, In the latter case, the time 
vector is extracted from the ncdf file, This file, and especially the 
time variable, has to follow the CF ncdf conventions.}
  \item{units}{
}
  \item{origin}{
}
}



\author{Jannis v. Buttlar}





