#' Fits hexagon tessellations to geographical multipolygon data as base for hexbin maps
#'
#' @param data Dataset with geometry/multipolygon data
#' @param fill Variable used to fill the hexagons
#' @param geometry Variable that gives geometry/multipolygon data
#' @param n Number of seed maps to generate; default 6
#' @param ...
#'
#' @return Possible hexagon tessellations as base for hexbin maps
#' @export
#'
#' @examples
#' tessellate(data = states, fill = "Vegetables", geometry = geometry, n = 6)

tessellate <- function(data, fill, geometry, n = 6,...) {

  # Check inputs
  ## Check: dataset contains geometry
  if (!inherits(data, "sf")) {
    stop("data does not include a geometry or multipolygon column")
  }
  ## Check: fill variable is numeric
  if (!is.numeric(data[[fill]])) {
    stop("fill must be type numeric")
  }
  ## Check: n variable is numeric
  if (!is.numeric(n)) {
    stop("n must be type numeric")
  }

  # Choose seed
  set.seed(sample(1:n))

  # Compute grid
  graphics::par(mfrow = c(round(n/3), 3), mar = c(0, 0, 2, 0))
  for (i in 1:n) {
    new_cells <- geogrid::calculate_grid(shape = data, grid_type = "hexagonal", seed = i)
    graphics::plot(new_cells, main = paste("Seed", i, sep = " "))
  }

}


