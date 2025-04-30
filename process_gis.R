

library(sf)
library(geojson)
library(dplyr)

shp <- sf::read_sf("gis/FireWater/FireWater.shp") |>
  select(id, address, maxvolume, strategic, sub_type)

crs4326 <- sf::st_transform(shp, "EPSG:4326")

sf::write_sf(crs4326, "gis/waterpoints.geojson")
