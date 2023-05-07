test_that("valid input leads to map", {
  map <- choropleth(states, "Population", geometry, "viridis")
  expect_true(inherits(map, "tmap"))
})


test_that("errors out if non-numeric input variable", {
  expect_error(choropleth(states, "Region", geometry, "viridis"),
               "Please insert a numeric input variable.")
})

test_that("funcitonality of additional arguments additional arguments", {
  map <- choropleth(states, "Population", geometry, "viridis", alpha = 0.5)
  expect_true(inherits(map, "tmap"))
})










