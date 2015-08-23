#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data
GRAMS_DIR=$DATA_DIR/grams
EN_CLEAN_DATA_DIR=$DATA_DIR/cleaned

if [ ! -d $GRAMS_DIR ]; then
  mkdir -p $GRAMS_DIR
fi
# Generate unigrams
python generate_unigrams.py | grep "^[a-zA-Z][a-zA-Z]\+-\?[a-z]*" | sort -k 2 -t ',' > $GRAMS_DIR/unigrams.csv

# Generate bigrams
for f in $(ls $EN_CLEAN_DATA_DIR);
do
    # Get the components of the file name separated by .
    FC=(${f//./ })
    python $WORKING_DIR/generate_grams.py -i $EN_CLEAN_DATA_DIR/$f -o $GRAMS_DIR/bigrams-${FC[1]}.csv -n 2
done

# Generate trigrams
for f in $(ls $EN_CLEAN_DATA_DIR);
do
    # Get the components of the file name separated by .
    FC=(${f//./ })
    python $WORKING_DIR/generate_grams.py -i $EN_CLEAN_DATA_DIR/$f -o $GRAMS_DIR/trigrams-${FC[1]}.csv -n 3
done
