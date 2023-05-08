#' Data sets that contain latitude, longitude, shape, and geometry variables
#'
#' @format This package contains two data sets. The first contains information on the residents of US states:
#'            NAME: Name of state
#'            STUSPS: State abbreviation
#'            Region: MW=Midwest, NE=Northeast, S=South, W=West
#'            geometry: Shape data for the state
#'            Elect2016: State winner in 2016 presidential election (D=Clinton, R=Trump)
#'            Population: Number of residents (in millions for 2014)
#'            Vegetables: Percentage of residents eating vegetables at least once per day
#'
#'          The second data set contains information on local pedestrian/cyclist crashes in Cambridge, MA, United States:
#'            year: Year that the crash took place
#'            city_town_name: Name of town the crash took place
#'            date: Date of crash
#'            lat: Latitude value
#'            lon: Longitude value
#' @source states (Dataset 1): https://cran.r-project.org/web/packages/Lock5Data/index.html
#' @source states (Dataset 2): https://github.com/walkerke/tigris/blob/master/R/states.R
#' @source crash_data: https://github.com/harvard-stat108s23/materials/blob/main/psets/data/cambridge_cyclist_ped_crash.csv

# Tidying states
us_states <- tigris::states(cb = TRUE, resolution = "20m", progress_bar = FALSE)
us_states_shifted <- tigris::shift_geometry(us_states,
                                             preserve_area = TRUE,
                                             position = "outside")
states <- inner_join(us_states_shifted, Lock5Data::USStates, by = c("NAME" = "State"))
states <- states |>
  dplyr::select(Vegetables, Population, Elect2016, geometry, Region, STUSPS, NAME)

# Tidying crash_data
crash_data <- readr::read_csv("https://raw.githubusercontent.com/harvard-stat108s23/materials/main/psets/data/cambridge_cyclist_ped_crash.csv")
crash_data <- crash_data |>
  dplyr::select(year, city_town_name, crash_date, lat, lon)

usethis::use_data(crash_data, states, internal = TRUE, overwrite = TRUE)
