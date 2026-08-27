#!/usr/bin/env bash
set -euo pipefail

targets() {
    find . -maxdepth 2 \
        \( -name .git -o -name src -o -name build \) -prune -o \
        \( -name .project -o -name .classpath -o -name .settings \
           -o -name .factorypath -o -name bin -o -name out -o -name .kotlin \) "$@"
}

list=$(targets -print)

if [[ -z $list ]]; then
    echo "Nothing to clean."
    exit 0
fi

echo "$list"
echo
read -rp "Move these to the Trash? [y/N] " reply

if [[ $reply != [yY] ]]; then
    echo "Aborted."
    exit 1
fi

targets -exec trash {} +
echo "Done."
