#!/bin/python

import datetime

def to_binary(value):
    return str(bin(int(value)))[2:]

def main():
    now = datetime.datetime.now()

    h1 = 0 if len(str(now.hour)) == 1 else str(now.hour)[0]
    h2 = str(now.hour)[0] if len(str(now.hour)) == 1 else str(now.hour)[1]

    m1 = 0 if len(str(now.minute)) == 1 else str(now.minute)[0]
    m2 = str(now.minute)[0] if len(str(now.minute)) == 1 else str(now.minute)[1]

    print(f'{to_binary(now.hour)} {to_binary(now.minute)}')

if __name__ == '__main__':
    main()
