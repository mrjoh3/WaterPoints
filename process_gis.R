

library(sf)
library(geojson)
library(dplyr)

shp <- sf::read_sf("gis/FireWater/FireWater.shp") 

crs4326 <- shp |>
  select(id, address, location, maxvolume, strategic, sub_type) |>
  sf::st_transform("EPSG:4326")

sf::write_sf(crs4326, "gis/waterpoints2.geojson")
