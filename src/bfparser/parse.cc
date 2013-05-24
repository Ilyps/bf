#include "bfparser.ih"

void BFParser::parse() {

	std::vector<size_t> open_tags;
	std::vector<size_t> close_tags;

	for (size_t idx = 0; idx < d_program.size(); ++idx) {
		switch (d_program[idx]) {

			case '>':
				d_command.push_back(NEXT);
				break;

			case '<':
				d_command.push_back(PREV);
				break;

			case '+':
				d_command.push_back(INCR);
				break;

			case '-':
				d_command.push_back(DECR);
				break;

			case '.':
				d_command.push_back(OUTP);
				break;

			case ',':
				d_command.push_back(INP);
				break;

			case '[':
				open_tags.push_back(d_command.size());
				d_command.push_back(0);
				break;

			case ']':
				close_tags.push_back(d_command.size());
				d_command.push_back(0);
				break;
		}
	}

	if (close_tags.size() < open_tags.size()) {
		std::cerr << "Parse error: Missing close ']' character(s).\n";
		d_command.clear();
		return;
	}
	else if (close_tags.size() > open_tags.size()) {
		std::cerr << "Parse error: Missing open '[' character(s).\n";
		d_command.clear();
		return;
	}

	while (!open_tags.empty()) {
		size_t open_idx = 0;

		while (open_tags[open_idx] < close_tags[0]) {
			if (++open_idx == open_tags.size()) {
				break;
			}
		}
		--open_idx;

		if (open_tags[open_idx] > close_tags[0]) {
			std::cerr << "Parse error: Isolated close character ']'.\n";
			d_command.clear();
			return;
		}

		d_command[open_tags[open_idx]] = close_tags[0];
		d_command[close_tags[0]] = open_tags[open_idx];
		open_tags.erase(open_tags.begin() + open_idx);
		close_tags.erase(close_tags.begin());
	}
}