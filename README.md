
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ezmaps

<!-- badges: start -->
<!-- badges: end -->

The goal of ezmaps is to help beginners conduct exploratory analysis of
geo-spatial data via interactive visualizations.

## Installation

You can install the development version of ezmaps from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("harvard-stat108s23/ezmaps")
```

## Functions

## pointmap()

The `pointmap()` function has the following inputs:

- Required - data, longitude_var, latitude_var, set_longitude,
  set_latitude
- Optional - popups, icon_filepath, icon_width, icon_height, zoom_min,
  zoom_max, set_zoom, map_tile, point_color, point_radius,
  point_inopacity, point_outopacity, user_pal, user_var

If you are creating a point map with circle markers, you are able to use
the following inputs: popups, zoom_min, zoom_max, set_zoom, map_tile,
point_color, point_radius, point_inopacity, point_outopacity, user_pal,
user_var

If you are creating a point map with icon markers, you are able to use
the following inputs: popups, icon_filepath, icon_width, icon_height,
zoom_min, zoom_max, set_zoom, map_tile

``` r
# pointmap(data = crash_data,
#                   longitude_var = crash_data$lon,
#                   latitude_var = crash_data$lat,
#                   set_longitude = -71.110558,
#                   set_latitude = 42.3736,
#                   popups = crash_data$crash_date,
#                   user_var = crash_data$year)
```

## choropleth()

The `choropleth()` function has the following inputs:

- Required - data, variable, geometry
- Optional - palette

## cartogram()

The `cartogram()` function has the following inputs:

- Required - data, weight, variable, geometry
- Optional - base

## hexbin()

The `hexbin()` function has the following inputs:

- Required - data, fill, labels, geometry
- Optional - palette, seed

## tessellate()

The `tessellate()` function has the following inputs:

- Required - data, fill, geometry
- Optional - n

## Datasets

NOT DONE
