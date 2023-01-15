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

#### Conversions

You can cast a value using `(type)`.

```
int xxx = (int) 'c'; // xxx == 99
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
</div></div>