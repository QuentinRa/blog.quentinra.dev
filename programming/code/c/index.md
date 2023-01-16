# C programming

<div class="row row-cols-md-2"><div>

The C programming language is a low-level language which allow us to interact with system calls and the memory directly.

You will create a file with the `.c` extension, for instance, `main.c`

```c
#include<stdio.h>

int main() {
    printf("Hello World\n");
}
```
</div><div>

Then, use `gcc` to generate an executable of your program.

```powershell
$ gcc main.c -o a.out
```

Then, run your executable with

```powershell
$ ./a.out
Hello World
```

➡️ There are a few changes between C89 and C99 such as inline comments (`//`) and variable declarations inside `for` that were added.
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2 mt-3"><div>

#### Declare a variable

```c
int name;
int name = 0;
const int A_CONSTANT = 5;
```

➡️ When creating a variable without a default value, the compiler will automatically give them a default value.

#### Types

<p></p>

➡️ Types are **signed** by default, meaning there are $2^{n-1}$ negative values, $2^{n-1}$ positive values **including** 0 giving us $[2^{n-1}, 2^{n-1}-1]$. Unsigned variables only take positive values: $[0, 2^{n}-1]$.

➡️ For printf, there are formats for signed and unsigned types.

🔥 There is no type `bool/boolean`, so we usually use a `short`/`int`. You can use any value such as `1` for **true**, while `0` means **false**.

```c
char aaa = 'a'; // one character | 8 bits
// printf: %c %hhd %hhi | %%c %hhd %hhu %hhx %hho
short bbb = 42; // a small number | 16 bits
// printf: %hd %hi | %hu %ho %hx %hX
int ccc = 42; // a number | 32 bits
// printf: %d %i | %u %X
// alternatives: 42i (signed) 42U (unsigned)
// alternatives: 0x10 (hexa, %x) 010 (octal, %o)
long ddd = 42; // a big number | 64 bits
// printf: %ld %li | %llu %llo %llx %llX
// alternatives: 42L (signed), 42UL (unsigned)
long long eee = 42; // ...
// printf: %lld %lli
// alternatives: 42LL (signed), 42ULL (unsigned)
float fff = 3.14; // a small real | 32 bits
// printf: %f %e %E %g %a
// alternatives: 3.14f
double ggg = 3.14; // a real | 64 bits
// printf: %lf %le %lE %lg %la
long double hhh = 3.14; // a very big real | 80 bits
// printf: %Lf %Le %LE %Lg %La
```

A string in C is an array of chars. You can use escape codes such as "`\n`" (newline), "`\t`" (tabulation), or "`\`" to escape a character.

```
char* xxx = "Hello World\n";
```

#### Conversions

You can cast a value using `(type)`.

```
int xxx = (int) 'c'; // xxx == 99
```
</div><div>

#### Print some text in the terminal

We use `printf` to print standard output, and `fprintf` to print errors.

```c
#include <stdio.h>
printf("Hello, World\n");
printf("Hello, %s\n", "World");
printf("%s, World\n", "Hello");
printf("%s, %s\n", "Hello", "World");
```

#### Operators

```c
// assignation
int x = 5
x++; // 6, same as x = x + 1
x += 2; // 8, same as x = x + 2
x--; // 7, same as x = x - 1
x -= 3; x *= 3; x /= 4;
// arithmetic
int sum = 5 + 5; // 10
int by = 5 * 5; // 25
int divided = 6 / 5; // 1
// logical
if (5 == 5) {} // true
if (5 != 5) {} // false
if (!0) {} // !0 = 1 = true
if (1 || 0) {} // logical OR, true
if (1 && 0) {} // logical AND, false
if (1 ^ 0) {} // logical XOR, true
```

➡️ There is also an operator `++x` (or `--x`). The difference with the postfix version is that the `++` is done before anything else.

```c
int i = 0;
if (i++ == 1) {} // false, "==" is evaluated before "++"
if (++i == 2) {} // true, "==" is evaluated after "++"
```

#### Macros

`#define` is used to define something that will be replaced by something else. It could be used for constants, but you can basically use it for anything.

