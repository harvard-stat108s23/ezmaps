test_that("valid inputs lead to map output no matter the input for base", {
  map <- cartogram(states, "Population", "Vegetables", geometry, "var")
  expect_true(inherits(map, "tmap"))

})

test_that("valid inputs lead to map output no matter the input for base", {
  map <- cartogram(states, "Population", "Vegetables", geometry, 1)
  expect_true(inherits(map, "tmap"))

})

test_that("valid inputs lead to map output no matter the input for base", {
  map <- cartogram(states, "Population", "Vegetables", geometry, NULL)
  expect_true(inherits(map, "tmap"))

})



test_that("errors out with non numeric input variable", {
  expect_error(cartogram(states, "Population", "Elect2016", geometry, NULL),
               "Please insert a numeric input variable.")
})

test_that("cerrors out with non numeric weight variable", {
  expect_error(cartogram(states, "Elect2016", "Vegetables", geometry, NULL),
               "Please insert a numeric weight variable.")
})





