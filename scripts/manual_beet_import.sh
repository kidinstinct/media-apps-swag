#!/usr/bin/env bash

BEET_CONFIG="/config/config.yaml"

# THE MAIN DIRECTORY TO SEARCH FOR IN
SEARCH_DIR="$1"

# removes the first argument from $*
shift

# the rest are search letters separated by space, i.e: A B C D
PARAMS="$*"

for i in $PARAMS; do
  # shellcheck disable=SC2016
  find "$SEARCH_DIR" -mindepth 1 -maxdepth 1 -path "Forfun*" -prune -false -o \
    -iname "$i*" -print0 | sort -z | xargs -0 -i sh -c "v=\"{}\"; \
    docker exec -i beets beet -c $BEET_CONFIG import \"\$v\"; date"
done
