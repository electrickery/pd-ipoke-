NAME=ipoke~
CSYM=ipoke_tilde


# --- on Windows, put a copy of pd.dll next to ipoke dir ----
# -----------or else, set path to pd.dll here: --------------

PDPATH = ../..


# ----- below here, no editing should be needed -------------

# ----- find current operating system to set target ---------

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
current: pd_linux
endif

ifeq ($(UNAME), Darwin)
current: pd_darwin
endif

ifeq ($(UNAME), Win)
current: pd_win
endif

#----------------------------- find system bitness ------------

LBITS := $(shell getconf LONG_BIT)
ifeq ($(LBITS),64)
BINDEST=../bin64
else
BINDEST=../bin
endif

# ----------------------- WIN i386 with MinGW -----------------

pd_win: $(NAME).dll

.SUFFIXES: .dll

WINCFLAGS = -DPD -DNT -Werror -Wno-unused -mms-bitfields\
	-Wno-parentheses -Wno-switch -O6 -funroll-loops -fomit-frame-pointer\
	-fno-strict-aliasing

LDFLAGS = --export-dynamic -shared	

WININCLUDE =  -I../

.c.dll:
	gcc $(WINCFLAGS) $(WININCLUDE) -c $*.c
	gcc $(LDFLAGS) -o $*.dll $*.o $(PDPATH)/pd.dll 	
	strip --strip-unneeded $*.dll
	rm -f $*.o ../$*.dll
	rm -f $*.o $(BINDEST)/$*.dll
	cp $*.dll $(BINDEST)/$*.dll
	rm -f $*.dll

# ----------------------- LINUX  -----------------------

pd_linux: $(NAME).pd_linux

.SUFFIXES: .pd_linux


LINUXCFLAGS = -DPD -DUNIX -DICECAST -O3 -funroll-loops -fomit-frame-pointer \
    -Wall -W -Wshadow -Wstrict-prototypes -fno-strict-aliasing -Werror\
    -Wno-unused -Wno-parentheses -Wno-switch -fPIC

LINUXINCLUDE =  -I../../src

.c.pd_linux:
	cc $(LINUXCFLAGS) $(LINUXINCLUDE) -o $*.o -c $*.c
	ld --export-dynamic  -shared -o $*.pd_linux $*.o -lc -lm
	strip --strip-unneeded $*.pd_linux
	rm -f $*.o $(BINDEST)/$*.pd_linux
	cp $*.pd_linux $(BINDEST)/$*.pd_linux
	rm -f $*.pd_linux

# ----------------------- Mac OSX ------------------------

pd_darwin: $(NAME).pd_darwin

.SUFFIXES: .pd_darwin

DARWINCFLAGS = -DPD -O2 -Wall -W -Wshadow -Wstrict-prototypes \
    -Wno-unused -Wno-parentheses -Wno-switch

DARWINARCH = -arch ppc7400 -arch i386 -arch x86_64

.c.pd_darwin:
	cc $(DARWINCFLAGS) $(LINUXINCLUDE) $(DARWINARCH) -o $*.o -c $*.c
	cc -bundle -undefined suppress  -flat_namespace $(DARWINARCH) -o $*.pd_darwin $*.o 
	rm -f $*.o $(BINDEST)/$*.pd_darwin
	cp $*.pd_darwin $(BINDEST)/$*.pd_darwin
	rm -f $*.pd_darwin

# ----------------------------------------------------------

clean:
	rm -f *.o *.pd_* so_locations
