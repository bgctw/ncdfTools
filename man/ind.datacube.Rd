\name{ind.datacube}
\alias{ind.datacube}
\title{create logical index matrices for multidimensional datacubes}

\usage{ind.datacube(datacube, logical.ind, dims = "auto")}
\arguments{
  \item{datacube}{array: datacube from which to extract the subparts}
  \item{logical.ind}{logical array: TRUE/FALSE index matrix for a subset of the
dimensions of datacube. The size of logical.ind`s dimesnions 
has to match the sizes of the corresponding dimensions in 
datacube.}
  \item{dims}{integer vector or 'auto' : indices of the dimensions in
datacube corresponding to the dimensions of logical.ind. 
If set to 'auto' this matching is tried to be accomplished 
by comparing the sizes of the dimensions of the two objects.}
}

\value{integer index matrix which can be used to index datacube}

\author{Jannis v. Buttlar}





