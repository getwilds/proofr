<!-- README.md is generated from README.Rmd. Please edit that file -->



# proofr

<!-- badges: start -->
[![Project Status: Concept – Not useable, no support, not open to feedback, unstable API.](https://getwilds.github.io/badges/badges/concept.svg)](https://getwilds.github.io/badges/#concept)
[![R-CMD-check](https://github.com/getwilds/proofr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/getwilds/proofr/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/getwilds/proofr/graph/badge.svg?token=G5QFLURUZ4)](https://codecov.io/gh/getwilds/proofr)
<!-- badges: end -->

R client for the PROOF API

PROOF API is at <https://github.com/FredHutch/proof-api>



## Installation

You can install the development version of proofr from [GitHub](https://github.com/) with:

```r
# install.packages("pak")
pak::pak("getwilds/proofr")
```

## Get started

To get started with `proofr`, see the [Getting Started vignette](https://getwilds.org/proofr/articles/proofr.html).


## Notes

- There are no plans to submit this package to CRAN. Therefore, you should not depend on this package in any packages you have on CRAN.
- Base URL: The base URL for the PROOF API can be changed by setting the environment variable `PROOF_API_BASE_URL`. It can be set for an R session or for function by function use as we check that env var in each function call to the API.

## Bugs? Features?

Open an issue on our [issue tracker](https://github.com/getwilds/proofr/issues/).

## Code of Conduct

Please note that the proofr project is released with a [Contributor Code of Conduct](http://getwilds.org/proofr/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.


## License

[MIT](LICENSE.md)
