#!/bin/bash
# to make sure that environment variables are present before running image


if [ -z "${MONGO}" ]; then
    echo Input MONGO is missing
    exit 1
fi


if [ -z "${MONGO_URL}" ]; then
    echo Input MONGO_URL is missing
    exit 1
fi




node  /app/server.js