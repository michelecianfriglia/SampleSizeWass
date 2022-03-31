#' @title Argument Check
#'
#' @description Checks if the arguments of the \code{\link{PPC.binom.exact}} function are correctly specified.
#'
#' @usage check.PPC.binom.exact(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, xi, v, q, M, plot)
#'
#' @return An error message.
#'
#' @note This is an internal function. Cannot be used directly.
#'
#' @author Michele Cianfriglia \email{michele.cianfriglia@@uniroma1.it}
#'
#' @keywords internal
#'
#' @importFrom crayon italic
check.PPC.binom.exact = function(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, xi, v, q, M, plot){

  if(anyNA(n)) stop(paste(italic("n"), "cannot contain missing values or NaNs."))
  if(any(!is.vector(n), min(n) <= 0, any(n != floor(n)))) stop(paste(italic("n"), "must be a vector of positive integers."))
  if(is.unsorted(n, strictly = TRUE)) stop(paste(italic("n"), "must be strictly increasing."))
  if(any(!is.number(alpha1), alpha1 < 0, is.infinite(alpha1), !is.number(beta1), beta1 < 0, is.infinite(beta1))) stop(paste(italic("alpha1"), "and", italic("beta1"), "must be non-negative values."))
  if(any(!is.number(alpha2), alpha2 < 0, is.infinite(alpha2), !is.number(beta2), beta2 < 0, is.infinite(beta2))) stop(paste(italic("alpha2"), "and", italic("beta2"), "must be non-negative values."))
  if(any(!is.number(alphaD), alphaD <= 0, is.infinite(alphaD), !is.number(betaD), betaD <= 0, is.infinite(betaD))) stop(paste(italic("alphaD"), "and", italic("betaD"), "must be positive values."))
  if(any(!is.number(xi), xi <= 0)) stop(paste(italic("xi"), "must be a positive value."))
  if(any(!is.number(v), v <= 0, v >= 1)) stop(paste(italic("v"), "must be a value in (0, 1)."))
  if(any(!is.number(q), q < 1, is.infinite(q))) stop(paste(italic("q"), "must be a value in [1, Inf)."))
  if(any(!is.number(M, int = TRUE), M <= 0, is.infinite(M))) stop(paste(italic("M"), "must be a positive integer."))
  if(!is.boolean(plot)) stop(paste(italic("plot"), "must be TRUE or FALSE."))

}
