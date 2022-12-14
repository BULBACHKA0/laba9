# Makefile 8_laba
INST_DIR = $$HOME/8_laba/


export ARCH=x86_64
export CROSS_COMPLITE=x86_64-linux-

all:main.c list.c matrix.c
	$(CROOS_COMPLITE)gcc -c list.c matrix.o
	$(CROOS_COMPLITE)ar -r static.a list.o matrix.o
	$(CROOS_COMPLITE)gcc -fpic -c list.c matrix.с
	$(CROOS_COMPLITE)gcc -shared list.o matrix.o -o dynamic.so
	$(CROOS_COMPLITE)gcc main.c list.c matrix.c -lm -o app.out
	echo $(ARCH)
	echo $(CROOS_COMPLITE)

install: all
	@if [-d $(INST_DIR) ]; \
	then \
	cp app.out $(INST_DIR); \ 
	echo "Программа установлена в $(INST_DIR)"; \
	else \
 	echo "$(INST_DIR) не найден!"; \
fi

static: list.c matrix.c
	$(CROOS_COMPLITE)gcc -c list.c matrix.c
	ar -r static.a list.o matrix.o

dynamic: list.c matrix.c
	$(CROOS_COMPLITE)gcc -fpic -c list.c matrix.c
	$(CROOS_COMPLITE)gcc -shared list.o matrix.o -o dynamic.so


clean:
	rm -f list.o matrix.o main.o
