#' Title
#'
#' @param shapefile_path
#' @param shapefile
#' @param labels
#' @param shapefile_key
#' @param labels_key
#'
#' @return
#' @export
#'
#' @examples
#' NOT DONE: Making sure functions from other packages are labeled: 'package::function()'

label_polygons <- function(shapefile_path,
                           shapefile,
                           labels,
                           shapefile_key,
                           labels_key){
  # Shapefile
  shapes <- rgdal::readOGR(dsn = here({{ shapefile_path }}),  layer = {{ shapefile }})
  # Check that shapefile_path, shapefile are strings
  stop()

  # Labels
  labels <- read_excel(here({{ labels }})) %>%
    subset(select = -c(ABB))
  # Check that labels is a string
  # Check that labels has two columns, one with regions and one with labels
  # Check that labels columns are both strings

  # Join
  shapefile_key <- as.character({{ shapefile_key }})
  labels_key <- as.character({{ labels_key }})
  shapes@data <- left_join(shapes@data, labels,
                           #by = c(shapefile_key = labels_key))
                           by = c("NAME_1" = labels_key))
  return(shapes)
}
