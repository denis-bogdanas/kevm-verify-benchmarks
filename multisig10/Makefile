#List of the top-level eDSL rules to check
#SPEC_NAMES:=execute-executor-valid-sigcheck-pass-ownercheck-pass-success
#SPEC_NAMES:=execute-executor-valid-sigcheck-fail-revert-2

#SPEC_NAMES:=execute-executor-valid-sigcheck-pass-ownercheck-fail-revert
#SPEC_NAMES:=execute-executor-valid-sigcheck-pass-ownercheck-pass-success
SPEC_NAMES:=execute-executor-valid-sigcheck-pass-ownercheck-pass-success \
execute-executor-valid-sigcheck-pass-ownercheck-fail-revert

KEVM_REPO_DIR:=/home/sbugrara/evm-semantics-call-log/
VERIFICATION_NUM:=0
TMPLS:=../resources/module-tmpl.k ../resources/spec-tmpl-call-log.k

include ../resources/kprove.mak
