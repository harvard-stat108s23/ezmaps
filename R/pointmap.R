#' Creates an interactive map with points using longitude and latitude
#'
#' @param data_set A data set with longitude and latitude variables
#' @param longitude_var Variable containing longitude geographic coordinate
#' @param latitude_var Variable containing latitude geographic coordinate
#' @param set_longitude Longitude of general region (i.e. city, state, country)
#' @param set_latitude Latitude of general region (i.e. city, state, country)
#' @param popups Text that will appear when a point is pressed (i.e. date, time, etc.)
#' @param icon_filepath Filepath of icon for point
#' @param icon_width Width of icon
#' @param icon_height Height of icon
#' @param zoom_min Minimum zoom
#' @param set_zoom General zoom level
#' @param zoom_max Maximum zoom
#' @param map_tile Map base, options: providers$Stamen.Toner, providers$Stamen.Watercolor
#' @param point_color Color of points on map
#' @param user_radius Radius of points on map
#' @param user_inopacity Opacity of point fill, default = 0.2
#' @param user_outopacity Opacity of point outline, default = 0.4
#' @param user_pal Palette for points, must match number of factors in variables
#' @param user_var Variable to change hue of points to, corresponds to palette
#'
#' @return An interactive map with points
#' @export
#'
#' @examples
#' point_map(data = crash_data,
#' longitude_var = crash_data$lon,
#' latitude_var = crash_data$lat
#' set_longitude = -71.110558,
#' set_latitude = 42.3736)
#'
#' point_map(data = crash_data,
#' longitude_var = crash_data$lon,
#' latitude_var = crash_data$lat,
#' set_longitude = -71.110558,
#' set_latitude = 42.3736,
#' popups = crash_data$crash_date,
#' user_pal = c("#003f5c", "#2f4b7c","#665191",
#'              "#a05195","#d45087","#f95d6a",
#'              "#ff7c43","#ffa600"),
#' user_var = crash_data$year)

pointmap <- function(data_set, longitude_var, latitude_var, set_longitude,
                      set_latitude, popups = NULL, icon_filepath = NULL,
                      icon_width = 15, icon_height = 15, zoom_min = 12,
                      set_zoom = 13, zoom_max = 19,
                      map_tile = providers$Stamen.Terrain, point_color = "red",
                      user_radius = 10, user_inopacity = 0.2,
                      user_outopacity = 0.4, user_pal = NULL, user_var = NULL){
  # Class checks
  stopifnot(is.numeric(longitude_var))
  stopifnot(is.numeric(latitude_var))
  stopifnot(is.numeric(set_longitude))
  stopifnot(is.numeric(set_latitude))
  stopifnot(is.numeric(zoom_min))
  stopifnot(is.numeric(set_zoom))
  stopifnot(is.numeric(zoom_max))
  stopifnot(is.character(map_tile))
  stopifnot(is.character(point_color))
  stopifnot(is.numeric(user_radius))
  stopifnot(is.numeric(user_inopacity))
  stopifnot(is.numeric(user_outopacity))

  # Creating base map
  base_map <- leaflet::leaflet(options = leafletOptions(minZoom = zoom_min, maxZoom = zoom_max)) |>
    leaflet::setView(lng = set_longitude, lat = set_latitude, zoom = set_zoom) |>
    leaflet::addTiles()

  # Check popups
  if (!is.null(popups)){
    stopifnot(is.character(popups))
  }

  if (!is.null(icon_filepath)){
    # Checking class of icon filepath
    stopifnot(is.character(icon_filepath))

    # Checking class of icon width & height
    if (!is.null(icon_width) & !is.null(icon_height)){
      stopifnot(is.numeric(icon_width) & is.numeric(icon_height))
    }

    map_icon <- leaflet::makeIcon(iconUrl = icon_filepath, iconWidth = icon_width, iconHeight = icon_height)

    map <- base_map |>
      leaflet::addMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, icon = map_icon) |>
      leaflet::addProviderTiles(map_tile)
    return(map)
  }
  else{
    if(!is.null(user_pal) & !is.null(user_var)){
      # Checking class of user palette
      stopifnot(is.character(user_pal))

      # Ensuring number of palette colors matches factor levels
      if (!(length(levels(factor(user_var))) == length(user_pal))){
        stop("The number of colors in your palette must match the number of levels in your variable.\n",
             "You have provided the following number of colors: ", length(user_pal))
      }

      # Creating palette
      map_pal <- colorFactor(user_pal, domain = user_var)

      map <- base_map |>
        leaflet::addCircleMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, color = ~map_pal(user_var), radius = user_radius, fillOpacity = user_inopacity, opacity = user_outopacity) |>
        leaflet::addProviderTiles(map_tile)
      return(map)

    } else{
      map <- base_map |>
        leaflet::addCircleMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, color = point_color, radius = user_radius, fillOpacity = user_inopacity, opacity = user_outopacity) |>
        leaflet::addProviderTiles(map_tile)
      return(map)
    }
  }
}
