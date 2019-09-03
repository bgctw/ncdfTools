\name{readNcdfTime}
\alias{readNcdfTime}
\title{readNcdfTime}
\description{read the time from netCDF and convert to POSIXct}
\usage{readNcdfTime(time.source, timeVar = "time", 
    tzone = "UTC")}
\arguments{
  \item{time.source}{numeric vector or ncdf connection: either a file name or a
ncdf file connection}
  \item{timeVar}{variable holding the values of time}
  \item{tzone}{timezone formatting applied to the return value.}
}

\value{POSIXct vector: time vector in native R format}

\author{Jannis v. Buttlar, Thomas Wutzler}





