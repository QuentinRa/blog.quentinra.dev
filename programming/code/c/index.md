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

```c
char aaa = 'a'; // one character | 8 bits
// printf: %c %hhd %hhi | %%c %hhd %hhu %hhx %hho
short bbb = 42; // a small number | 16 bits
// printf: %hd %hi | %hu %ho %hx %hX
int ccc = 42; // a number | 32 bits
// printf: %d %i | %u %X
// alternatives: 42i (signed) 42U (unsigned)
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
</div><div>

A string in C is an array of chars. You can use escape codes such as "`\n`" (newline), "`\t`" (tabulation), or "`\`" to escape a character.

```
char* xxx = "Hello World\n";
```

<p></p>

#### Conversions

You can cast a value using `(type)`.

```
int xxx = (int) 'c'; // xxx == 99
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

</div></div>

<hr class="sep-both">

## Structures

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old](_old.md)
* `void*` / `#define NULL = (void *)0`
* MACROS
</div><div>

* `short int`
* `long long int`
* barrel shift `a >> b` (divide by 2), `a << b` (multiply by 2)
* `&`, `|`
</div></div>