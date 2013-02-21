IsSeriesConstant <- function(x, tresh.const = 1e-12, ratio.const = 0.05) {
  if (sum(is.na(x)) == length(x)) {
    return(FALSE)
  } else {
    min.amount <-  (1 - ratio.const)*length(x[!is.na(x)])
    return(sum(abs(x - median(x, na.rm = TRUE)) <  tresh.const, na.rm = TRUE) >= min.amount)
  }
}
