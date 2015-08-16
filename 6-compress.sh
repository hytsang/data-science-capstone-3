#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data
GRAMS_DIR=$DATA_DIR/grams

bzip2 $GRAMS_DIR/bigrams.final.csv
bzip2 $GRAMS_DIR/trigrams.aggregated.valid.sorted.csv
