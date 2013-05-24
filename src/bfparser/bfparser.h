#ifndef INCL_BFPARSER_H
#define INCL_BFPARSER_H

#include <string>
#include <vector>

class BFMachine;

class BFParser {

	enum Commands {
		NEXT = -1, PREV = -2, INCR = -3, DECR = -4, INP = -5, OUTP = -6
	};

	std::string d_program;
	std::vector<int> d_command;

	public:
		BFParser(std::string const &);
		void run(BFMachine &) const;

	private:
		void parse();
};

#endif