#!/usr/bin/env python

import sys
import urlparse


def main():
    while True:
        url = sys.stdin.readline().strip().split()[0]
        parsed = urlparse.urlparse(url)
        if parsed.netloc == 'www.google.cn':
            parsed = parsed._replace(netloc='www.google.com')
            new_url = urlparse.urlunparse(parsed)
            sys.stdout.write('302:%s\n' % new_url)
        else:
            sys.stdout.write('\n')
        sys.stdout.flush()

if __name__ == '__main__':
    main()
