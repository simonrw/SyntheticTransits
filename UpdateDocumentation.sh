#!/bin/bash


# MUST BE CALLED FROM THE ROOT DIRECTORY
#

if [ -f "Doxyfile" ]; then
    doxygen

    # get the current branch
    BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH=${BRANCH##refs/heads/}
    BRANCH=${BRANCH:-HEAD}


    git co gh-pages
    cp -r docs/html/* .
    git commit -am 'updated documentation'
    git push origin gh-pages

    git co $BRANCH

    # get rid of left over files
    git clean -fd



else
    echo >&2 "Error cannot find Doxyfile in current directory. Exiting"
    exit 1
fi
