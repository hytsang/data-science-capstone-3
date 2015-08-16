#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data
EN_DATA_DIR=$DATA_DIR/final/en_US
EN_CLEAN_DATA_DIR=$DATA_DIR/cleaned

if [ ! -d $EN_CLEAN_DATA_DIR ]; then
  mkdir -p $EN_CLEAN_DATA_DIR
fi

# Remove lines with words that are listed in profanity.txt
# The list of profanity is obtained from https://gist.github.com/ryanlewis/a37739d710ccdb4b406d
grep -avwf $WORKING_DIR/profanity.txt $EN_DATA_DIR/en_US.blogs.txt > $EN_CLEAN_DATA_DIR/en_US.blogs.no_profanity.txt
grep -avwf $WORKING_DIR/profanity.txt $EN_DATA_DIR/en_US.news.txt > $EN_CLEAN_DATA_DIR/en_US.news.no_profanity.txt
grep -avwf $WORKING_DIR/profanity.txt $EN_DATA_DIR/en_US.twitter.txt > $EN_CLEAN_DATA_DIR/en_US.twitter.no_profanity.txt

# Convert the listed unicode characters to ascii
RIGHTSINGLEQUOTE=$(python -c 'print u"\u2019".encode("utf8")')
LEFTSINGLEQUOTE=$(python -c 'print u"\u2018".encode("utf8")')
RIGHTDOUBLEQUOTE=$(python -c 'print u"\u201D".encode("utf8")')
LEFTDOUBLEQUOTE=$(python -c 'print u"\u201C".encode("utf8")')
ENDASH=$(python -c 'print u"\u2013".encode("utf8")')
EMDASH=$(python -c 'print u"\u2014".encode("utf8")')
HELLIPSIS=$(python -c 'print u"\u2026".encode("utf8")')

for f in $(ls $EN_CLEAN_DATA_DIR); do
  sed -i 's/['"$RIGHTDOUBLEQUOTE"']/\"/g' $EN_CLEAN_DATA_DIR/$f
  sed -i 's/['"$LEFTDOUBLEQUOTE"']/\"/g' $EN_CLEAN_DATA_DIR/$f
  sed -i 's/['"$RIGHTSINGLEQUOTE"']/\"/g' $EN_CLEAN_DATA_DIR/$f
  sed -i 's/['"$LEFTSINGLEQUOTE"']/\"/g' $EN_CLEAN_DATA_DIR/$f
  sed -i 's/['"$ENDASH"']/-/g' $EN_CLEAN_DATA_DIR/$f
  sed -i 's/['"$EMDASH"']/-/g' $EN_CLEAN_DATA_DIR/$f
  # Remove triple dots
  sed -i 's/['"$HELLIPSIS"']//g' $EN_CLEAN_DATA_DIR/$f
done
