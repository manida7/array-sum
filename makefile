all:
	as -o sum.o sum.s
	ld -o sum sum.o
