#!/usr/bin/bash

WORKING_DIR=$(pwd)
DATA_DIR=$WORKING_DIR/data
GRAMS_DIR=$DATA_DIR/grams

## Post-processing
## Fina valids grams

# Bigrams
# Get bigrams that are "valid" from the 3 files and sort it by count
grep -h "^[a-zA-Z]\+-\?[a-z]*|[a-zA-Z]\+-\?[a-z]*|[0-9]*" $GRAMS_DIR/bigrams-*.csv | sort -k 3 -t '|' -nr  > $GRAMS_DIR/bigrams.unaggregated.valid.sorted.csv
# Aggregate the count by the first two columns and sort it by count
awk '{d[$1 FS $2] += $3}END {for (k in d) print k, d[k]}' FS="|" OFS="|" $GRAMS_DIR/bigrams.unaggregated.valid.sorted.csv | sort -k 3 -t '|' -nr > $GRAMS_DIR/bigrams.aggregated.valid.sorted.csv
# Get bigrams that are "invalid" from the 3 files and sort it by count
grep -hv "^[a-zA-Z]\+-\?[a-z]*|[a-zA-Z]\+-\?[a-z]*|[0-9]*" $GRAMS_DIR/bigrams-*.csv | sort -k 3 -t '|' -nr  > $GRAMS_DIR/bigrams.unaggregated.invalid.sorted.csv
rm $GRAMS_DIR/bigrams-*.csv
# Get rows with contractions in the trigram files and sort it by count
grep -h "^[a-zA-Z]\+-\?[a-z]* [a-zA-Z]\+-\?[a-z]*|n\?'[a-z]\+|" $GRAMS_DIR/trigrams-*.csv | sort -k 3 -t '|' -nr > $GRAMS_DIR/bigrams.unaggregated.contractions.csv
# Transform the contractions from the second column with the second word in the first columns and create the second column and sort by count
awk '{d[$1$2] += $3}END {for (k in d) print k, d[k]}' FS="|" OFS="|" $GRAMS_DIR/bigrams.unaggregated.contractions.csv | sort -k 2 -t '|' -nr | sed 's/ /|/g' > $GRAMS_DIR/bigrams.aggregated.contractions.sorted.csv
# Merge the bigrams with contractions together with the main aggregated bigrams and sort it by count
cat $GRAMS_DIR/bigrams.aggregated.contractions.sorted.csv $GRAMS_DIR/bigrams.aggregated.valid.sorted.csv | sort -k 3 -t '|' -nr > $GRAMS_DIR/bigrams.final.csv

# Trigrams
# Get trigrams without contractions from the 3 files and find "valid" trigrams and sort it by count
grep -hv "^[a-zA-Z]\+-\?[a-z]* [a-zA-Z]\+-\?[a-z]*|n\?'[a-z]\+|" $GRAMS_DIR/trigrams-*.csv | grep "^[a-zA-Z]\+-\?[a-z]* [a-zA-Z]\+-\?[a-z]*|[a-zA-Z]\+-\?[a-z]*|[0-9]*" | sort -k 3 -t '|' -nr > $GRAMS_DIR/trigrams.unaggregated.valid.sorted.csv
# Get trigrams without contractions from the 3 files and find "invalid" trigrams and sort it by count
grep -hv "^[a-zA-Z]\+-\?[a-z]* [a-zA-Z]\+-\?[a-z]*|n\?'[a-z]\+|" $GRAMS_DIR/trigrams-*.csv | grep -v "^[a-zA-Z]\+-\?[a-z]* [a-zA-Z]\+-\?[a-z]*|[a-zA-Z]\+-\?[a-z]*|[0-9]*" | sort -k 3 -t '|' -nr > $GRAMS_DIR/trigrams.unaggregated.invalid.sorted.csv
# Aggreate the count based on the first two columns and sort them by count
awk '{d[$1 FS $2] += $3}END {for (k in d) print k, d[k]}' FS="|" OFS="|" $GRAMS_DIR/trigrams.unaggregated.valid.sorted.csv | sort -k 3 -t '|' -nr > $GRAMS_DIR/trigrams.aggregated.valid.sorted.csv
