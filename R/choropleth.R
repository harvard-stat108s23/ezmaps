#' Creates an interactive choropleth map
#'
#' @param data A data set with a geometry/multipolygon variables
#' @param variable A variable whose amount will color the map
#' @param geometry A geometry/multipolygon variable of the region of interest (i.e. city, state, country, etc.)
#' @param palette A palette that corresponds to the variable; default is "viridis."
#' @param ...
#'
#' @return An interactive choropleth map
#' @export
#'
#' @examples
#' choropleth(states, "Population", geometry, "viridis")

choropleth <- function(data, variable, geometry, palette = "viridis",... ){
  # Check if the variable is numeric
  if (!is.numeric(data[[variable]])) {
    stop("Please insert a numeric input variable.")
  }

  # Check if the data contains geometry
  if (!inherits(data, "sf")) {
    stop("Please input data with a spatial object with geometry column.")
  }

  # Create the map
  map <- tmap::tm_shape(data) +
    tmap::tm_fill(col = variable, palette = palette) +
    tmap::tmap_mode("view")

  return(map)
}
