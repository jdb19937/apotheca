#!/bin/sh
# fige — unumquemque submodulum ad signum recentissimum figere

set -e

for d in $@; do
    signum=$(git -C "$d" describe --tags --abbrev=0 \
        $(git -C "$d" rev-list --tags --max-count=1) 2>/dev/null) || \
        { echo "$d: nullum signum"; exit 1; }
    echo "$d: $signum"
    git -C "$d" checkout "$signum"
done
