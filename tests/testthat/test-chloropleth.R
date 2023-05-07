test_that("errors out if non-numeric input variable", {
  expect_error(chloropleth(states, "Region", geometry, "viridis"),
               "Please insert a numeric input variable.")
})

test_that("valid input leads to map", {
  map <- chloropleth(states, "Population", geometry, "viridis")
  expect_true(inherits(map, "tmap"))
})

test_that("funcitonality of additional arguments additional arguments", {
  map <- chloropleth(states, "Population", geometry, "viridis", alpha = 0.5)
  expect_true(inherits(map, "tmap"))
})

test_that("errors out if data does not contain geometry", {
  expect_error(chloropleth(states$Population, "Population", geometry, "viridis"),
               "Please input dataset with a spatial object with a geometry column for the function to work")
})

test_that("errors out if inputted a non-existent variable", {
  expect_error(chloropleth(states, "Random_variable", "Random_variable", "viridis", alpha = 0.5),
               "'Random_variable' not found, please input a variable that exists in the inputted dataset")
})








