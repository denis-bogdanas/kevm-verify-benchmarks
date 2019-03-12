BUILD_DIR:=../.build

LOCAL_LEMMAS:=../abstract-semantics.k ../verification.k
TMPLS:=../module-tmpl.k ../spec-tmpl.k

SPEC_GROUP:=simple00
SPEC_INI:=spec.ini

KPROVE_OPTS:=--smt-prelude $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST))))/../evm.smt2)

#List of the top-level eDSL rules to check
SPEC_NAMES:=get5

include ../../resources/kprove.mak
