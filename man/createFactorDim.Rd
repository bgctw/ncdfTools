\name{createFactorDim}
\alias{createFactorDim}
\title{createFactorDim}
\description{define a new dimension with ordinal values, i.e. a factor}
\usage{createFactorDim(ncFile, dimName, levels)}
\arguments{
  \item{ncFile}{file: scalar character string parh or nc connection}
  \item{dimName}{name (scalar string): if the dimension}
  \item{levels}{string vector of factor levels}
}
\details{The type of the dimension will be NC_INT (1:nLevel).
The unit attribute lists the meaning of the factor levels}


\author{Jannis v. Buttlar, Thomas Wutzler}





