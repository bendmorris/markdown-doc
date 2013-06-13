#!/usr/bin/env python
from collections import Counter
import sys

try: input_file_path = sys.argv[1]
except: print 'Usage: python word_pair_count.py filename'

with open(input_file_path) as input_file:
    text = input_file.read().strip()

words = [x.strip(".-,'\"_=!?").lower() for x in text.split()]
words = [x for x in words if x]
word_pairs = ['%s->%s' % x for x in zip(words, words[1:])]

word_counts = Counter(word_pairs)
for x, y in word_counts.most_common():
    print x, y