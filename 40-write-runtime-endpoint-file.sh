#!/usr/bin/env bash
set -e

# get backend endpoint url
[[ ! -z "${VUE_APP_BACKEND}" ]] || (echo "VUE_APP_BACKEND must not be empty."; exit 1)

target=/data/runtimeEndpoint.json

json='{"endpoint":"'${VUE_APP_BACKEND}'"}'

if [ -f "$target" ]
then
  echo "$json" > "$target"
  echo "VUE_APP_BACKEND: ${VUE_APP_BACKEND} successfully written to file."
else
  echo "VUE_APP_BACKEND: ${VUE_APP_BACKEND} failed to write file."
fi