```
#define HELLO(n) printf("Hello, %s!\n", n)
#define WHO "World"

int main(void) {
    HELLO(WHO);
}
```

</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching

Usual if/else.

```c
if (1) { }
if (1) { } else {}
if (1) { } else if (0) {} else {}
```

Ternary operator: `condition ? value_if_true : value_if_value`.

```c
char* value = 1 ? "true" : "false";
```

Switch-case <small>(without break, more than one case may be executed)</small>

```c
int variable = 1;
switch(variable){
    case 1: printf("variable=1\n"); break; // here
    case 2: printf("variable=2\n"); break;
    default:
        printf("variable=???\n");
        break;
}
```
</div><div>

#### Loops

In every loop, you can use `break`/`break n` to exit the loop, and you can use `continue` to skip the code, and process to the next iteration.

```c
// usual loop - i in [0, 10[
for (int i = 0; i < 10; ++i) {}
// reverse loop - i in ]0, 10]
for (int i = 10; i > 0; i--) {}
// nested loop
for (int i = 0; i < 5; ++i) {
    for (int j = 0; j < 5; ++j) {}
}
```

```c
while(1) {}; // repeat while true
do {} while(1); // executed at least once
```
</div></div>

<hr class="sep-both">

## The function <code>main</code>

<div class="row row-cols-md-2"><div>

The `main` function is called when executing your program.

```c
int main() {
    // your program here
    return 0;
}
```

The `return 0` is the exit code of your program. `0` mean success, `not 0` means failure. You can use `EXIT_SUCCESS`/`EXIT_FAILURE` instead:

```c
#include <stdlib.h>

int main() {
    return EXIT_SUCCESS; // or EXIT_FAILURE
}
```
</div><div>

You can pass arguments to your program.

```powershell
$ ./a.out "Hello" "World!"
```

Use `argc` to know the number of arguments. `argv` is an array of strings (`char *`). There first argument is the path to your executable.

```c
int main (int argc, char* argv[]) {
    printf("argv[%d]=%s\n", 0, argv[0]); // "./a.out"
    printf("argv[%d]=%s\n", 1, argv[1); // "Hello"
    printf("argv[%d]=%s\n", 2, argv[2); // "World!"
    printf("argc=%d\n", argc); // 3
    return 0;
}
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

A function is a bloc of code that was extracted from the `main` function, mostly to be reused, or to keep things clean.

<div class="row row-cols-md-2"><div>

```c
int square(int v) {
    return v * v;
}
```
</div><div>

```c
int x = square(5);
// x = 25
```
</div></div>

A function must be declared **before** being called. As a good practice is to put the main function at the top of the file, we usually use **signatures/prototypes** to declare the function before the main, then code the function after the main.
</div><div>

```c
int square(int v); // prototype
// 👉 same as: int square(int);

// 👉 the main is the first function we see
int main(void) {
    int x = square(5); // ✅ can call square
    // ...
}

// 👉 and, here are implementations
int square(int v) {
    return v * v;
}
```
</div></div>

<hr class="sep-both">

## Pointer and addresses

<div class="row row-cols-md-2"><div>

Every variable is stored at some location inside the memory. 

When calling a function with some variables, they are passed by value, meaning they are **copied** 🤢, and if the new function edit them, the original with remain unchanged 🚫.

To avoid losing memory because of copies 🔥, or to allow a function to edit a variable passed to it ✨, you can use pointers 🍀.

A **pointer** is a variable holding the address of another variable. 

* ➡️ A pointer has a fixed size in memory
* ➡️ A pointer can read/edit the value of the original variable

**From a variable, to get the address, use `&`**

```c
int *a = NULL; // default value for a pointer
int b = 10;
a = &b; // a can now read/edit b
```

**To access the variable stored inside the pointer, use `*`**

```c
int c = *a; // c = 10
```
</div><div>

To print the address of a variable, use `%p`

```
printf("%p\n", &b); // 0xXXX
printf("%p\n", &(*a)); // same, 0xXXX
```

Without a pointer, `a` is still equals to `0` after `f(a)`.

```c
void f(int a) { a++; }

