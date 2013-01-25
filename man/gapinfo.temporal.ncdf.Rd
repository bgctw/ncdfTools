\name{gapinfo.temporal.ncdf}
\alias{gapinfo.temporal.ncdf}
\title{compute and plot statistics about temporal gaps in ncdf data cube}
\description{This function computes statistics like mean and maximum gap length for all time series in 
the data cube of a ncdf file. }
\usage{gapinfo.temporal.ncdf(ncdf.obj, var.name = "auto", ind.groups = c(), 
    grids.exclude = NULL, col.palette = colorRampPalette(c("blue", 
        "yellow", "red")))}
\arguments{
  \item{ncdf.obj}{file name or ncdf connection: link to the ncdf file to analyze}
  \item{var.name}{
}
  \item{ind.groups}{integer vector: index to group the time steps into different groups
which are analyzed independently. This, for example, helps to 
see seasonal differences. Needs to have the same length as the time 
dimension}
  \item{grids.exclude}{object to exclude grid cells (as, for example, ocean tiles) from the
analysis. Can be a function that is applied to the vectors of the data cube 
which returns a single TRUE/FALSE value per vector indicating whether to use
the whole vector. Another possibility is to supply a list with elements longitude
and latitude consisting of vectors with the indices along the repective
dimension of grid cells to exclude. A last optzion is to supply a matrix of 
logical values with its dimensions beeing identical with the spatial 
dimensions in the ncdf file.}
  \item{col.palette}{
}
}

\value{nothing is returned but plots of the gap statistics are produced.}

\author{Jannis v. Buttlar}



\seealso{\code{\link{temporalGaps}}}

