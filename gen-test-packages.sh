#!/bin/bash

SPEC_DIR=multisig13
rm -rf TEST-*

KDIST=/home/sbugrara/k-distributed/

for f in tests/* ; do
    F=`basename $f`
    FPATH=TEST-$F
    echo $FPATH

    mkdir $FPATH
    cp $f $FPATH
    cp $SPEC_DIR/spec.ini $FPATH
    cp $SPEC_DIR/Makefile $FPATH
    (cd $FPATH; make deps clean split-proof-tests)
    for g in $FPATH/generated/*; do
        G=`basename $g`
        if [[ "$G" == *spec[.]k ]]       #  this is the snag
        then
            FULLPATH=`pwd`/$FPATH
            echo $FULLPATH $G
            (cd $KDIST; kworker/target/debug/submit $FULLPATH $G)
        fi
    done
done