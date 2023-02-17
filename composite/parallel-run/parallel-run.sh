#!/bin/bash

. "${BASH_SOURCE%/*}/_common.sh"

while (( "$#" )); do
  launch_as "`echo "${1}"|tr ' ' '_'`" $1
  shift
done

wait_and_display
