#!/bin/bash

# Compute script's dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Starting a simple python powered static server"

cd ${DIR} && python -m SimpleHTTPServer