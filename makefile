SDIR=src
IDIR =inc
ODIR=obj
CC=gcc
CFLAGS=-I$(IDIR) -lm

_DEPS = frsa.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = frsa.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
		$(CC) -c -o $@ $< $(CFLAGS)

frsa: $(OBJ)
		gcc -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
		rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
