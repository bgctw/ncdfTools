\name{readFLUXNETNcdf}
\alias{readFLUXNETNcdf}
\title{readFLUXNETNcdf}
\description{read data from FLUXNET Ncdf file.}
\usage{readFLUXNETNcdf(path = getwd(), sites, pars = "all", 
    time.ends, dim.borders = list(1))}
\arguments{
  \item{path}{character string: path to the input file(s)}
  \item{sites}{character string: ids of the sites to extract}
  \item{pars}{character string: names of the variables to extract}
  \item{time.ends}{POSIXct object: start and end date of the period to extract.}
  \item{dim.borders}{list: indices for other dimensions}
}

\value{array: FLUXNET data}

\author{Jannis v. Buttlar, Thomas Wutzler}





