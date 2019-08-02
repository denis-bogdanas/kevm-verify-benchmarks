#!/bin/bash

set -e

KDIST=/home/sbugrara/k-distributed/

FPATH=multisig13
(cd $KDIST/kworker; cargo build)
(cd $FPATH; make deps clean split-proof-tests)
for g in $FPATH/generated/*; do
    G=`basename $g`
    if [[ "$G" == *spec[.]k ]]       #  this is the snag
    then
        FULLPATH=`pwd`/$FPATH
        echo $FULLPATH $G
        source $FULLPATH/generated/.env
        (cd $KDIST; kworker/target/debug/submit $FULLPATH $G k evm-semantics-call-log)
    fi
done