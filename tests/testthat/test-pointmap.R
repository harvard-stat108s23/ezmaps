test_that("Valid input leads to leaflet map with circle markers", {
  map <- pointmap(data = crash_data,
                  longitude_var = crash_data$lon,
                  latitude_var = crash_data$lat,
                  set_longitude = -71.110558,
                  set_latitude = 42.3736,
                  popups = crash_data$crash_date,
                  user_pal = c("#003f5c", "#2f4b7c","#665191",
                               "#a05195","#d45087","#f95d6a",
                               "#ff7c43","#ffa600"),
                  user_var = crash_data$year)
  expect_true(inherits(map, "leaflet"))
})
test_that("Provides error when length of user palette does not match factor levels", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        popups = crash_data$crash_date,
                        user_pal = c("#003f5c", "#2f4b7c","#665191",
                                     "#a05195","#d45087","#f95d6a",
                                     "#ff7c43"),
                        user_var = crash_data$year),
               "Error: The number of colors in your palette must match the number of levels in your variable.
You have provided the following number of colors: 7")
})
test_that("Valid input leads to leaflet map with icon markers", {
  car_url <- "https://raw.githubusercontent.com/harvard-stat108s23/materials/main/img/car.png"
  map <- pointmap(data = crash_data,
                  longitude_var = crash_data$lon,
                  latitude_var = crash_data$lat,
                  set_longitude = -71.110558,
                  set_latitude = 42.3736,
                  icon_filepath = car_url,
                  popups = crash_data$crash_date)
  expect_true(inherits(map, "leaflet"))
})
test_that("Provides error with non-numeric icon_width variable", {
  car_url <- "https://raw.githubusercontent.com/harvard-stat108s23/materials/main/img/car.png"
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        icon_filepath = car_url,
                        icon_width = "YasQueen"),
               "Error: icon_width and icon_height must be numeric")
})
test_that("Provides error with non-numeric icon_height variable", {
  car_url <- "https://raw.githubusercontent.com/harvard-stat108s23/materials/main/img/car.png"
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        icon_filepath = car_url,
                        icon_height = "YasQueen"),
               "Error: icon_width and icon_height must be numeric")
})
test_that("Provides error with non-numeric icon_height variable", {
  car_url <- "https://raw.githubusercontent.com/harvard-stat108s23/materials/main/img/car.png"
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        icon_filepath = car_url,
                        icon_height = "YasQueen"),
               "Error: icon_width and icon_height must be numeric")
})
test_that("Provides error with non-character user_pal variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        user_pal = c(100000, 10, 666),
                        user_var = crash_data$year),
               "Error: user_pal must be a character")
})
test_that("Provides error with non-character map_tile variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        map_tile = 100000),
               "Error: map_tile must be a character")
})
test_that("Provides error with non-character point_color variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        point_color = 100000),
               "Error: point_color must be a character")
})
test_that("Provides error with non-character popups variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        popups = 100000),
               "Error: popups must be a character")
})
test_that("Provides error with non-numeric longitude_var variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$city_town_name,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736),
               "Error: longitude_var must be numeric")
})
test_that("Provides error with non-numeric latitude_var variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$city_town_name,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736),
               "Error: latitude_var must be numeric")
})
test_that("Provides error with non-numeric set_longitude variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = "YasQueen",
                        set_latitude = 42.3736),
               "Error: set_longitude must be numeric")
})
test_that("Provides error with non-numeric set_latitude variable", {
  expect_error(pointmap(data = crash_data,
                         longitude_var = crash_data$lon,
                         latitude_var = crash_data$lat,
                         set_longitude = -71.110558,
                         set_latitude = "YasQueen"),
               "Error: set_latitude must be numeric")
})
test_that("Provides error with non-numeric zoom_min variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        zoom_min = "YasQueen"),
               "Error: zoom_min must be numeric")
})
test_that("Provides error with non-numeric set_zoom variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        set_zoom = "YasQueen"),
               "Error: set_zoom must be numeric")
})
test_that("Provides error with non-numeric zoom_max variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        zoom_max = "YasQueen"),
               "Error: zoom_max must be numeric")
})
test_that("Provides error with non-numeric point_radius variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        point_radius = "YasQueen"),
               "Error: point_radius must be numeric")
})
test_that("Provides error with non-numeric point_inopacity variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        point_inopacity = "YasQueen"),
               "Error: point_inopacity must be numeric")
})
test_that("Provides error with non-numeric point_outopacity variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        point_outopacity = "YasQueen"),
               "Error: point_outopacity must be numeric")
})
test_that("Provides error with non-character map_tile variable", {
  expect_error(pointmap(data = crash_data,
                        longitude_var = crash_data$lon,
                        latitude_var = crash_data$lat,
                        set_longitude = -71.110558,
                        set_latitude = 42.3736,
                        map_tile = 100000),
               "Error: map_tile must be a character")
})
