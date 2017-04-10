# Makefile for Makefile.pdlibbuilder. 
# 

lib.name = ipoke~

ipoke~.class.sources = src/ipoke~.c

extradirs = test


datafiles = \
$(wildcard help/*-help.pd) \
LICENSE.txt \
VERSION \
README.txt \
ipoke~-meta.pd

externalsdir = ..
# include Makefile.pdlibbuilder from parent or current directory 
-include $(externalsdir)/Makefile.pdlibbuilder 

ifndef Makefile.pdlibbuilder 
include Makefile.pdlibbuilder 
endif

