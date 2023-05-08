#' Creates an interactive hexbin map using the viridis palette
#'
#' @param data Dataset with geometry/multipolygon data
#' @param fill Variable used to fill the hexagons
#' @param labels Variable used to label the hexagons
#' @param palette Variable corresponding to the palette
#' @param geometry Variable that gives geometry/multipolygon data
#' @param option Variable corresponding to seed from generate_hexbin(); default NULL
#' @param base Adds a base map to the background; default NULL
#' @param ...
#'
#' @return An interactive hexbin map
#' @export
#'
#' @examples
#' hexbin(data = states, fill = "Vegetables", labels = "STUSPS", geometry = geometry, palette = "viridis")

hexbin <- function(data, fill, labels, geometry, palette = "viridis", option = NULL, base = NULL,...) {
  # packages
  # library(geogrid)
  # library(sf)
  # library(tmap)
  # library(Lock5Data)
  # library(tidyverse)

  # Check inputs
  ## Check: dataset contains geometry
  if (!inherits(data, "sf")) {
    stop("`data` does not include a geometry or `multipolygon` column")
  }
  ## Check: fill variable is numeric
  if (!is.numeric(data[[variable]])) {
    stop("`fill` must be type `numeric`")
  }
  ## Check: labels variable is character/factor
  # TODO
  if (!is.character(data[[labels]])) {
    stop("`labels` must be type `character` or `factor`")
  }
  ## Check: option variable is numeric
  if (!is.character(data[[option]])) {
    stop("`option` must be type `numeric`. choose seed using generate_hexbin()")
  }

  # # Base map
  # if(is.null(base)==TRUE){
  #   map <- tmap::tm_shape(carto_sf) +
  #     tmap::tm_basemap(NULL) +
  #     tmap::tm_fill(col = variable, palette = "viridis") +
  #     tmap::tm_borders() +
  #     tmap::tmap_mode("view")
  # }
  # if(is.null(base)==FALSE){
  #   map <- tm_shape(carto_sf) +
  #     tmap::tm_fill(col = variable, palette = "viridis") +
  #     tmap::tm_borders()+
  #     tmap::tmap_mode("view")
  # }

  # Compute grid
  new_cells <- geogrid::calculate_grid(shape = data, grid_type = "hexagonal", seed = 4)
  result <- geogrid::assign_polygons(states, new_cells)

  # Make hexbin map
  map <- tmap::tm_shape(result) +
    tmap::tm_polygons(col = fill, palette = palette) +
    tmap::tm_text(text = labels) +
    tmap::tmap_mode("view")

  return(map)
}


