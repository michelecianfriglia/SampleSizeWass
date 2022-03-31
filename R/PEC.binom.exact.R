#' @title Predictive Expectation Criterion: Binomial Model
#'
#' \loadmathjax{}
#'
#' @description Implements the predictive expectation criterion in the conjugate Binomial model using the exact expression of the \mjseqn{\ell_1} Wasserstein distance of order \mjseqn{q}.
#'
#' @usage PEC.binom.exact(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, v,
#'                 q = 1, M = 2500, plot = FALSE, seed = NULL)
#'
#' @param n The sample size. A vector of positive integers arranged in ascending order.
#' @param alpha1,beta1 Parameters of the first Beta distribution.
#' @param alpha2,beta2 Parameters of the second Beta distribution.
#' @param alphaD,betaD Parameters of the design Beta distribution.
#' @param v A value in \mjseqn{(0, 1)}.
#' @param q The order of the Wasserstein distance. Must be a value in \mjseqn{[1, \infty)}.
#' @param M The number of Monte Carlo replications. Must be a positive integer.
#' @param plot Logical. If \code{TRUE}, a plot shows the behavior of the predictive expectation as a function of the sample size.
#' @param seed A number or \code{NULL}. If \code{NULL} (default), the user does not specify any seed.
#'
#' @details
#'
#' @return A list with the following components \cr
#'         \item{pred.exp}{The predictive expectation.}
#'         \item{t.opt}{The optimal threshold.}
#'         \item{n.opt}{The optimal sample size.}
#'
#' @note If the arguments of the \code{PEC.binom.exact} function are not correctly specified, the execution is stopped and an error message is generated.
#'
#' @author Michele Cianfriglia \email{michele.cianfriglia@@uniroma1.it}
#'
#' @references M. Cianfriglia, T. Padellini and P. Brutti (2022) \emph{Wasserstein consensus for Bayesian sample size determination}
#'
#' @seealso \code{\link{PPC.binom.exact}}
#'
#' @examples
#'
#' @export
#'
#' @importFrom crayon italic
#' @importFrom graphics abline box legend mtext par points polygon title
#' @importFrom mathjaxr preview_rd
#' @importFrom pbapply pbmapply pboptions
PEC.binom.exact = function(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, v, q = 1, M = 2500, plot = FALSE, seed = NULL){

  check.PEC.binom.exact(n, alpha1, beta1, alpha2, beta2, alphaD, betaD, v, q, M, plot)

  if(alpha1 == alpha2 && beta1 == beta2) stop(paste0("The predictive expectation is zero for the selected parameters. Please choose (", italic("alpha1"), ", ", italic("beta1"), ") different from (", italic("alpha2"), ", ", italic("beta2"), ")."))

  if(!is.null(seed)) set.seed(seed)

  pboptions(style = 1, char = "=")
  pred.exp = pbmapply(pred.exp.binom.exact, n, MoreArgs = list(alpha1, beta1, alpha2, beta2, alphaD, betaD, q, M))

  n.max = which.max(pred.exp)
  t.opt = v*pred.exp[n.max]
  n.opt = which.max(pred.exp[n.max:max(n)] < t.opt) + n.max - 1

  if(n.opt == 1) warning(paste(italic("n.opt"), "= 1, probably the chosen sample size is too small."))

  if(plot){

    n.lim = n.opt + max(n)*0.15

    if(n.max == 1){

      par(pty = "s")
      plot(n, pred.exp, xlim = c(1, n.lim), type = "l", lwd = 2, xlab = "", ylab = "", cex.axis = 0.85)
      title(xlab = "n", line = 2.3)
      title(ylab = "predictive expectation", line = 2.3)
      abline(h = t.opt, lwd = 2, col = "red")
      abline(v = n.opt, lwd = 2, col = "blue")
      box()
      legend("top", c(paste("optimal threshold =", formatC(t.opt, format = "e", digits = 2)), paste("optimal sample size =", n.opt)), lty = c(1, 1), lwd = c(2, 2), col = c("red", "blue"), bty = "n", inset = c(0, -0.25), xpd = T, cex = 0.85)
      par(pty = "m")

    } else {

      cat("The shaded area highlights the values of the predictive expectation used to compute ", italic("t.opt"), " and ", italic("n.opt"), ".", sep = "")

      par(pty = "s")
      plot(NULL, xlim = c(1, n.lim), ylim = range(pred.exp), xlab = "", ylab = "", cex.axis = 0.85)
      title(xlab = "n", line = 2.3)
      title(ylab = "predictive expectation", line = 2.3)
      polygon(c(n.max, n.max, n.lim, n.lim), c(pred.exp[n.max], 0, 0, pred.exp[n.max]), col = "#EBEBEB", border = "#EBEBEB")
      points(n, pred.exp, type = "l", lwd = 2)
      abline(h = t.opt, lwd = 2, col = "red")
      abline(v = n.opt, lwd = 2, col = "blue")
      box()
      legend("top", c(paste("optimal threshold =", formatC(t.opt, format = "e", digits = 2)), paste("optimal sample size =", n.opt)), lwd = c(2, 2), lty = c(1, 1), col = c("red", "blue"), bty = "n", inset = c(0, -0.25), xpd = T, cex = 0.85)
      par(pty = "m")

    }

  }

  return(list("pred.exp" = pred.exp, "t.opt" = t.opt, "n.opt" = n.opt))

}
