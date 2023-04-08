import sys
import os
import argparse
from fnmatch import fnmatch
from collections import defaultdict


def count_lines(file_path):
    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        return sum(1 for _ in f)


def count_lines_by_extension(directory, valid_extensions=None, recursive=False):
    lines_by_extension = defaultdict(int)
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            if valid_extensions is None:
                ext = os.path.splitext(file_path)[-1]
                lines_by_extension[ext] += count_lines(file_path)
            else:
                for ext in valid_extensions:
                    if fnmatch(file_path, ext):
                        lines_by_extension[ext] += count_lines(file_path)
                        break
        if not recursive:
            break
    return lines_by_extension


def parse_extensions(extension_string):
    extensions = extension_string.strip("[]").split(",")
    return [f"*.{ext.lstrip('.')}" for ext in extensions]


def main(args):
    parser = argparse.ArgumentParser(
        description="Count lines of files with given extensions")
    parser.add_argument("-t", "--types", metavar="<file extensions>", type=str,
                        default=None, help="Specify file extensions in curly braces")
    parser.add_argument("-r", "--recursive", action="store_true",
                        help="Recursively search all subdirectories")

    parsed_args = parser.parse_args(args)

    if parsed_args.types:
        valid_extensions = parse_extensions(parsed_args.types)
    else:
        valid_extensions = None

    lines_by_extension = count_lines_by_extension(
        ".", valid_extensions, parsed_args.recursive)

    max_ext_len = max(len(ext) for ext in lines_by_extension.keys())

    print("Lines by file extension:")
    print("-" * (max_ext_len + 8))

    grand_total = 0
    for ext, count in lines_by_extension.items():
        print(f"{ext[1:].ljust(max_ext_len)} = {count}")
        grand_total += count

    print("-" * (max_ext_len + 8))
    print(f"Grand total: {grand_total}")


if __name__ == "__main__":
    main(sys.argv[1:])
