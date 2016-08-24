#!/bin/bash
# Just a quick wrapper script to expose the hadoop CLI.
# NOTE: File access from the host is relative to the shared volume set up in the docker compose file.

source ../docker-env-utils/common.sh
greenprint "+++ Executing hadoop command on namenode docker"

docker exec namenode hadoop $@
