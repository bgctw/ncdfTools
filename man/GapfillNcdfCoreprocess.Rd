\name{GapfillNcdfCoreprocess}
\alias{GapfillNcdfCoreprocess}
\title{helper function for GapfillNcdf}
\description{####################### gapfill function for single core ####################}
\usage{GapfillNcdfCoreprocess(iter.nr = i, print.status = TRUE, datacube, 
    dims.process.id, iters.n, dims.cycle.length, dims.cycle.id, 
    iter.gridind, ind.process.cube, first.guess, datapts.n, args.call.SSA, 
    file.name, dims.process.length, MSSA, MSSA.blocksize, h)}
\arguments{
  \item{iter.nr}{
}
  \item{print.status}{
}
  \item{datacube}{
}
  \item{dims.process.id}{
}
  \item{iters.n}{
}
  \item{dims.cycle.length}{
}
  \item{dims.cycle.id}{
}
  \item{iter.gridind}{
}
  \item{ind.process.cube}{
}
  \item{first.guess}{
}
  \item{datapts.n}{
}
  \item{args.call.SSA}{
}
  \item{file.name}{
}
  \item{dims.process.length}{
}
  \item{MSSA}{
}
  \item{MSSA.blocksize}{
}
  \item{h}{
}
}
\details{helper function for GapfillNcdf performs each individual series/grid 
extracion and handing it over to GapfillSSA}


\author{Jannis v. Buttlar}



\seealso{\code{\link{GapfillNcdf}}, \code{\link{foreach}}                                     }

