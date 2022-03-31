#' @title Predictive Probability
#'
#' @description Computes the predictive probability for the \code{\link{PPC.binom.exact}} function.
#'
#' @usage pred.prob.binom.exact(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, xi, q, M)
#'
#' @return A numeric value.
#'
#' @note This is an internal function. Cannot be used directly.
#'
#' @author Michele Cianfriglia \email{michele.cianfriglia@@uniroma1.it}
#'
#' @keywords internal
#'
#' @importFrom extraDistr rbbinom
#' @importFrom stats integrate qbeta
pred.prob.binom.exact = function(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, xi, q, M){

  integrand = function(x, n, alpha1, beta1, alpha2, beta2, sn, q){

    abs(qbeta(x, alpha1 + sn, beta1 + n - sn) - qbeta(x, alpha2 + sn, beta2 + n - sn))^q

  }

  wass.dist = function(){

    (integrate(integrand, 0, 1, n, alpha1, beta1, alpha2, beta2, rbbinom(1, n, alphaD, betaD), q)$value)^(1/q)

  }

  return(mean(replicate(M, wass.dist()) > xi))

}
