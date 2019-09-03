\name{ncdf2POSIX}
\alias{ncdf2POSIX}
\title{ncdf2POSIX}
\description{convert ncdf time to POSIXct}
\usage{ncdf2POSIX(x, unit = "days since 1582-10-15 00:00", 
    tzone = "UTC")}
\arguments{
  \item{x}{ncdf time}
  \item{unit}{unit in which x is given}
  \item{tzone}{timezone formatting applied to the return value.
Use e.g. "CET" for central european time and 
"Etc/GMT-1" for central european time without daylight savings.}
}

\value{POSIXct vector}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{POSIX2ncdf}}}

