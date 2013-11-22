numbers : *.o
	g++ -o numbers *.o

*.o : *.cc
	g++ -std=c++11 -Wall -pedantic -c *.cc
