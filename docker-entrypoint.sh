#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    jupyter lab --ip=0.0.0.0 --port=2222 --NotebookApp.token='riaps' --no-browser --allow-root &
    code-server --auth none   --bind-addr=0.0.0.0:8443 --extensions-dir /extensions  /code
  else
    exec "$@"
fi
