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
    add.args = list(...)
    if (length(col.vals)==0) { 
        col.strings=colnames(data)
        col.vals=1:dim(data)[2]
        if (is.null(col.strings))
          col.strings <- col.vals
    }
    if (length(row.vals)==0) {
        row.strings=rev(rownames(data))
        row.vals=1:dim(data)[1]
        if (is.null(col.strings))
          col.strings <- col.vals
    }
    data=t(data)[,dim(data)[1]:1]
    if (scale) {
      old.mar <- par()$mar
      par(mar=par()$mar + c(0,0,0,2))
    }  

    image(x=sort(col.vals),y=sort(row.vals),z=data,xaxt='n',yaxt='n',col=col,zlim=zlim,...)

    if (is.null(add.args$xaxt) || add.args$xaxt != 'n')
       axis(side=1,labels=col.strings,at=col.vals)
    if (is.null(add.args$yaxt) || add.args$yaxt != 'n')
       axis(side=2,labels=row.strings,at=row.vals)    
    
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
