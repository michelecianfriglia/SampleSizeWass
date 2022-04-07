
# SampleSizeWass

[![Status](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Version](https://img.shields.io/badge/version-0.4.8-orange.svg)]()
[![CRAN](https://www.R-pkg.org/badges/version/SampleSizeWass)](https://CRAN.R-project.org/package=SampleSizeWass)
[![License](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://choosealicense.com/licenses/gpl-3.0)
[![R-CMD-check](https://github.com/michelecianfriglia/SampleSizeWass/workflows/R-CMD-check/badge.svg)](https://github.com/michelecianfriglia/SampleSizeWass/actions)

## Description

The `SampleSizeWass` package implements Bayesian sample size
determination criteria based on the Wasserstein distance to ensure
posterior consensus starting from different prior distributions. These
criteria are available in the conjugate Binomial and Normal models, as
described in the work of Cianfriglia et al. (2022) [Wasserstein
consensus for Bayesian sample size determination]().

## Installation

The `SampleSizeWass` package is not on
[CRAN](https://CRAN.R-project.org) yet, but you can install it as
follows:

``` r
install.packages("devtools")
devtools::install_github("michelecianfriglia/SampleSizeWass")
```

**Attention!** Windows users must have
[Rtools](https://CRAN.R-project.org/bin/windows/Rtools) installed for
this to work.

## Package customization

The `SampleSizeWass` package relies on:

-   the [`mathjaxr`](https://CRAN.R-project.org/package=mathjaxr)
    package to display mathematical expressions in the HTML help files;

-   the [`crayon`](https://CRAN.R-project.org/package=crayon) package to
    highlight function arguments/values when displaying a message in the
    R console.

## Meta

The `SampleSizeWass` package is licensed under the [GNU General Public
License Version 3](https://choosealicense.com/licenses/gpl-3.0).

The website of the package can be consulted at this [link]().

To report issues or bugs, please go
[here](https://github.com/michelecianfriglia/SampleSizeWass/issues).

## Code of conduct

This project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
