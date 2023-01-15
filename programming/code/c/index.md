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

Format: `description | format in printf | bits`.

```c
char aaa = 'a'; // one character | %c %hhd %hhi | 8
// 👉 unsigned | 'a' | %c %hhd %hhu %hhx %hho
short bbb = 42; // a small number | %hd %hi | 16
// 👉 unsigned | 42 | %hu %ho %hx %hX
int ccc = 42; // a number | %d %i | 32
int ddd = 42i;
// 👉 unsigned | 42U | %u %X
long eee = 42; // a big number | %ld %li | 64
long fff = 42L;
// 👉 unsigned | 42UL | %llu %llo %llx %llX
long long ggg = 42; // ... | %lld %lli | ...
long long hhh = 42ULL;
float kkk = 3.14; // a real | %f %e %E %g %a | 32
float lll = 3.14f;
double mmm = 3.14; // a big real | %lf %le %lE %lg %la | 64
long double nnn = 3.14; // a very big real | %Lf %Le %LE %Lg %La | 80
```

➡️ Types are signed by default, meaning there are $2^{n-1}$ negative values, $2^{n-1}$ positive values **including** 0 giving us $[2^{n-1}, 2^{n-1}-1]$. Unsigned variables only take positive values: $[0, 2^{n}-1]$.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old](_old.md)
</div><div>

* `short int`
* `long long int`
</div></div>