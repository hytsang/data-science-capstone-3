#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data

if [ -f "$WORKING_DIR/data/Coursera-SwiftKey.zip" ]; then
  if [ ! -d "$WORKING_DIR/data/final/en_US" ]; then
    unzip $WORKING_DIR/data/Coursera-SwiftKey.zip final/en_US/en_US.* -d $WORKING_DIR/data/
  fi
fi
