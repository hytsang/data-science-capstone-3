#!/usr/bin/bash

DATA_SRC_URL=https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip
WORKING_DIR=$(pwd)

if [ ! -d "$WORKING_DIR/data" ]; then
  mkdir -p $WORKING_DIR/data
fi

if [ ! -f "$WORKING_DIR/data/Coursera-SwiftKey.zip" ]; then
  curl -o $WORKING_DIR/data/Coursera-SwiftKey.zip $DATA_SRC_URL
fi
