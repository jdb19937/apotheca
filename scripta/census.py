#!/usr/bin/env python3
# census — lineas fontium in unoquoque submodulo et in radice numerare

import subprocess
import sys
from pathlib import Path


def count_lines(files, cwd=None):
    if not files:
        return 0
    mime = subprocess.run(
        ["file", "--mime-type", "-f", "-"],
        input="\n".join(files),
        capture_output=True,
        text=True,
        cwd=cwd,
    ).stdout
    text_files = [
        line.split(":", 1)[0]
        for line in mime.splitlines()
        if "text/" in line.split(":", 1)[-1]
    ]
    total = 0
    for f in text_files:
        p = Path(cwd) / f if cwd else Path(f)
        try:
            with p.open("rb") as fh:
                total += sum(1 for _ in fh)
        except OSError:
            pass
    return total


def ls_files(cwd=None, no_recurse=False):
    cmd = ["git", "ls-files"]
    if no_recurse:
        cmd.append("--no-recurse-submodules")
    return subprocess.run(cmd, capture_output=True, text=True, cwd=cwd).stdout.splitlines()


def main():
    rows = []
    totum = 0
    for d in sys.argv[1:]:
        n = count_lines(ls_files(cwd=d), cwd=d)
        rows.append((d, n))
        totum += n

    n = count_lines(ls_files(no_recurse=True))
    rows.append(("apotheca", n))
    totum += n

    rows.sort(key=lambda r: r[1], reverse=True)
    for name, n in rows:
        print(f"{name:<12} {n:6d}")
    print(f"{'TOTUM':<12} {totum:6d}")


if __name__ == "__main__":
    main()
