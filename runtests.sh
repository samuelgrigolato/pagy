#!/bin/sh

# verify if phantomjs is present in the system
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command -v phantomjs >/dev/null 2>&1 || { echo >&2 " =[ please install PhantomJS before proceeding."; exit 1; }

exit 0;

