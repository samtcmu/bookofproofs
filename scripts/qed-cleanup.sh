#!/bin/sh

# name: Sam Tetruashvili (samt@alumni.cmu.edu)
# title: refs-cleanup.sh
# date created: Wed Sep 15 08:55:19 PDT 2010
# description: This script will insert a "tie" before any \QED commands to ensure
#              the QED is not placed on its own line.

# last modified: Wed Sep 15 08:55:19 PDT 2010

CHAPTERS_DIR="/Users/samt/private/math/bookofproofs/chapters/"

for file in `ls ${CHAPTERS_DIR}`; do
    # Get the absolute path of the current chapter we are cleaning up.
    CHAPTER=${CHAPTERS_DIR}${file}
    TEMP=${CHAPTER_DIR}TEMP

    cat ${CHAPTER} | sed -E 's/ \\QED/~\\QED/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
done

