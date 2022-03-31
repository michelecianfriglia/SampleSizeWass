#' @title Number
#'
#' @description Checks if an object is a number. If required, checks that the object is an integer.
#'
#' @usage is.number(x, int = FALSE)
#'
#' @return A logical value.
#'
#' @note This is an internal function. Cannot be used directly.
#'
#' @author Michele Cianfriglia \email{michele.cianfriglia@@uniroma1.it}
#'
#' @keywords internal
is.number = function(x, int = FALSE){

  ifelse(int, is.numeric(x) && length(x) == 1 && !is.nan(x) && x == floor(x), is.numeric(x) && length(x) == 1 && !is.nan(x))

}
