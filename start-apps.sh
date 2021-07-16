#!/bin/bash

echo "--------------------------------------------"
echo "Clearing unused networks"
echo "--------------------------------------------"
sleep 2
sudo docker network prune -f
sudo docker volume prune -f

echo "--------------------------------------------"
echo "Creating network and inital service to use  "
echo "--------------------------------------------"
sleep 2
(cd network && sudo docker-compose pull &&
  sudo docker-compose up -d --remove-orphans)

echo "--------------------------------------------"
echo "Creating management applications            "
echo "--------------------------------------------"
sleep 2
(cd management && sudo docker-compose pull &&
  sudo docker-compose up -d --remove-orphans)

echo "--------------------------------------------"
echo "Creating main applications                  "
echo "--------------------------------------------"
sleep 2
(cd main && sudo docker-compose pull &&
  sudo docker-compose up -d --remove-orphans)

echo "--------------------------------------------"
echo "Creating helper applications                "
echo "--------------------------------------------"
sleep 5
(cd helpers && sudo docker-compose pull &&
  sudo docker-compose up -d --remove-orphans)

echo "--------------------------------------------"
echo "Removing non-used images"
echo "--------------------------------------------"
sleep 2
sudo docker image prune -f
