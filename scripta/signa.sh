#!/bin/sh
# signa — novum signum in repositorio creare
# requirere: (1) TAG datus, (2) nulla mutatio non commissa,
#            (3) omnes submoduli ad signum fixi

set -e

signum="$1"
shift

test -n "$signum" || { echo "TAG non datus est"; exit 1; }
git diff --quiet && git diff --cached --quiet || \
    { echo "mutationes non committuntur"; exit 1; }

for d in $@; do
    nota=$(cd "$d" && git describe --exact-match --tags 2>/dev/null) || \
        { echo "$d non ad signum fixum est"; exit 1; }
    echo "$d: $nota"
done

git tag "$signum"
