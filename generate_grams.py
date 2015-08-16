#!/usr/bin/python

import csv, sys, os, getopt
from nltk.probability import FreqDist

def main(argv):
    INPUT_FILE = ''
    OUTPUT_FILE = ''
    n = None

    try:
        opts, args = getopt.getopt(argv,"hi:o:n:",["ifile=","ofile=","ngram="])
    except getopt.GetoptError:
        print 'generate_grams.py -i <INPUT_FILE> -o <OUTPUT_FILE> -n <N>'
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            print 'generate_grams.py -i <inputfile> -o <outputfile> -n <N>'
            sys.exit()
        elif opt in ("-i", "--ifile"):
            INPUT_FILE = arg
        elif opt in ("-o", "--ofile"):
            OUTPUT_FILE = arg
        elif opt in ("-n", "--ngram"):
            n = int(arg)

    SCRIPT_PATH = os.path.dirname(os.path.realpath(__file__))
    LIB_PATH = os.path.join(SCRIPT_PATH, 'lib')

    sys.path.append(LIB_PATH)
    from tokenise import tokenise
    
    print("Generating %(n)s-grams for %(INPUT_FILE)s" % locals())
    print("Tokenising activity has started.")
    grams_list = tokenise(n, INPUT_FILE)
    print("Tokenising activity has completed.")

    fd = FreqDist(grams_list)

    print("Writing frequency distribution to file.")
    with open(OUTPUT_FILE, 'w') as results:
        writer = csv.writer(results, delimiter = "|")
        for gram, count in fd.items():
            writer.writerow([unicode(' '.join(gram[0:-1])).encode("utf8"), unicode(gram[-1]).encode("utf8"), str(count)])
    print("Writing frequency distribution to file completed.")

if __name__ == "__main__":
    main(sys.argv[1:])
