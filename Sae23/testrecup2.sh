#!/bin/bash
data=$(mosquitto_sub -h mqtt.iut-blagnac.fr -p 8883 -u student -P student -t sensors/AM107/by-room/E208/data -C 1)

room=$(echo "$data" | jq -r '.[1].room')
temp=$(echo "$data" | jq -r '.[0].temperature')
hum=$(echo "$data" | jq -r '.[0].humidity')
activity=$(echo "$data" | jq -r '.[0].activity')
co2=$(echo "$data" | jq -r '.[0].co2')
tvoc=$(echo "$data" | jq -r '.[0].tvoc')
illu=$(echo "$data" | jq -r '.[0].illumination')
infra=$(echo "$data" | jq -r '.[0].infrared')
infra_visible=$(echo "$data" | jq -r '.[0].infrared_and_visible')
pressure=$(echo "$data" | jq -r '.[0].pressure')

date_mesure=$(date +%F)
heure_mesure=$(date +%T)