int main(void) {
    int a = 0;
    f(a);
    printf("%d\n", a); // 0
}
```

With a pointer, the function `f` is now able to edit `a`.

```c
void f(int* a) { (*a)++; }

int main(void) {
    int a = 0;
    f(&a);
    printf("%d\n", a); // 1
}
```
</div></div>

<hr class="sep-both">

## Arrays

<div class="row row-cols-md-2"><div>

An array is a list of values. The first value is at the index `0`.

```c
int a[] = {3, 4}; // length = 2
int a[2] = {3, 4}; // same
// each case will have a default value
// determined by the compiler
int b[2];
int c[2] = {0}; // all cases with have the value 0
int d[5] = {1, 0}; // d[0] = 1, others = 0 

// edit your array
b[0] = 3;
b[1] = 4;
// get the nth-1 value
int first = b[0];
```

To iterate an array, you better know the length

```c
int length = 2;
for (int i = 0; i < length; ++i) {
    printf("a[%d]=%d\n", i, a[i]);
}
// a[0]=3
// a[1]=4
```

You can also use this trick, but it won't work on dynamically allocated arrays. The `sizeof(int)` is for an `int[]`...

```c
int size = sizeof(a) / sizeof(int);
for (int i = 0; i < size; ++i) {
    printf("a[%d]=%d\n", i, a[i]);
}
```
</div><div>

You can create multidimensional arrays by adding another `[]`. The first size is the number of lines, the second is for the columns.

```
int a[l][c];
int a[2][2] = { {1,2}, {3,4}};
// a[0][0] = 1
// a[0][1] = 2
// ...
```

#### Arrays are pointers

To be accurate, an array is a **pointer** to the first case of the array. As all cases are adjacent, we can move to the $nth$ case starting from the first one.

```
int first = *a; // same as a[0]
int first = *(a+0); // same as a[0]
```

#### Dynamic arrays

Usual arrays have a fixed length. You can use `malloc` to create a pointer to an array of `n` elements.

```c
int n = 10;
// 👉 allocate memory
int *a = (int*) malloc(n*sizeof(int));
int *a = (int*) calloc(sizeof(int), n); // 0 in all cases
// code
// 👉 free up the memory
free(a);
```

You can change the size with `realloc`:

```c
n = 20;
a = (int*) realloc(a, n*sizeof(int));
```

🎯 If you have $n$ `malloc`, you must have $n$ `free`.
</div></div>

<hr class="sep-both">

## Structures

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Streams and files

<div class="row row-cols-md-2"><div>

#### stdout, stderr, stdin

A stream is a buffer (array) where we can read/write data from a source. There are 3 known streams that are always open

* `stdin`/`0`: read input from the terminal
* `stdout`/`1`: the standard output of the terminal
* `stderr`/`2`: the error output of the terminal

➡️ All of these are stream of characters.

#### files

To open a stream to a file, use `fopen`. You must close it after use.

```c
FILE* f = NULL;
// open a file
if ((f = fopen("file.txt", "r")) == NULL) {
    /* error, do something */
    return 1;
}

