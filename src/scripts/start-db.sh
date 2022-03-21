#!/bin/bash
set -e

SERVER="my_database_server";
PW="mysecretpassword";
DB="my_database";

echo "echo stop & remove old sudo docker [$SERVER] and starting new fresh instance of [$SERVER]"
(sudo docker kill $SERVER || :) && \
  (sudo docker rm $SERVER || :) && \
  sudo docker run --name $SERVER -e POSTGRES_PASSWORD=$PW \
  -e PGPASSWORD=$PW \
  -p 5432:5432 \
  -d postgres

# wait for pg to start
echo "sleep wait for pg-server [$SERVER] to start";
SLEEP 3;

# create the db 
echo "CREATE DATABASE $DB ENCODING 'UTF-8';" | sudo docker exec -i $SERVER psql -U postgres
echo "\l" | sudo docker exec -i $SERVER psql -U postgres