#!/usr/bin/env python3
import os,re,sys

RE_H = re.compile('([0-9\.]+)h')
RE_M = re.compile('([0-9\.]+)m')
RE_S = re.compile('([0-9\.]+)s')
RE_MS = re.compile('([0-9\.]+)ms')

MULTIPLIER = [1, 1000, 60*1000, 60*60*1000]
RE = [RE_MS, RE_S, RE_M, RE_H]

def parse(line):
  total_ms = 0
  lit = line
  for i in range(0,len(RE)):
    m = RE[i].findall(lit)
    if m:
      num = m[0]
      total_ms += float(num) * MULTIPLIER[i]
      lit = RE[i].sub('',lit)
  print(int(total_ms))

def main():
  if len(sys.argv) > 1:
    parse(sys.argv[1])
  else:
    for line in sys.stdin:
      parse(line)

if __name__ == '__main__':
  main()
