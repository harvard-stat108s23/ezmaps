test_that("Valid input leads to hexbin map", {
  map <- hexbin(data = states,
                fill = "Vegetables",
                labels = "STUSPS",
                geometry = geometry,
                palette = "viridis",
                seed = 6)
  expect_true(inherits(map, "tmap"))
})

test_that("Errors if seed is non-numeric", {
  expect_error(hexbin(data = states,
                      fill = "Vegetables",
                      labels = "STUSPS",
                      geometry = geometry,
                      palette = "viridis",
                      seed = "cat"),
               "seed must be type numeric or NULL")
})

test_that("Check functionality of additional arguments", {
  map <- hexbin(data = states,
                fill = "Vegetables",
                labels = "STUSPS",
                geometry = geometry,
                palette = "viridis",
                alpha = 0.5)
  expect_true(inherits(map, "tmap"))
})
