\name{modifyNcdfWriteTime}
\alias{modifyNcdfWriteTime}
\title{modifyNcdfWriteTime}
\description{set the values of the time dimension in a netCDF file }
\usage{modifyNcdfWriteTime(ncdf.obj, date.vec = "auto", 
    origin = ISOdatetime(1582, 10, 15, 0, 
        0, 0, tz = "UTC"), write.to.ncdf = TRUE, 
    timeVar = "time", user = Sys.info()["user"])}
\arguments{
  \item{ncdf.obj}{character string or ncdf connection:
ncdf file for which to convert the dates    }
  \item{date.vec}{POSIXct vector: date vectors for the time dimension.
If set to 'auto', this is tried to be extracted from the ncdf file.
This supports converting the time unit in a netCDF file to a days since origin.}
  \item{origin}{
}
  \item{write.to.ncdf}{logical: whether writing  time to the ncdf file.}
  \item{timeVar}{variable holding the values of time}
  \item{user}{user name in history attribute entry}
}
\details{Set a time vector in a ncdf file to a standardized 
format which is readable by most software. It transfers the time vector 
to days since the start of the Gregorian calendar.}
\value{(invisibly): the time vector in ncdf-format. 
Additionally the time vector is 
written to the respective file.}

\author{Jannis v. Buttlar, Thomas Wutzler}





