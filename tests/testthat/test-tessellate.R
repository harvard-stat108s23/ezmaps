test_that("Valid input leads to seed maps", {
  expect_no_error(tessellate(data = states,
                             fill = "Vegetables",
                             geometry = geometry,
                             n = 6))
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
