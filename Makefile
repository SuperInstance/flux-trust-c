CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -O2

all: libtrust.a

libtrust.a: trust.o
	ar rcs $@ $^

trust.o: trust.c trust.h
	$(CC) $(CFLAGS) -c trust.c -o $@

test: test_trust
	./test_trust

test_trust: trust.c test_trust.c trust.h
	$(CC) $(CFLAGS) -o $@ trust.c test_trust.c -lm

clean:
	rm -f *.o *.a test_trust

.PHONY: all test clean
