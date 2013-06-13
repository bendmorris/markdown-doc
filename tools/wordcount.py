#!/usr/bin/env python
from collections import Counter
import sys

try: input_file_path = sys.argv[1]
except: print 'Usage: python word_pair_count.py filename [n]'

try: n = int(sys.argv[2])
except: n = 2

with open(input_file_path) as input_file:
    text = input_file.read().strip()

words = [x.strip(".-,'\"_=!?").lower() for x in text.split()]
words = [x for x in words if x]
word_sets = ['->'.join(x) for x in zip(*[words[i:] for i in range(n)])]

word_counts = Counter(word_sets)
for x, y in word_counts.most_common():
    print x, y