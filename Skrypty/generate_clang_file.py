import argparse
import os
import sys
import re
import pprint

parser = argparse.ArgumentParser(description="Generate .clang file for autocompletion based on build.ninja file")
parser.add_argument('--ninja-file', dest='ninja_file', required=True, help='build.ninja input file')
parser.add_argument('--clang-file', dest='clang_file', default='.clang', help='output file with flags')
parser.add_argument('--debug', dest='debug', default=False, help='print more output')
args = parser.parse_args()
debug = args.debug

if not os.path.exists(args.ninja_file):
    print("'{}' file doesn't exist".format(args.ninja_file))
    sys.exit(-1)

#  regexps
includes_re = re.compile('INCLUDES = (.*)')
flags_re = re.compile('FLAGS = (.*)')

flags = []


def process_line(output_list, matcher, line):
    global debug

    result = matcher.search(line)
    if result:
        if debug:
            print("Matched {}".format(result.group(1)))
        output_list.extend(result.group(1).split(' '))
        return True
    return False


def deduplicate_with_order(seq):
    seen = set()
    seen_add = seen.add
    return [x for x in seq if not (x in seen or seen_add(x))]


with open(args.ninja_file) as ninja_file:
    for line in ninja_file:
        if process_line(flags, includes_re, line):
            pass
        elif process_line(flags, flags_re, line):
            pass

flags = deduplicate_with_order(flags)

if debug:
    print("Final flags:")
    pprint.pprint(flags)

with open(args.clang_file, 'w') as clang_file:
    clang_file.write("flags = {}".format(" ".join(flags)))
    print("{} saved".format(args.clang_file))
