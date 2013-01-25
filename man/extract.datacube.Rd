\name{extract.datacube}
\alias{extract.datacube}
\title{extract slices/vectors/arrays from multidimensional datacubes}

\usage{extract.datacube(datacube, logical.ind, dims = "auto")}
\arguments{
  \item{datacube}{array: datacube from which to extract the subparts}
  \item{logical.ind}{logical array: TRUE/FALSE index matrix for a subset of the dimensions
of datacube. The size of logical.ind`s dimesnions has to match the
sizes of the corresponding dimesnions in datacube.}
  \item{dims}{integer vector or 'auto' : indices of the dimensions in datacube corresponding
to the dimensions of logical.ind. If set to 'auto' this matching is tried to
be accomplished by comparing the sizes of the dimensions of the two objects.}
}

\value{logical index of the same dimensions of datacube}

\author{Jannis v. Buttlar}





