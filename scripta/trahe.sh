#!/bin/sh
# trahe — omnes submodulos ad ramum principalem trahere
# pro unoquoque modulo: ad "main" transire et recentia attrahere

set -e

for d in $@; do
    git -C "$d" checkout main && git -C "$d" pull
done
