image.rotated = function(
        data          ##<< matrix: data to be plotted
        ,col.vals = c() ##<< numeric vector: coordinate values for the columns of data
        ,row.vals = c() ##<< numeric vector: coordinate values for the rows of data
        ,scale = TRUE
        ,col = heat.colors(20)
        ,zlim = range(data, na.rm=TRUE)
        ,title = ''
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
    if (is.numeric(col.vals)) {
       coords$x <- c(col.vals[1], col.vals[length(col.vals)])
    }
    
    coords$y <- c(dim(data)[1], 1)
    if (length(row.vals) == 0) {
      row.vals <- rownames(data)
      if  (is.null(row.vals))
        row.vals =  1:dim(data)[1]      
    }
    if (is.numeric(row.vals)) {
      coords$y <- rev(c(row.vals[1], row.vals[length(row.vals)]))
    }
  
    options(oopts)
    data.p =t(data)[,dim(data)[1]:1]
    par(las = 1, tcl = 0.2, mgp = c(1,0,0))
    if (scale) {
      old.mar <- par()$mar
      par(mar=par()$mar + c(0,0,0,2))
    }  
    
    ## do plot
    image(z = data.p, xaxt = 'n', yaxt = 'n', col = col, zlim = zlim, useRaster = TRUE, ...)

    # add zrange outliers 
    outer.range <- c(0, 0)
    if (sum(data.p > max(zlim), na.rm = TRUE) > 0) {
      require(jannis.misc)
      col.drk = ColorChangeDarkness(col[length(col)], 0.5)
      par(new = TRUE)
      image(z = data.p, col = col.drk, zlim = c(max(zlim), max(data.p, na.rm = TRUE)), xaxt = 'n', yaxt = 'n', useRaster = TRUE)
      outer.range[2] <- 1
    }  
    if (sum((data.p < min(zlim)), na.rm = TRUE) > 0 ) {
      require(jannis.misc)
      col.drk = ColorChangeDarkness(col[1], 0.5)
      par(new = TRUE)
      image(z = data.p, col = col.drk, zlim = c(min(data.p, na.rm = TRUE), min(zlim)), xaxt = 'n', yaxt = 'n', useRaster = TRUE)
      outer.range[1] <- 1
    }      
    par(new=TRUE)
    limits <- list(x = coords$x + c(-1,1)*diff(coords$x)/(2*(length(col.vals)-1)),
                   y = coords$y + c(-1,1)*diff(coords$y)/(2*(length(row.vals)-1)))
    plot(0,0,type ='n', xlim = limits$x, ylim = limits$y, xaxt = 'n', yaxt = 'n', 
         xlab = '', ylab = '', xaxs = 'i', yaxs = 'i')
    if (is.null(add.args$xaxt) || add.args$xaxt != 'n') { 
      if (is.numeric(col.vals)) {
        axis(side = 1)
      } else {
        axis(side = 1, labels = col.vals, at = coords$x[1]:coords$x[2], ...)
      }  
    }
    if (is.null(add.args$yaxt) || add.args$yaxt != 'n') {
      if (is.numeric(row.vals)) {
        axis(side = 2)
      } else {
        axis(side = 2, labels = row.vals, at = coords$y[2]:coords$y[1], ...)
      }
    }
    if (scale) {
      PlotColorScale(col = col, pos = 'right', zlim = zlim, outer.range = outer.range, title = title)
      par(mar = old.mar)
    }
}    
