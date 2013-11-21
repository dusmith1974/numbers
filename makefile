;hw : hw.o
;	g++ -o hw hw.o

;hw.o : hw.cc
;	g++ -std=c++11 -Wall -pedantic -c hw.cc

numbers : *.o
	g++ -o numbers *.o

*.o : *.cc
	g++ -std=c++11 -Wall -pedantic -c *.cc
