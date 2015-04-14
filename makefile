SDIR=src
IDIR =inc
ODIR=obj
CC=gcc
CFLAGS=-I$(IDIR) -lcrypto

_DEPS = frsa.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = frsa.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	mkdir -p $(@D)
	$(CC) -c -o $@ $< $(CFLAGS)

frsa.out: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -rf $(ODIR)
	rm frsa.out 
