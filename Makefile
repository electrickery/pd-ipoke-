# Makefile for Makefile.pdlibbuilder. 
# 

lib.name = ipoke~

ipoke~.class.sources = src/ipoke~.c

extradirs = test


datafiles = \
$(wildcard help/*-help.pd) \
LICENSE.txt \
README.txt \
ipoke~-meta.pd

externalsdir = ..
PDLIBBUILDER_DIR=.

include $(firstword $(wildcard $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder \
  $(externalsdir)/Makefile.pdlibbuilder)) 

ifndef Makefile.pdlibbuilder 
include Makefile.pdlibbuilder 
endif

