#!/bin/bash


# MUST BE CALLED FROM THE ROOT DIRECTORY
#

doxygen
git co gh-pages
cp -r docs/html/* .
git commit -am 'updated documentation'
git push origin gh-pages
git co master
