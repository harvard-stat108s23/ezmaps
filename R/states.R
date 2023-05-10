#' Dataset 2 of 2 used in this package to test and demo functions.
#'
#' Contains information on the residents of US states and multipolygon/
#' shapefile data for the geometries of US states using a combination
#' of two other datasets found in the Lock5Data & tigris packages.
#'
#' @format A simple-feature dataframe with 50 rows and 7 variables:
#' \describe{
#'  \item{NAME}{a character string denoting name of the state}
#'  \item{STUSPS}{a character string denoting postal abbreviation for the state}
#'  \item{Region}{a factor denoting geographical region of the state
#'  (MW=Midwest, NE=Northeast, S=South, W=West)}
#'  \item{geometry}{Multipolygon shapefile data for the state}
#'  \item{Elect2016}{a factor denoting state winner in the 2016 presidential
#'  election (D=Clinton, R=Trump)}
#'  \item{Population}{a number denoting the number of residents in 2014
#'  (in millions)}
#'  \item{Vegetables}{a number denoting percentage of residents eating
#'  vegetables at least once per day (in %)}
#' }
#'
#' @source Lock5Data::USStates: https://cran.r-project.org/web/packages/Lock5Data/index.html
#' @source tigris::states: https://github.com/walkerke/tigris/blob/master/R/states.R
"states"
