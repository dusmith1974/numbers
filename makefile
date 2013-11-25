numbers : *.o projects/project_1/*.o
	g++ -o numbers *.o projects/project_1/*.o

*.o : *.cc
	g++ -std=c++11 -Wall -pedantic -c *.cc 2>&1 |tee output.log

.PHONY: clean
clean :
	rm numbers *.o output.log

