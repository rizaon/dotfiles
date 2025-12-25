#!/usr/bin/env python3
import os,re,sys
import argparse

def main():
  parser = argparse.ArgumentParser(description="Flip commit title to show up before other commit info.")
  parser.add_argument('infile', nargs='?', type=argparse.FileType('r'),
      default=sys.stdin, help="Text file containing the data. "
      + "stdin will be read if argument is not supplied.")
  args = parser.parse_args()

  buff = []
  buffering = False
  for line in args.infile:
    res = line.rstrip()
    if res.startswith('commit ') and len(res) == 47:
      buffering = True
      buff.append(res)
    elif buffering:
      buff.append(res)
      if len(buff) >= 6:
        print(buff[4])
        print(buff[5])
        print(buff[0])
        print(buff[1])
        print(buff[2])
        print(buff[3])
        buff = []
        buffering = False
    else:
      print(res)

if __name__ == '__main__':
  main()
