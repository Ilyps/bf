### Makefile created by GSMake 1.0 at 02-02-2013 01:00.
### Last updated at 24-05-2013 08:56.

### CONFIGURE - EDIT TO PREFERENCE

# Compiler, flags and include directories (-I)
CC    := g++
CCFL  := -Wall -std=c++11 -O3
INC   := 

# Linker, flags and external libraries (-l) 
CCLD  := $(CC)
CCLDF := 
LIB   := 

# Executable name, source dir and compile dir
EXEC  := main
SRC   := src
BIN   := bin

# Colours used in messages
C_DEFAULT := \033[m
C_CORRECT := \033[0;32m
C_FTERROR := \033[0;31m
C_WARNING := \033[0;33m
C_MESSAGE := \033[0;34m

# Toggle fancy printing (colours and formatting) [true/false]
FANCY = false

### CANNED RECIPIES FOR COMPILING AND LINKING - EDIT TO PREFERENCE

# Recipe for compiling
ifeq ($(FANCY),true)
define compile
	@echo -en "$(C_MESSAGE)----- [$(N)/$(words $(OBJ))] $< ----- $(C_DEFAULT)"
	@$(CC) -c $(CCFL) $(INC) $< -o $@ 2> .temp.log || touch .temp.err
	$(result_eval)
endef
else
define compile
	@echo -n "[$(N)/$(words $(OBJ))] "
	$(CC) -c $(CCFL) $(INC) $< -o $@
endef
endif

# Recipe for linking
ifeq ($(FANCY),true)
define link
	@echo -ne "$(C_MESSAGE)----- LINKING ----- $(C_DEFAULT)"
	@$(CCLD) $(CCLDF) $(OBJ) -o $(EXEC) $(LIB) 2> .temp.log || touch .temp.err
	$(result_eval)
endef
else
define link
	@echo -n "[LINKING] "
	$(CCLD) $(CCLDF) $(OBJ) -o $(EXEC) $(LIB)
endef
endif

# Recipe for result evaluation, used for fancy printing
define result_eval
	@if test -e .temp.err; then echo -e "$(C_FTERROR)[ERR]"; elif test -s .temp.log; then echo -e "$(C_WARNING)[WARN]"; else echo -e "$(C_CORRECT)[OK]"; fi;
	@cat .temp.log && echo -en "$(C_DEFAULT)"
	@if test -e .temp.err; then rm -f .temp.log .temp.err && false; fi;
	@rm -f .temp.log
endef

### DO NOT CHANGE ANYTHING FROM THIS POINT ON, INCLUDING THIS LINE AND OTHER COMMENTS

### RULES FOR TRANSFORMING COMPILER ARGUMENTS

# Adding -I to $(INC)
INC := $(patsubst %,-I%,$(INC))

# Adding -l to $(LIB)
LIB := $(patsubst %,-l%,$(LIB))

### OBJECT FILE DATA

# Object files
OBJ   := $(BIN)/bfparser/constr_default.o $(BIN)/bfparser/parse.o $(BIN)/bfparser/run.o $(BIN)/main.o

### PHONY RULES

.PHONY	: all clean createbin

# Main goal
all : createbin $(OBJ)
	$(link)

# Clean executable and object file directories
clean :
	rm -fr $(EXEC) $(EXEC).exe $(BIN)

# Create object file directories
createbin :
	@mkdir -p $(sort $(dir $(OBJ)))

### OBJECT FILE RECIPIES FOR COMPILING

$(BIN)/bfparser/constr_default.o : $(SRC)/bfparser/constr_default.cc $(SRC)/bfmachine/bfmachine.h $(SRC)/bfparser/bfparser.h $(SRC)/bfparser/bfparser.ih
	$(eval N := 1)
	$(compile)

$(BIN)/bfparser/parse.o : $(SRC)/bfparser/parse.cc $(SRC)/bfmachine/bfmachine.h $(SRC)/bfparser/bfparser.h $(SRC)/bfparser/bfparser.ih
	$(eval N := 2)
	$(compile)

$(BIN)/bfparser/run.o : $(SRC)/bfparser/run.cc $(SRC)/bfmachine/bfmachine.h $(SRC)/bfparser/bfparser.h $(SRC)/bfparser/bfparser.ih
	$(eval N := 3)
	$(compile)

$(BIN)/main.o : $(SRC)/main.cc $(SRC)/bfmachine/bfmachine.h $(SRC)/bfparser/bfparser.h
	$(eval N := 4)
	$(compile)

