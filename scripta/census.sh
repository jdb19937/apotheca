#!/bin/sh
# census — lineas fontium in unoquoque submodulo et in radice numerare

totum=0
for d in $@; do
    n=$(cd "$d" && git ls-files | xargs cat 2>/dev/null | wc -l)
    printf "%-12s %6d\n" "$d" "$n"
    totum=$((totum + n))
done

n=$(git ls-files --no-recurse-submodules | xargs cat 2>/dev/null | wc -l)
printf "%-12s %6d\n" "apotheca" "$n"
totum=$((totum + n))
printf "%-12s %6d\n" "TOTUM" "$totum"
