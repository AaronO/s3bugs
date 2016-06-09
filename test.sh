#!/bin/bash

# Compute script's dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Temp dir
tdir=$(mktemp -d)

# Url of static server (or mock s3 server)
SERVER="http://localhost:8000"

# Go to temporary folder
cd ${tdir}

for filename in "sample" "57593bc91d236d0500b4393d"; do
    # Download using aws s3 command
    aws s3 --endpoint-url="${SERVER}" cp "s3://data/${filename}.tgz" "./${filename}.s3.tgz"

    # Download with curl
    curl -s -S "${SERVER}/data/${filename}.tgz" > "./${filename}.curl.tgz"
done


# Hash files
echo "## Hashed files:"
ls -hal *
gsha1sum *

echo ""
echo "## Original:"
cd "${DIR}/data/"
ls -hal *
gsha1sum *
