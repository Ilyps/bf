#include "bfparser.ih"

BFParser::BFParser(std::string const &str) {
	std::ifstream file(str);
	if (!file) {
		d_program = str;
	}
	else {
		std::string temp;
		while (getline(file, temp))
			d_program += temp + '\n';
	}

	parse();
}