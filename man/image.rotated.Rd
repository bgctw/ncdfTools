\name{image.rotated}
\alias{image.rotated}
\title{plot rotated image plot}
\description{plot a raster/matrix using image() but supplying a rotated version of the matrix}
\usage{\method{image}{rotated}(data, col.vals = c(), row.vals = c(), scale = TRUE, 
    col = heat.colors(20), zlim = range(data, na.rm = TRUE), 
    title = "", useRaster = TRUE, ...)}
\arguments{
  \item{data}{matrix: data to be plotted}
  \item{col.vals}{numeric vector: coordinate values for the columns of data}
  \item{row.vals}{numeric vector: coordinate values for the rows of data}
  \item{scale}{
}
  \item{col}{
}
  \item{zlim}{
}
  \item{title}{
}
  \item{useRaster}{
}
  \item{\dots}{further arguments passed to image}
}
\details{The normal image() function always plots a rotated version of a matrix. This function 
rotates the input to image in a way that the first entry of the matrix (col=1,row=1)
shows up at the top-left corner of the plot. In other words the way a matrix would be 
displayed by printing it is directly mapped to the plot.}


\author{Jannis v. Buttlar}



\seealso{\code{\link{image}}, the plotting routines of the raster package}

