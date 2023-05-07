## code to prepare `DATASET` dataset goes here

## NOT DONE: Will create clean csvs, put in data folder, & update DATASET.R
us_states <- tigris::states(cb = TRUE, resolution = "20m", progress_bar = FALSE)
us_states_shifted <- tigris::shift_geometry(us_states,
                                             preserve_area = TRUE,
                                             position = "outside")
states <- inner_join(us_states_shifted, Lock5Data::USStates, by = c("NAME" = "State"))


crash_data <- readr::read_csv("https://raw.githubusercontent.com/harvard-stat108s23/materials/main/psets/data/cambridge_cyclist_ped_crash.csv")

usethis::use_data(crash_data, states, internal = TRUE, overwrite = TRUE)
