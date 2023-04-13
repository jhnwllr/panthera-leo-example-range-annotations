
library(dplyr)
library(purrr)
library(leaflet)

setwd("C:/Users/ftw712/Desktop/ann_leaflet_maps/")

list.files("data/")

df_sf = readxl::read_excel("data/example_ann.xlsx") %>%
sf::st_as_sf(wkt="geometry",crs = "+proj=longlat +datum=WGS84") %>%
glimpse() 

tile_url ='https://api.gbif.org/v2/map/occurrence/density/{z}/{x}/{y}@1x.png?style=scaled.circles&taxonKey=5219404'

factpal = colorFactor(topo.colors(5), df_sf$controlled_vocab)

popup = df_sf$comment

leaflet(df_sf) %>% 
  addTiles() %>%
  addTiles(urlTemplate=tile_url) %>%
  addPolygons(color = ~factpal(controlled_vocab),
  popup = popup,
  popupOptions = popupOptions(maxWidth = "1000", closeOnClick = TRUE)
  ) %>%
  addLegend("bottomright", pal = factpal, values = ~controlled_vocab,
    title = "Range Annotations",
    opacity = 1
  )

