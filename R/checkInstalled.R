checkInstalled <- function(commandName) {
 out <- try(system(paste('which', commandName), intern = TRUE), silent = TRUE)
 if (length(out) == 0) {
   FALSE
 } else {
   TRUE
 }
}
