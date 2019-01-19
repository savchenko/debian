#!/usr/bin/python
# -*- coding: utf-8 -*-
# Andrew Savchenko (c) MIT License
# andrew@savchenko.net

import datetime
import argparse
import os
import re
from platform import node

# Parser arguments
parser = argparse.ArgumentParser(description='Sanitize downloaded hosts file')
parser.add_argument('--input', '-i', help='Input hosts file we need to check')
parser.add_argument('--output', '-o', help='Where to save cleaned output')
parser.add_argument('--unbound', '-ou', help='Separate hosts file for Unbound DNS server')
parser.add_argument('--blacklist', '-b', help='Additional hosts file to append')
parser.add_argument('--whitelist', '-w', help='Whitelisted domains')
parser.add_argument('--local', '-l', help='Localnet domains')
args = parser.parse_args()
timestamp = datetime.datetime.now()
hostname = node()

def clean(lines):
    """
    Gently sanitize, IDNs are _not_ preserved
    """
    lines_clean = []
    for line in lines:
        if not line.startswith('#') and not line.startswith(':') and not line.startswith('!'):
            line = re.sub(r'\d+\.\d\.\d\.\d', '', line)
            line = re.sub(r'\#.+', '', line)
            line = re.sub(r'\n\t\s', '', line)
            line = line.strip(' \t\n')
            line = line.lower()
            if line.startswith('http://') or line.startswith('https://'):
                line =line.split('//')[1].split('/')[0]
            if not line.startswith('localhost ') and '.' in line and re.match(r'^[a-z0-9][a-z0-9-_\.]*$', line):
                lines_clean.append(line.strip('.'))
    return lines_clean

def read_file(in_file):
    """
    Reads file
    """
    try:
        lines = open(in_file, 'rU').readlines()
    except IOError, err:
        raise "Can't open %s, %s" % (in_file, err)
    return lines

# Check if both input and output are valid
if args.input and args.output:
    data = {}
    if os.path.isfile(args.input):
        try:
            source = open(args.input, 'rU').readlines()
            output = open(args.output, 'w+')
        except:
            parser.exit(status=1, message="\nUnable to access either input or output files.\n")
    else:
        parser.exit(status=1, message="\nProvided SRC isn't a file\n")
else:
    parser.print_help()
    parser.exit(status=2)

# Sanitize input and create storage for clean output
input_clean = clean(source)

# Add favourites or just process source? Remove duplicates regardless.
if args.blacklist:
    blacklist = read_file(args.blacklist)
    blacklist_clean = clean(blacklist)
    hosts_data = list(set(input_clean + blacklist_clean))
else:
    hosts_data = list(set(input_clean))

# Check against whitelist?
if args.whitelist:
    whitelist = read_file(args.whitelist)
    whitelist = tuple([e.strip("\n") for e in whitelist])
    hosts_data = [line + '\n' for line in hosts_data if not line.endswith(whitelist) and not line.endswith(".local")]

hosts_data = sorted(hosts_data, key=lambda domain: domain.split('.')[-2])
hosts_data = ['127.0.0.1 ' + x for x in hosts_data]
hosts_data.insert(0, '# ' + str(timestamp) + '\n')
output.writelines(hosts_data)
output.close()

if args.unbound:
    try:
        unbound = open(args.unbound, 'w+')
    except:
        parser.exit(status=1, message="\nUnable to write the Unbound config.\n")
    output_unbound = []
    for ln in hosts_data[3:]:
        ln = ln.split(' ')
        ln = 'local-data: "' + ln[1].strip('\n ') + ' A 127.0.0.1"\n'
        output_unbound.append(ln)
    output_unbound.insert(0, '# ' + str(timestamp) + '\n')
    unbound.writelines(output_unbound)
    unbound.close()

print '\n :: Hosts file checked and cleaned, %s records so far\n' % (len(hosts_data))
