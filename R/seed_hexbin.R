#' Title
#'
#' @param df
#'
#' @return
#' @export
#'
#' @examples
#' NOT DONE: Making sure functions from other packages are labeled: 'package::function()'

seed_hexbin <- function(df){
  # Make 2x3 grid
  par(mfrow = c(2, 3), mar = c(0, 0, 2, 0))

  # Plot seeded plots
  for (i in 1:6) {
    new_cells <- geogrid::calculate_grid(shape = {{ df }}, grid_type = "hexagonal", seed = i)
    plot(new_cells, main = paste("Seed", i, sep = " "))
  }
}
