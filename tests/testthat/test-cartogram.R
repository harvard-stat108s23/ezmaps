test_that("valid inputs lead to map output", {
  map <- chloropleth(nc, "BIR79", "CNTY_ID")
  expect_true(inherits(map, "tmap"))
})

