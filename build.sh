#!/bin/bash

echo -e "Building Hadoop docker images..."

cd base
docker build -t bwv988/hadoop-base .

cd ../namenode
docker build -t bwv988/hadoop-namenode .

cd ../nodemanager
docker build -t bwv988/hadoop-nodemanager .

cd ../historyserver
docker build -t bwv988/hadoop-historyserver .

cd ../datanode
docker build -t bwv988/hadoop-datanode .
