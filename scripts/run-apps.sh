#!/bin/bash

echo "--------------------------------------------"
echo "Clearing network"
echo "--------------------------------------------"
sleep 2
sudo docker network prune -f

echo "--------------------------------------------"
echo "Pulling new images"
echo "--------------------------------------------"
sleep 2
sudo docker-compose pull

echo "--------------------------------------------"
echo "Running apps"
echo "--------------------------------------------"
sleep 2
sudo docker-compose up -d --remove-orphans

echo "--------------------------------------------"
echo "Removing non-used images"
echo "--------------------------------------------"
sleep 2
sudo docker image prune -f
