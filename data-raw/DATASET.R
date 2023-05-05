## code to prepare `DATASET` dataset goes here

crash_data <- readr::read_csv("https://raw.githubusercontent.com/harvard-stat108s23/materials/main/psets/data/cambridge_cyclist_ped_crash.csv")

usethis::use_data(crash_data, overwrite = TRUE)
