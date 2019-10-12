.NOTPARALLEL:

ALL_DIRS    := $(dir $(wildcard */Makefile))
PASSING_DIRS:= $(dir $(wildcard 0-*/Makefile 1-ecrecover*/Makefile))
FAILING_DIRS:= $(dir $(wildcard 1-*failure/Makefile))
JENKINS_DIRS:= $(PASSING_DIRS)

# For MODE=foo, SUBDIRS will be FOO_DIRS
SUBDIRS:=$($(shell echo $(MODE) | tr a-z A-Z)_DIRS)

include resources/kprove-group.mak
