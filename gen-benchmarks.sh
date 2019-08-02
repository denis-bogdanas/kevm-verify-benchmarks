#!/bin/bash

SPEC_DIR=multisig13
rm -rf TEST-*

KDIST=/home/sbugrara/k-distributed/
(cd $KDIST/kworker; cargo build)
for f in 0-* ; do
    FPATH=`basename $f`
    (cd $FPATH; make deps clean split-proof-tests)
    for g in $FPATH/generated/*; do
        G=`basename $g`
        if [[ "$G" == *spec[.]k ]]       #  this is the snag
        then
            FULLPATH=`pwd`/$FPATH
            echo $FULLPATH $G
            source $FULLPATH/generated/.env
            SEMANTICS=`basename $SEMANTICS`
            echo $SEMANTICS
            (cd $KDIST; kworker/target/debug/submit $FULLPATH $G k $SEMANTICS)
        fi
    done
done