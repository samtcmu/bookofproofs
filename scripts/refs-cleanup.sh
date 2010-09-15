#!/bin/sh

# name: Sam Tetruashvili (samt@alumni.cmu.edu)
# title: refs-cleanup.sh
# date created: Sun Aug  8 12:45:35 PDT 2010
# description: This script is meant to clean up non-maintainable usages of the
#              LaTeX \ref{} directive. This directive is used to references theorems
#              lemmas, corollaries, facts, notes, equations, etc. I've turned each of
#              these referencing commands into LaTeX commands such as \equationref{}
#              which defines the way equations are to be referenced in The Book of
#              Proofs. This script will make the current TeX files use these new
#              commands.


# last modified: Sun Aug  8 12:45:35 PDT 2010

CHAPTERS_DIR="/Users/samt/private/math/bookofproofs/chapters/"

for file in `ls ${CHAPTERS_DIR}`; do
    # Get the absolute path of the current chapter we are cleaning up.
    CHAPTER=${CHAPTERS_DIR}${file}
    TEMP=${CHAPTER_DIR}TEMP

    cat ${CHAPTER} | sed -E 's/([Ee])quations? \(?\$?\\ref{([^}]*)}\$?\)?/\\\1quationRef{\2}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[Tt]heorems? \(?\$?\\ref{([^}]*)}\$?\)?/\\TheoremRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[Ll]emmas? \(?\$?\\ref{([^}]*)}\$?\)?/\\LemmaRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[Cc]orollarys? \(?\$?\\ref{([^}]*)}\$?\)?/\\CorollaryRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[Ff]igures? \(?\$?\\ref{([^}]*)}\$?\)?/\\FigureRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[De]efinitions? \(?\$?\\ref{([^}]*)}\$?\)?/\\DefinitionRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
    cat ${CHAPTER} | sed -E 's/[Aa]xioms? \(?\$?\\ref{([^}]*)}\$?\)?/\\AxiomRef{\1}/g' > ${TEMP}
    mv ${TEMP} ${CHAPTER}
done

