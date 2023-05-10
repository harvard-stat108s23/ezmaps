#' Dataset 1 of 2 used in this package to test and demo functions.
#'
#' Contains information on local pedestrian/cyclist crashes in Cambridge, MA,
#' United States.
#'
#' @format A tibble with 1311 rows and 5 variables:
#' \describe{
#'  \item{year}{an integer denoting year in which crash took place}
#'  \item{city_town_name}{a character string denoting name of town in which
#'  crash took place}
#'  \item{date}{a character string denoting the date of crash (MM/DD/YYYY)}
#'  \item{lat}{a number denoting latitudinal position of crash (in degrees)}
#'  \item{lon}{a number denoting longitudinal position of crash (in degrees)}
#'  }
#'
#' @source crash_data: https://github.com/harvard-stat108s23/materials/blob/main/psets/data/cambridge_cyclist_ped_crash.csv
"crash_data"
