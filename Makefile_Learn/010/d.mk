.PHONY: build clean

PATH_OUTPUT := output
PRO_DIR := .

INCLUDE_DIRS := $(PRO_DIR)/include
INCLUDE_DIRS += $(PRO_DIR)/include/abc
SRC_DIRS := $(PRO_DIR)/source

SRC_FILES 		:= $(wildcard $(SRC_DIRS)/*.c)
INCLUDE_FILES := $(wildcard $(INCLUDE_DIRS)/*.h)

SRC_FILES			:= $(foreach SRC_DIRS, $(SRC_DIRS), $(wildcard $(SRC_DIRS)/*.c))

#Duyệt từng cái như for
INCLUDE_FILES	:= $(foreach INCLUDE_DIRS, $(INCLUDE_DIRS), $(wildcard $(INCLUDE_DIRS)/*.h))

OBJ_FILES := $(notdir $(SRC_FILES))
OBJ_FILES := $(subst .c,.o, $(OBJ_FILES))
PATH_OBJS := $(foreach OBJ_FILES, $(OBJ_FILES), $(PATH_OUTPUT)/$(OBJ_FILES))

#search path .c and .h file
vpath %.c $(SRC_DIRS)
vpath %.o $(INCLUDE_DIRS)

#build: main.o sum.o
#	gcc output/main.o output/sum.o -o $(PATH_OUTPUT)/app.exe
#	./$(PATH_OUTPUT)/app.exe

build: $(OBJ_FILES)
	gcc $(PATH_OBJS) -o $(PATH_OUTPUT)/app.exe
	./$(PATH_OUTPUT)/app.exe

%.o : %.c $(INCLUDE_DIRS)
	gcc -c $< -o $(PATH_OUTPUT)/$@ -I$(INCLUDE_DIRS)

clean:
	rm -rf $(PATH_OUTPUT)/*

log-%:
	@echo $($(subst log-,,$@))