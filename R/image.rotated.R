image.rotated = function(
        data          ##<< matrix: data to be plotted
        ,col.vals=c() ##<< numeric vector: coordinate values for the columns of data
        ,row.vals=c() ##<< numeric vector: coordinate values for the rows of data 
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
    if (length(col.vals)==0) {
        col.vals=colnames(data)
        if (is.null(col.vals))
            col.vals=1:dim(data)[2]
    }
    if (length(row.vals)==0) {
        row.vals=rownames(data)
        if (is.null(row.vals))
            row.vals=1:dim(data)[1]
    }
    data=t(data)[,dim(data)[1]:1]
    image(x=sort(col.vals),y=sort(row.vals),z=data,...)
}    
