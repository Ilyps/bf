#include "bfparser.ih"

void BFParser::run(BFMachine &m) const {
	for (size_t idx = 0; idx < d_command.size(); ++idx) {
		switch (d_command[idx]) {
			case NEXT: m.next(); break;
			case PREV: m.prev(); break;

			case INCR: m.incr(); break;
			case DECR: m.decr(); break;

			case OUTP: std::cout << m.output(); break;
			case INP: char in; std::cin.get(in); m.input(in); break;

			default:
				if ( (int(idx) < d_command[idx] && !m.output()) || 
					 (int(idx) > d_command[idx] && m.output()) )
						idx = d_command[idx];
		}
	}
}