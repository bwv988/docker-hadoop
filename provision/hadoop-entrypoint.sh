#!/bin/bash

# Set some sensible defaults.
export CORE_CONF_fs_defaultFS=${CORE_CONF_fs_defaultFS:-hdfs://`hostname -f`:8020}

source /entrypoints/inject_hadoop_cfg.sh

exec $@
