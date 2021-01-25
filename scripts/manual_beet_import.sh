#!/usr/bin/env bash

# THE MAIN DIRECTORY TO SEARCH FOR IN
SEARCH_DIR="$1"

# removes the first argument from $*
shift

# the rest are search letters separated by space, i.e: A B C D
PARAMS="$*"

for i in $PARAMS; do
  find "$SEARCH_DIR" -maxdepth 1 -iname "$i*" -print0 |
    xargs -0 docker exec -i beets \
      beet -c /config/config.yaml import -p -l -i -q
done
