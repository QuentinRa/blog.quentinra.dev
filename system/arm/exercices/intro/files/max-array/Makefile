as -gstabs max.s -o max.o
as -gstabs sprintfd.s -o sprintfd.o
as -gstabs max-array.s -o max-array.o
ld -Oo max-array.o max.o sprintfd.o
./a.out

gcc -c max-array.c
gcc max-array.o max.o
./a.out
