\name{POSIX2ncdf}
\alias{POSIX2ncdf}
\title{POSIX2ncdf}
\description{convert POSIXct to ncdf time}
\usage{POSIX2ncdf(x, unit = "days since 1582-10-15 00:00")}
\arguments{
  \item{x}{POSIXct vector}
  \item{unit}{unit to convert to}
}

\value{numeric vector of ncdf-Time }

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{ncdf2POSIX}}}
\examples{
timesOrig <- seq(
  ISOdatetime(2010,1,1,0,0,0,tz = 'UTC'), by = "30 min", length.out = 10)
unit <- "days since 1582-10-15 00:00"
timesDays <- POSIX2ncdf(timesOrig, unit)
timesPosix <- ncdf2POSIX(timesDays, unit)
all( timesPosix == timesOrig)
}
