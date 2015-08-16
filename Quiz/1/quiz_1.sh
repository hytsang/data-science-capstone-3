#!/usr/bin/bash
DATA_DIR=../../data/final/en_US
# Quiz 1
# Question 1
ls -lh $DATA_DIR/en_US.blogs.txt

# Question 2
wc -l $DATA_DIR/en_US.twitter.txt

# Question 3
if [[ uname -eq "Linux" ]]; then
  wc -L $DATA_DIR/en_US.*
fi

# Question 4
grep -c "love" $DATA_DIR/en_US.twitter.txt
grep -c "hate" $DATA_DIR/en_US.twitter.txt

# Question 5
grep "biostats" $DATA_DIR/en_US.twitter.txt

# Question 6

grep "A computer once beat me at chess, but it was no match for me at kickboxing" \
$DATA_DIR/en_US.twitter.txt
