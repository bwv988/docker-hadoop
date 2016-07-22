#!/bin/bash

echo -e "Building Hadoop docker images..."

function build_img() {
  local prefix=$1
  local imgname=$2
  local img="${prefix}/${imgname}"

  echo -e "Building docker image ${img}..."
  docker build -t $img .
}

IMGPREFIX=analytics
cd base
build_img $IMGPREFIX hadoop-base

cd ../namenode
build_img $IMGPREFIX hadoop-namenode

cd ../nodemanager
build_img $IMGPREFIX hadoop-nodemanager

cd ../historyserver
build_img $IMGPREFIX hadoop-historyserver

cd ../datanode
build_img $IMGPREFIX hadoop-datanode
