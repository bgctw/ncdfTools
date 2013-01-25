\name{ncdf.merge.files}
\alias{ncdf.merge.files}
\title{ncdf merge files}

\usage{ncdf.merge.files(file.names, name.change = function(x) return(x), 
    time.diff = NULL, fun.start = function(x) substr(x, nchar(x) - 
        15, nchar(x) - 10), fun.end = function(x) substr(x, nchar(x) - 
        8, nchar(x) - 3), time.range.out = c(), format = "\%Y\%m", 
    convert = function(x) chron(paste(x, "15", sep = ""), format = "ymd", 
        out.format = "d-m-y"), path.target = getwd())}
\arguments{
  \item{file.names}{
}
  \item{name.change}{
}
  \item{time.diff}{
}
  \item{fun.start}{
}
  \item{fun.end}{
}
  \item{time.range.out}{
}
  \item{format}{
}
  \item{convert}{
}
  \item{path.target}{
}
}



\author{Jannis v. Buttlar}





