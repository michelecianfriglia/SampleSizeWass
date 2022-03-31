#' @title Boolean
#'
#' @description Checks if an object is a boolean.
#'
#' @usage is.boolean(x)
#'
#' @return A logical value.
#'
#' @note This is an internal function. Cannot be used directly.
#'
#' @author Michele Cianfriglia \email{michele.cianfriglia@@uniroma1.it}
#'
#' @keywords internal
is.boolean = function(x){

  is.logical(x) && length(x) == 1 && !is.na(x)

}
