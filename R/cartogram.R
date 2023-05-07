#' Creates an interactive cartogram map using the viridis palette
#'
#' @param data A data set
#' @param weight The variable used to scale the cartogram
#' @param variable The variable corresponding to the palette
#' @param geometry The geometry/multipolygon variable
#' @param base Adds a base map to the background; the default is NULL
#' @param ...
#'
#' @return An interactive cartogram map
#' @export
#'
#' @examples
#' cartogram(states, "Population", "Vegetables", geometry, NULL)
#' cartogram(states, "Population", "Vegetables", geometry, "var")

cartogram <- function(data, weight, variable, geometry, base = NULL,...) {

  # Check variable is numeric
  if (!is.numeric(data[[variable]])) {
    stop("Please insert a numeric input variable.")

  }

  # Check variable is numeric
  if (!is.numeric(data[[weight]])) {
    stop("Please insert a numeric input variable.")

  }

  # Check data contains geometry
  if (!inherits(data, "sf")) {
    stop("Please input data with a spatial object with geometry column.")
  }


  # Option 2
  data_projected <- tigris::shift_geometry(data, preserve_area = TRUE, position = "below")

  # Scaling to variable
  data_projected <- cartogram::cartogram_cont(data_projected, weight = weight)


  carto_map <- cartogram::cartogram_cont(data_projected, variable)

  # Convert cartogram to a sf object
  carto_sf <- sf::st_as_sf(carto_map)

  if(is.null(base)==TRUE){
    map <- tmap::tm_shape(carto_sf) +
      tmap::tm_basemap(NULL) +
      tmap::tm_fill(col = variable, palette = "viridis") +
      tmap::tm_borders() +
      tmap::tmap_mode("view")
  }
  if(is.null(base)==FALSE){
    map <- tm_shape(carto_sf) +
      tmap::tm_fill(col = variable, palette = "viridis") +
      tmap::tm_borders()+
      tmapp::tmap_mode("view")
  }

  return(map)
}
