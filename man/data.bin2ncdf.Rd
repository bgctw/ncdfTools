\name{data.bin2ncdf}
\alias{data.bin2ncdf}
\title{tranform binary file to ncdf file}
\description{This function transforms a binary data file to a ncdf file formated in a standardized way.}
\usage{data.bin2ncdf(file.input, length = 1, type = numeric(), type.ncdf = "NC_DOUBLE", 
    dimensions, dimension.values, signed = TRUE, var.name, long_name = var.name, 
    var.units = "[]", scale.factor.in = 1, scale.factor.out = scale.factor.in, 
    na.value.in = -9999, na.value.out = na.value.in, offset.in = 0, 
    offset.out = offset.in)}
\arguments{
  \item{file.input}{charcter string: name of input file}
  \item{length}{integer: length in bytes of each entry in input file}
  \item{type}{R data type of the data in input file}
  \item{type.ncdf}{desired data type in ncdf file}
  \item{dimensions}{character vector: names of the dimensions in binary file}
  \item{dimension.values}{list: each list element has to contain the coordinate values for
respective dimension}
  \item{signed}{
}
  \item{var.name}{character string: short name of the variable in binary file}
  \item{long_name}{character string: long name of the variable in binary file}
  \item{var.units}{character string: units of variable}
  \item{scale.factor.in}{numeric: factor to multiply the input data with}
  \item{scale.factor.out}{numeric: desired scale factor of the data in the ncdf file.}
  \item{na.value.in}{numeric: missing value for input data}
  \item{na.value.out}{numeric: missing value for output data}
  \item{offset.in}{numeric: offset for input data}
  \item{offset.out}{numeric: offset for output data}
}

\value{Nothing is returned but a ncdf file with a standardized name is written in the working directory.}

\author{Jannis v. Buttlar}





