#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data

if [ -f "$WORKING_DIR/data/Coursera-SwiftKey.zip" ]; then
  if [ ! -d "$WORKING_DIR/data/final/en_US" ]; then
    unzip $WORKING_DIR/data/Coursera-SwiftKey.zip -d $WORKING_DIR/data/
  fi
fi

# Delete non-English data files
if [ -d "$WORKING_DIR/data/final/fi_FI " ]; then
  rm -r $WORKING_DIR/data/final/fi_FI
fi

if [ -d "$WORKING_DIR/data/final/de_DE " ]; then
  rm -r $WORKING_DIR/data/final/de_DE
fi

if [ -d "$WORKING_DIR/data/final/ru_RU " ]; then
  rm -r $WORKING_DIR/data/final/ru_RU
fi
