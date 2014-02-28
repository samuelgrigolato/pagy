#!/bin/sh

# first verify if coffee is available
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command -v coffee >/dev/null 2>&1 || { echo >&2 " =[ please install Coffee Script before proceeding."; exit 1; }

ADDITIONAL_OPTS=""
OUT="pagy-0.1.js"
SRC="src/*.coffee"

# option handling
while test $# -gt 0
do
    case "$1" in
        --watch) echo "watching activated..."; ADDITIONAL_OPTS="$ADDITIONAL_OPTS --watch"
            ;;
        --test) echo "switching to test source..."; SRC="test/*.coffee"; OUT="pagy-0.1.tests.js"
            ;;
        *) echo " =[ bad option $1."; exit 1
            ;;
    esac
    shift
done

echo "all setup..."

# then compile!
coffee --join $OUT --map $ADDITIONAL_OPTS --compile $SRC

echo "done!"