// close
fclose(f);
```

Note that when reading/writing in a file, you are moving a **cursor**. The cursor initial location is determined by the mode used when opening the file.

* `r`: read-only, cursor at the start
* `w`: write-only, clear the file, cursor at the start
* `a`: write-only, cursor at the end

To open a file in multiple modes, add a `+`, such as `r+`, but you must flush the buffer first.

```
fflush(f); // or fseek(f, 0, SEEK_CUR);
```

To move the cursor, you can use

```
long pos = ftell(f); // position of the cursor
fseek(f, 0L, SEEK_CUR); // jump 0 bytes from current
fseek(f, 0L, SEEK_SET); // jump to the start
fseek(f, 0L, SEEK_END); // jump to the end
rewind(f); // jump to the start
// is the cursor at the end? 0=FALSE, 1=TRUE
int eof = feof(f); // EOF = EndOfFile
```
</div><div>

```
int value; // used for examples with scanf/...
char* buffer[11]; // used for examples with a buffer
```

#### Streams of characters

A stream in which what we write/read are characters.

```c
// 👉 stdin (shortcuts)
scanf("%d", &value); // same as printf
// 👉 from any stream (ex: with stdin)
fscanf(stdin, "%d", &value); // same as printf
int value = fgetc(stdin); // read one char, deprecated?
fgets(buffer, 10, stdin); // read n chars + \0
```

```c
// 👉 stdout (shortcuts)
printf("%d", value);
putchar('\n'); // print one character
puts("Hello, World\n"); // print one string
// 👉 from any stream (ex: with stdout)
fprintf(stdout, "%d", value);
fputc('\n', stdout); // same as putchar/putc
fputs("Hello, World\n", stdout); // same as puts
```

#### Streams of bytes

A binary stream.

```c
// read one int from stdin
read(buffer, sizeof(int), 1);
// read one int from stdin
fread(buffer, sizeof(int), 1, stdin);
```

```c
// write 13 (12+\0) characters to stdout
fwrite("Hello, World", sizeof(char), 12+1, stdout);
// same, 1 == stdout
write(1, "Hello, World", (12+1) * sizeof(char));
```
</div></div>

<hr class="sep-both">

## Multiple files, and headers

<div class="row row-cols-md-2"><div>

You can move the declaration of functions/types to another file, called header, such as `main.h`. Other files will only be able to use what you declared inside these.

```c
#ifndef MAIN_H
#define MAIN_H

// your declarations here
int xxx();

#endif
```

In another file, you should use import with `""` to import it.

```c
#include "path/.../main.h"
```
</div><div>

To compile, you must do it in two steps. This step will generated two files: `main.o` and `other.o`.

```ps
$ gcc -c main.c main.h other.c
$ gcc -c  main.c other.c # same
```

Then, you must link your `.o` to generate an executable.

```ps
$ gcc main.o other.o -o a.out
```

➡️ We usually use a **Makefile** to avoid having to type complex commands each time we want to compile the project.
</div></div>

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

#### Random number

```c
#include <stdlib.h>
#include <time.h>

int main(void) {
    srand(time(NULL)); // randomize the generator
    
    int min = 1;
    int max = 5;
    int x = rand() % max + min;
    // x in [min, max]
}
```

<br>

#### math.h

⚠️ You must use `gcc [...] -lm` to compile your file.

```c
#include <math.h>

// round() ceil(), trunc(), fabs(), floor(),
// log(), sqrt(x), pow(x, y), exp(), log10(),
// sin(), cos(), tan(), asin(), acos(), atan(),
// M_E, M_PI

int xxx = pow(10, 3); // 10^3
```
</div><div>

#### Execute a command

<p></p>

```c
// clear the terminal
system("clear");
```

#### string.h

<p></p>

```c
#include <math.h>

// strlen(), strcmp()
// strcpy(), strcat()
// strtol(), strtoul(), strtod()

int five = (int) strtol("5", NULl, 0);
long five = strtol("5", NULl, 10);
double five = strtod("5.0", NULL);

char* str;
long error = strtol("5a", &str, 0);
// "str" == "a" (so str is not empty == error)
```

```c
#include <stdlib.h>
int five = atoi("5");
int error = atoi("xxx"); // 0
long five = atol("5");
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old](_old.md)
* `void*` / `#define NULL = (void *)0`
* C89/C99/C11/C23/[cake](https://github.com/thradams/cake)
* Add notes from exercises
* GDB / [online](https://learn.onlinegdb.com/)
* webassembly

```
printf("%5d", 5); // "     5"
printf("%05d", 5); // "000005"
printf("%0.3f", 1.35); // "1.350"
printf("%.3f", 1.35); // "1.350"
```
</div><div>

* `sizeof` / `%zu` / `sizeof(type) sizeof(*variable)`
* `short int`
* `long long int`
* barrel shift `a >> b` (divide by 2), `a << b` (multiply by 2)
* `&`, `|`
* LinkedLists/...
* labels, and `goto`
</div></div>