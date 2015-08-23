#!/usr/bin/python

import nltk, io
from nltk.tokenize import RegexpTokenizer
from nltk.probability import FreqDist
tokenizer = RegexpTokenizer(r'\w+')

file_path = "./data/cleaned/en_US.txt"
f = io.open(file_path, encoding = 'utf8')
c = f.read()
fd = FreqDist(tokenizer.tokenize(c))

for gram, count in fd.items():
    gram = unicode(gram).encode("utf8")
    print "%(gram)s|%(count)s" % locals()
