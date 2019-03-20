BUILD_DIR:=../.build

LOCAL_LEMMAS:=../resources/abstract-semantics.k ../resources/verification.k \
                ../resources/evm-symbolic.k ../resources/ecrec-symbolic.k
TMPLS:=../resources/module-tmpl.k ../resources/spec-tmpl.k

SPEC_INI:=spec.ini
SPECS_DIR:=./generated-k

KPROVE_OPTS:=--smt-prelude $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST))))/../resources/evm.smt2)

#List of the top-level eDSL rules to check
SPEC_NAMES:=getx

include ../resources/kprove.mak
