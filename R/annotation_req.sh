
http://labs.gbif.org:7013/

# curl -u "jwaller:#9SkdnAksiDkneksQosnVid88A" -X POST http://labs.gbif.org:7013/v1/occurrence/annotation/project -H "Content-Type: application/json" -d '{"name":"John Examples", "description":"John example annotations"}'


# curl -u "username:password" -X POST http://localhost:8080/v1/occurrence/annotation/rule -H "Content-Type: application/json" \
  # -d '{"contextType":"TAXON", "contextKey":"2435099", "geometry":"[ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]", "projectId": 1, "errorType":"LOCATION"}'
  


# curl -u "username:password" -X POST http://localhost:8080/v1/occurrence/annotation/rule -H "Content-Type: application/json" \
  -d '{"contextType":"TAXON", "contextKey":"2435099", "geometry":"[ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]", "projectId": 1, "errorType":"LOCATION"}'
  

# curl -X 'POST' \
  'http://labs.gbif.org:7013/v1/occurrence/annotation/rule' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  # "id": 0,
  # "contextType": "TAXON",
  # "contextKey": "string",
  # "geometry": "string",
  # "errorType": "IDENTIFICATION",
  # "enrichmentType": "INTRODUCED",
  # "projectId": 0,
  # "supportedBy": [
    # "string"
  # ],
  # "contestedBy": [
    # "string"
  # ],
  # "created": "2023-03-28T09:33:22.060Z",
  # "createdBy": "string",
  # "deleted": "2023-03-28T09:33:22.060Z",
  # "deletedBy": "string"
# }'

