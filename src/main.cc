#include <iostream>
#include "bfmachine/bfmachine.h"
#include "bfparser/bfparser.h"

int main(int argc, char **argv) {

	if (argc != 2) {
		std::cerr << "BrainFuck interpreter\n";
		std::cerr << "Usage: \n  " << *argv << " file\n  " 
                  << *argv << " \"brainfuck-string\"\n";
		return 1;
	}

	BFParser parser(argv[1]);
	BFMachine machine;
	parser.run(machine);
}