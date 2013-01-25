\name{ncdf.get.varinfo}
\alias{ncdf.get.varinfo}
\title{display information about all ncdf variables}
\description{returns different summary information about all variables in a NCDF file.}
\usage{ncdf.get.varinfo(file.con, order.var = c("id", "name")[2], info.ext = FALSE)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file}
  \item{order.var}{
}
  \item{info.ext}{logical: whether to compute ranges/means etc. for the variables.
Setting this to TRUE may take a while to compute with large files.}
}

\value{a dataframe with the different information in its colums and each variable in one row.}

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.get.diminfo}}, \code{\link{ncdf.get.varinfo}}}

