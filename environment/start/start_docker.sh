#!/bin/bash
#start mutillidae at port 81
docker run -d -p 81:80 -p 443:443 --name owasp17 bltsec/mutillidae-docker
#start petstore at localhost:8080 because the image is dumb
#Give it a name so it is easier to remove
docker run -d --name petstore -e SWAGGER_BASE_PATH=/v2 -p 8080:8080 swaggerapi/petstore

# Set mutillidae database. Silence output due to its huge size
curl -s http://localhost:81/mutillidae/set-up-database.php > /dev/null
