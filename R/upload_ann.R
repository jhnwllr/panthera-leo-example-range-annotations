library(httr)
library(dplyr)
library(purrr)

# json_body = jsonlite::toJSON(list(name = "Acacia dealbata examples", description = "Examples for testing."),auto_unbox=TRUE)

# json_body

# POST(url =  "http://labs.gbif.org:7013/v1/occurrence/annotation/project", 
# config = authenticate(Sys.getenv("GBIF_USER"), Sys.getenv("GBIF_PWD")), 
# add_headers("Content-Type: application/json"),
# body = upload_file("json/project.json"), 
# encode = 'raw') %>% 
# content(as = "text")

setwd("C:/Users/ftw712/Desktop/acacia-dealbata-example-range-annotations/")

d = readxl::read_excel("data/example_ann.xlsx") %>%
glimpse() 

d %>% 
purrr::transpose() %>%
map(~ {
jsonlite::toJSON(list(
contextType="TAXON",contextKey="2979474",
geometry=.x$geometry,
projectId=3,
enrichmentType=.x$controlled_vocab),
auto_unbox=TRUE) %>%
writeLines(file("json/request.json"))

rule_id =
POST(url = "http://labs.gbif.org:7013/v1/occurrence/annotation/rule", 
config = authenticate(Sys.getenv("GBIF_USER"), Sys.getenv("GBIF_PWD")), 
add_headers("Content-Type: application/json"),
body = upload_file("json/request.json"), 
encode = 'raw') %>% 
content(as = "text") %>%
jsonlite::fromJSON() %>% 
pluck("id")

jsonlite::toJSON(list(comment=.x$comment),auto_unbox=TRUE) %>%
writeLines(file("json/comment.json"))

# http://labs.gbif.org:7013/v1/occurrence/annotation/rule/45/comment
POST(url = paste0("http://labs.gbif.org:7013/v1/occurrence/annotation/rule/",rule_id,"/comment"), 
config = authenticate(Sys.getenv("GBIF_USER"), Sys.getenv("GBIF_PWD")), 
add_headers("Content-Type: application/json"),
body = upload_file("json/comment.json"), 
encode = 'raw') %>% 
content(as = "text")

})



# curl -u "username:password" -X POST http://localhost:8080/v1/occurrence/annotation/rule -H "Content-Type: application/json" \
  # -d '{"contextType":"TAXON", "contextKey":"2435099", "geometry":"[ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]", "projectId": 1, "errorType":"LOCATION"}'
  


# curl -u "username:password" -X POST http://localhost:8080/v1/occurrence/annotation/project -H "Content-Type: application/json" -d '{"name":"LegumeData.org", "description":"Annotations from the Legumedata.org group"}'



