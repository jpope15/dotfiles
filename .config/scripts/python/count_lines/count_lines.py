import sys
import os
import argparse
from fnmatch import fnmatch
from collections import defaultdict


def count_lines(file_path):
    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        return sum(1 for _ in f)


def count_lines_by_extension(directory, valid_extensions=None, exclude_dirs=None, exclude_patterns=None, recursive=False):
    lines_by_extension = defaultdict(int)
    for root, dirs, files in os.walk(directory):
        if exclude_patterns is not None:
            files = [file for file in files if not any(
                fnmatch(file, pattern) for pattern in exclude_patterns)]
        if exclude_dirs is not None:
            dirs[:] = [d for d in dirs if not any(
                fnmatch(d, exclude_dir) for exclude_dir in exclude_dirs)]

        for file in files:
            file_path = os.path.join(root, file)
            if valid_extensions is None:
                ext = os.path.splitext(file_path)[-1]
                if ext != "":
                    lines_by_extension[ext] += count_lines(file_path)
            else:
                for ext in valid_extensions:
                    if fnmatch(file_path, f'*.{ext}'):
                        lines_by_extension[ext] += count_lines(file_path)
                        break

        if not recursive:
            break

    return lines_by_extension


def parse_patterns(pattern_string):
    patterns = pattern_string.strip("[]").split(",")
    return patterns


def main(args):
    parser = argparse.ArgumentParser(
        description="Count lines of files with given extensions")
    parser.add_argument("-t", "--types", metavar="<file extensions>", type=str,
                        default=None, help="Specify file extensions in curly braces")
    parser.add_argument("-e", "--exclude", metavar="<exclude patterns>", type=str,
                        default=None, help="Exclude directories or files/filetypes listed in curly braces")
    parser.add_argument("-r", "--recursive", action="store_true",
                        help="Recursively search all subdirectories")

    parsed_args = parser.parse_args(args)

    if parsed_args.types:
        valid_extensions = parse_patterns(parsed_args.types)
    else:
        valid_extensions = None

    if parsed_args.exclude:
        exclude_patterns = parse_patterns(parsed_args.exclude)
        exclude_dirs = [
            pattern for pattern in exclude_patterns if not pattern.startswith('.')]
    else:
        exclude_patterns = None
        exclude_dirs = None

    lines_by_extension = count_lines_by_extension(
        ".", valid_extensions, exclude_dirs, exclude_patterns, parsed_args.recursive)

    if lines_by_extension:
        max_ext_len = max(len(ext) for ext in lines_by_extension.keys())

        print("Lines by file extension:")
        print("-" * (max_ext_len + 8))

        grand_total = 0
        for ext, count in lines_by_extension.items():
            print(f"{ext.ljust(max_ext_len)} = {count}")
            grand_total += count

        print("-" * (max_ext_len + 8))
        print(f"Grand total: {grand_total}")
    else:
        print("No matching files found.")


if __name__ == "__main__":
    main(sys.argv[1:])

