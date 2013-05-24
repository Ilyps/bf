#ifndef INCL_BFMACHINE_H
#define INCL_BFMACHINE_H

#include <unordered_map>

class BFMachine {

	int d_pointer;
	std::unordered_map<int, char> d_memory;

	public:
		BFMachine() : d_pointer(0) {};

		void next() {
			++d_pointer;
		};
		void prev() {
			--d_pointer;
		};

		void incr() {
			++d_memory[d_pointer];
		};
		void decr() {
			--d_memory[d_pointer];
		};

		char output() const;
		void input(char in) { d_memory[d_pointer] = in; };
};

inline char BFMachine::output() const {
    // return d_memory[d_pointer] wont do, because
    // then the method cannot be const
    auto it = d_memory.find(d_pointer);
    if (it == d_memory.end())
        return 0;
    return it->second;
}
    

#endif