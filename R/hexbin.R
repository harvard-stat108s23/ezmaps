#' Creates an interactive hexbin map using the viridis palette
#'
#' @param data Dataset with geometry/multipolygon data
#' @param fill Variable used to fill the hexagons
#' @param labels Variable used to label the hexagons
#' @param palette Palette for filling hexagons; default is Viridis
#' @param geometry Variable that gives geometry/multipolygon data
#' @param seed Number corresponding to seed map chosen using tessellate()
#' @param ...
#'
#' @return An interactive hexbin map
#' @export
#'
#' @examples
#' hexbin(data = states, fill = "Vegetables", labels = "STUSPS", geometry = geometry, palette = "viridis")

hexbin <- function(data, fill, labels, geometry, palette = "viridis", seed = NULL, base = NULL,...) {

  # Check inputs
  ## Check: dataset contains geometry
  if (!inherits(data, "sf")) {
    stop("data does not include a geometry or multipolygon column")
  }
  ## Check: fill variable is numeric
  if (!is.numeric(data[[fill]])) {
    stop("fill must be type numeric")
  }
  ## Check: labels variable is character/factor
  if((is.character(data[[labels]]) == FALSE)
     & (is.factor(data[[labels]])) == FALSE) {
    stop("labels must be type character or factor")
  }
  ## Check: seed option variable is numeric
  if(!is.null(seed)){
    if (!is.numeric(seed)) {
      stop("seed must be type numeric or NULL")
    }
  }

  # Compute grid
  if(!is.null(seed)){
    new_cells <- geogrid::calculate_grid(shape = data, grid_type = "hexagonal", seed = seed)
  } else if(is.null(seed)){
    new_cells <- geogrid::calculate_grid(shape = data, grid_type = "hexagonal")
  }

  result <- geogrid::assign_polygons(states, new_cells)

  # Make hexbin map
  map <- tmap::tm_shape(result) +
    tmap::tm_polygons(col = fill, palette = palette) +
    tmap::tm_text(text = labels) +
    tmap::tmap_mode("view")

  return(map)
}


