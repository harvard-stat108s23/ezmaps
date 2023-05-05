point_map <- function(data_set, longitude_var, latitude_var, set_longitude, set_latitude, popups = NULL, icon_filepath = NULL, icon_width = 15, icon_height = 15, zoom_min = 12, set_zoom = 13, zoom_max = 19, map_tile = providers$Stamen.Terrain, point_color = "red", user_radius = 10, user_inopacity = 0.2,
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

    base_map |>
      leaflet::addMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, icon = map_icon) |>
      leaflet::addProviderTiles(map_tile)
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
      base_map |>
        leaflet::addCircleMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, color = ~map_pal(user_var), radius = user_radius, fillOpacity = user_inopacity, opacity = user_outopacity) |>
        leaflet::addProviderTiles(map_tile)

    } else{
      base_map |>
        leaflet::addCircleMarkers(lng = ~longitude_var, lat = ~latitude_var, data = data_set, popup = popups, color = point_color, radius = user_radius, fillOpacity = user_inopacity, opacity = user_outopacity) |>
        leaflet::addProviderTiles(map_tile)
    }
  }
}
