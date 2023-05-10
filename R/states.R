#' @format This package contains two data sets. The first contains information
#'         on the residents of US states using a combination of two other datasets
#'         found in the Lock5Data & tigris packages:
#'            NAME: Name of state
#'            STUSPS: State abbreviation
#'            Region: MW=Midwest, NE=Northeast, S=South, W=West
#'            geometry: Shape data for the state
#'            Elect2016: State winner in 2016 presidential election (D=Clinton, R=Trump)
#'            Population: Number of residents (in millions for 2014)
#'            Vegetables: Percentage of residents eating vegetables at least once per day
#' @source states (Dataset 1): https://cran.r-project.org/web/packages/Lock5Data/index.html
#' @source states (Dataset 2): https://github.com/walkerke/tigris/blob/master/R/states.R
"states"
