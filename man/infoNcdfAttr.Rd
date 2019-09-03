\name{infoNcdfAttr}
\alias{infoNcdfAttr}
\title{infoNcdfAttr}
\description{get summary of all ncdf variable attributes}
\usage{infoNcdfAttr(file.con, attr, var.id = "NC_GLOBAL", 
    info = infoNcdfAtts(file.con, var.id))}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{attr}{string of the attribute name, e.g. "units"}
  \item{var.id}{the name or id of the variable for which to
get attribute}
  \item{info}{may provide result of
\code{\link{infoNcdfAtts}} for efficiency}
}

\value{scalar attribute string of first matched attribute}

\author{Jannis v. Buttlar, Thomas Wutzler}





