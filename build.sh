#!/bin/bash

echo -e "Building Hadoop docker images..."

function build_img() {
  local prefix=$1
  local imgname=$2
  local img="${prefix}/hadoop-${imgname}"

  echo -e "Building docker image hadoop-${imgname}..."

  pushd $(pwd)
  cd $imgname
  docker build -t $img .
  popd
}

IMGPREFIX=bwv988

build_img $IMGPREFIX base
build_img $IMGPREFIX namenode
build_img $IMGPREFIX nodemanager
build_img $IMGPREFIX historyserver
build_img $IMGPREFIX datanode
build_img $IMGPREFIX resourcemanager
