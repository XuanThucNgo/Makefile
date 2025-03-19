.PHONY: build clean

PATH_OUTPUT := output
PRO_DIR := .

INCLUDE_DIRS := $(PRO_DIR)/include
SRC_DIRS := $(PRO_DIR)/source

#search path .c and .h file
vpath %.c $(SRC_DIRS)
vpath %.o $(INCLUDE_DIRS)

build: main.o sum.o
	gcc output/main.o output/sum.o -o $(PATH_OUTPUT)/app.exe
	./$(PATH_OUTPUT)/app.exe

#main.o: source/main.c include/sum.h
#	gcc -I$(INCLUDE_DIRS) -c $< -o $(PATH_OUTPUT)/$@

#sum.o: source/sum.c include/sum.h
#	gcc -I$(INCLUDE_DIRS) -c $< -o $(PATH_OUTPUT)/$@

%.o : %.c $(INCLUDE_DIRS)
	gcc -c $< -o $(PATH_OUTPUT)/$@ -I$(INCLUDE_DIRS)

clean:
	rm -rf $(PATH_OUTPUT)/*