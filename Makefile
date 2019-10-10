.NOTPARALLEL:

JENKINS_DIRS=SUBDIRS := $(wildcard 0-*/.)

# For MODE=foo, SUBDIRS will be FOO_DIRS
# SUBDIRS:=$($(shell echo $(MODE) | tr a-z A-Z)_DIRS)

include resources/kprove-group.mak
