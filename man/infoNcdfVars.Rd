\name{infoNcdfVars}
\alias{infoNcdfVars}
\title{infoNcdfVars}
\description{Display information about all variables in ncdf file
This function returns different summary information about all variables
in a NCDF file.}
\usage{infoNcdfVars(file.con, order.var = c("id", 
    "name")[2], info.ext = FALSE, dimvars = FALSE)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{order.var}{character vector:
Whether to sort the variables according to their name (default) or id.}
  \item{info.ext}{logical: whether to compute ranges/means etc. for the variables.
Setting this to TRUE may take a while to compute with large files.}
  \item{dimvars}{logical: whether to include the coordinate variables in the output.}
}

\value{a dataframe with the different information in its columns and each 
variable in one row.}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{infoNcdfDims}}, \code{\link{infoNcdfAtts}}}

