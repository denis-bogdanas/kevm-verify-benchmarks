#List of the top-level eDSL rules to check
SPEC_NAMES:=execute-success-call-1
KEVM_REPO_DIR:=/home/sbugrara/evm-semantics-call-log/
VERIFICATION_NUM:=0
TMPLS:=../resources/module-tmpl.k ../resources/spec-tmpl-call-log.k

include ../resources/kprove.mak

$(SPECS_DIR)/execute-success-call-1-spec.k: $(TMPLS) $(SPEC_INI)
	python3 $(RESOURCES)/gen-spec.py $(TMPLS) $(SPEC_INI) execute-success-call-1 multisig-call_trusted execute-success-call-1 > $@