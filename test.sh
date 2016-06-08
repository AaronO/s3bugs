#!/bin/bash

# Compute script's dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Temp dir
tdir=$(mktemp -d)

# Url of static server (or mock s3 server)
SERVER="http://localhost:8000"

# Go to temporary folder
cd ${tdir}

# Download using aws s3 command
aws s3 --endpoint-url="${SERVER}" cp s3://data/sample.tgz ./s3.tgz

# Download with curl
curl -s -S "${SERVER}/data/sample.tgz" > ./curl.tgz

# Hash files
echo "## Hashed files:"
ls -hal s3.tgz curl.tgz
gsha1sum s3.tgz curl.tgz

echo ""
echo "## Original:"
ls -hal "${DIR}/data/sample.tgz"
gsha1sum "${DIR}/data/sample.tgz"
