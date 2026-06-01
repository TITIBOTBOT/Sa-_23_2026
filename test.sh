#!/bin/bash
data=0
data=$(mosquitto_sub -h localhost -t AM107/by-room/E104/data -C 1)


echo $data
