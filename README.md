# Data Science Capstone Data Processing Scripts (July to August 2015)

This repository contains the codes and scripts that are used to process the raw text files obtained from [Coursera](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).

The objective of these scripts is to demostrate data engineering rather than building a smoothing ngram model. These script managed to process the entire corpus to generate the ngrams and their counts, which is hardly possible with R. These data can be then used for developing the predictive text algorithm.

## Requirements

### Hardware
1. At least 16 GB of RAM
2. Most of the scripts are single-threaded, therefore dual-core is sufficient

### Software
1. Linux (tested on Ubuntu 14.04, should work on most Linux)
2. Python (version 2.7)
  1. nltk (version 3.0)
  2. numpy

## Scripts

Run the following scripts in order:

1. `1-get_src_data.sh`
> Download the raw corpus file

2. `2-extract_data.sh`
> Unpackage the raw corpus file and remove the non-English data files.

3. `3-data_cleaning.sh`
> Clean up the corpus by replacing unicode characters to ascii

4. `4-generate_grams.sh`
> Using the python scripts (`generate_grams.py` and `generate_unigrams.py`), the ngrams (up to n = 3) and their respective counts for each corpus (therefore, unaggregated) are generated in csv file

5. `5-post_process.sh`
> Post-process removes invalid ngrams and aggregate the count for common ngrams.

6. `6-compress.sh`
> Compress the files with aggregated counts with bzip2 (optional)
