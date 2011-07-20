#!/bin/bash


# MUST BE CALLED FROM THE ROOT DIRECTORY
#

if [ -f "Doxyfile" ]; then
    doxygen
    git co gh-pages
    cp -r docs/html/* .
    git commit -am 'updated documentation'
    git push origin gh-pages
    git co master
else
    echo >&2 "Error cannot find Doxyfile in current directory. Exiting"
    exit 1
fi
