#!/usr/bin/env python3
import os,re,sys
import argparse

RE_H = re.compile('([0-9\.]+)h')
RE_M = re.compile('([0-9\.]+)m')
RE_S = re.compile('([0-9\.]+)s')
RE_MS = re.compile('([0-9\.]+)ms')
RE_US = re.compile('([0-9\.]+)us')
RE_NS = re.compile('([0-9\.]+)ns')


MULTIPLIER = [10**-3, 1, 10**3, 10**6, 60*10**6, 60*60*10**6]
RE = [RE_NS, RE_US, RE_MS, RE_S, RE_M, RE_H]

def parse(line):
  total_ms = 0
  lit = line
  for i in range(0,len(RE)):
    m = RE[i].findall(lit)
    if m:
      num = m[0]
      total_ms += float(num) * MULTIPLIER[i]
      lit = RE[i].sub('',lit)
  return int(total_ms)

def main():
  parser = argparse.ArgumentParser(description="Parse time like 3s202ms to 3202000.")
  parser.add_argument('infile', nargs='?', type=argparse.FileType('r'),
      default=sys.stdin, help="Text file containing the data. "
      + "stdin will be read if argument is not supplied.")
  parser.add_argument('-i', '--index', type=int, nargs='?', default=1,
      help="Field number to be processed. Default to 1.")
  args = parser.parse_args()

  for line in args.infile:
    res = line
    parts = list(filter(None, line.split(' ')))
    subs = str(parse(parts[args.index-1]))
    print(res.replace(parts[args.index-1], subs))

if __name__ == '__main__':
  main()
