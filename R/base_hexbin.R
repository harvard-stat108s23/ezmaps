#' Title
#'
#' @param df
#' @param seed
#'
#' @return
#' @export
#'
#' @examples
#' NOT DONE: Making sure functions from other packages are labeled: 'package::function()'

base_hexbin <- function(df, seed){
  # Compute hexagonal grid for selected seed
  hexgrid <- geogrid::calculate_grid(shape = {{ df }}, grid_type = "hexagonal",
                                     seed = {{seed}})
  # Base hexbin map
  # Assigns polygon in original shapefile to new location in hexagonal grid
  base_map <- geogrid::assign_polygons({{ df }}, hexgrid)
  return(base_map)
}
