#!/bin/sh

# first verify if coffee is available
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command -v coffee >/dev/null 2>&1 || { echo >&2 " =[ please install Coffee Script before proceeding."; exit 1; }

ADDITIONAL_OPTS=""

# option handling
while test $# -gt 0
do
    case "$1" in
        --watch) echo "watching activated..."; ADDITIONAL_OPTS="--watch"
            ;;
        *) echo " =[ bad option $1."; exit 1
            ;;
    esac
    shift
done

echo "all setup..."

# then compile!
coffee --join pagy.js --map $ADDITIONAL_OPTS --compile src/*.coffee

echo "done!"
