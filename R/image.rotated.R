image.rotated = function(
        data          ##<< matrix: data to be plotted
        ,col.vals = c() ##<< numeric vector: coordinate values for the columns of data
        ,row.vals = c() ##<< numeric vector: coordinate values for the rows of data
        ,scale = TRUE
        ,col = heat.colors(20)
        ,zlim = range(data, na.rm=TRUE)
        ,...          ##<< further arguments passed to image
)
##title<< plot rotated image plot
##description<< plot a raster/matrix using image() but supplying a rotated version of the matrix
##details<< The normal image() function always plots a rotated version of a matrix. This function 
##          rotates the input to image in a way that the first entry of the matrix (col=1,row=1)
##          shows up at the top-left corner of the plot. In other words the way a matrix would be 
##          displayed by printing it is directly mapped to the plot.
##seealso<<
##\code{\link{image}}, the plotting routines of the raster package
{
    oopts <- options(warn = -1)
    add.args = list(...)
  
    coords=list()
    coords$x <- c(1, dim(data)[2])
    if (length(col.vals) == 0) {
      col.vals <- colnames(data)
      if  (is.null(col.vals))
        col.vals =  1:dim(data)[2]      
    }
    if (class(col.vals) == 'numeric') {
       coords$x <- range(col.vals)
    }
    
    coords$y <- c(dim(data)[1], 1)
    if (length(row.vals) == 0) {
      row.vals <- rownames(data)
      if  (is.null(row.vals))
        row.vals =  1:dim(data)[1]      
    }
    if (class(row.vals) == 'numeric') {
      coords$y <- rev(range(row.vals))
    }
  
    options(oopts)
    data.p =t(data)[,dim(data)[1]:1]
    par(las = 1, tcl = 0.2, mgp = c(1,0,0))
    if (scale) {
      old.mar <- par()$mar
      par(mar=par()$mar + c(0,0,0,2))
    }  
    
    
    image(z = data.p, xaxt = 'n', yaxt = 'n', col = col, zlim = zlim,...)
    par(new=TRUE)
    plot(0,0,type ='n', xlim = coords$x, ylim = coords$y, xaxt = 'n', yaxt = 'n', 
         xlab = '', ylab = '')
    if (is.null(add.args$xaxt) || add.args$xaxt != 'n') { 
      if (class(col.vals) == 'numeric') {
        axis(side = 1)
      } else {
        axis(side = 1, labels = col.vals, at = coords$x[1]:coords$x[2], ...)
      }  
    }
    if (is.null(add.args$yaxt) || add.args$yaxt != 'n') {
      if (class(row.vals) == 'numeric') {
        axis(side = 1)
      } else {
        axis(side = 2, labels = row.vals, at = coords$y[2]:coords$y[1], ...)
      }
    }
    if (scale) {
      require(plotrix)
      width.col<- 0.05*diff(par()$usr[1:2])
      x.coords <- par()$usr[2]+ c(0.5,1.5)*width.col
      y.coords <- par()$usr[3:4]
      color.legend(x.coords[1],y.coords[1],x.coords[2],y.coords[2],
                   rect.col= col,
                   legend=pretty(seq(zlim[1],zlim[2],
                     length.out = length(col)))
                   ,gradient='y',align='rb',cex=1.2)
    } 
    if (scale)  
      par(mar = old.mar)
}    
