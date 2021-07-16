#!/bin/bash

echo "--------------------------------------------"
echo "Removing helper applications                "
echo "--------------------------------------------"
sleep 2
(cd helpers && sudo docker-compose down --remove-orphans)

echo "--------------------------------------------"
echo "Removing management applications            "
echo "--------------------------------------------"
sleep 2
(cd management && sudo docker-compose down --remove-orphans)

echo "--------------------------------------------"
echo "Removing main applications                  "
echo "--------------------------------------------"
sleep 2
(cd main && sudo docker-compose down --remove-orphans)

echo "--------------------------------------------"
echo "Removing network and inital service to use  "
echo "--------------------------------------------"
sleep 2
(cd network && sudo docker-compose down --remove-orphans)

echo "--------------------------------------------"
echo "Clearing unused networks and volumes"
echo "--------------------------------------------"
sleep 2
sudo docker network prune -f
sudo docker volume prune -f

echo "--------------------------------------------"
echo "Removing non-used images"
echo "--------------------------------------------"
sleep 2
sudo docker image prune -f

echo "--------------------------------------------"
echo "END"
echo "--------------------------------------------"
