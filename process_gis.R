

library(sf)
library(geojson)
library(dplyr)

shp <- sf::read_sf("gis/FireWater/FireWater.shp") 

crs4326 <- shp |>
  mutate(group_type = case_when(
    grepl("Tank", sub_type) ~ "Tank",
    grepl("Hydrant", sub_type) ~ "Hydrant",
    sub_type == "Dam" ~ "Dam",
    TRUE ~ "Other"
  )) |>
  select(id, group_type, location, maxvolume, assett_own, sub_type) |>
  sf::st_transform("EPSG:4326")

# delete old layer first
file.remove("gis/waterpoints.geojson")
sf::write_sf(crs4326, "gis/waterpoints3.geojson")
