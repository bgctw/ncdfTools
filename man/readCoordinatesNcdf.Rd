\name{readCoordinatesNcdf}
\alias{readCoordinatesNcdf}
\title{readCoordinatesNcdf}
\description{read coordinate or dimension values from ncdf file}
\usage{readCoordinatesNcdf(fileCon)}
\arguments{
  \item{fileCon}{ncdf file connection or character string: Connection to the
ncdf file or its file name. In the latter case, the connection is
created and closed automatically.}
}

\value{A list with the coordinate values (if available) for all dimensions.}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{infoNcdfDims}}}

