# C++ (cplusplus)

...

> The current standard of C++ is **C++20**, while `C++23` is coming. The previous major versions are `C++98`, `C++11`, and `C++17`.

<hr class="sl">

## Introduction

C++ is an extension of the C language. Everything that you could do in C, is still working in C++, but you got a whole new bunch of features.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th><b>Source</b><br>.cpp 👍 or .cc</th><th><b>Headers</b><br>.hpp 👍 or .h</th></tr></thead>
<tbody>
<tr>
<td>

You will write your code, meaning the **implementation** of what you declared in your headers.

```cpp
// main.cpp
#include "main.hpp"

int main()
{
	// ...
}
```
</td>
<td>

You will write declarations, meaning the signatures of things <small>(functions, classes, structures, ...)</small>. You may write some code too. It seems to be a good idea to use `.hpp` instead of `.h`, [to differentiate C++ headers with C headers](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions).

```cpp
// main.hpp
#ifndef MAIN_HPP
#define MAIN_HPP

// ...

#endif //MAIN_HPP
```
</td>
</tr>
</tbody>
</table>

> To compile your files, you may use `g++` to compile your files, which is working like `gcc` in C.

<hr class="sr">

## Summary of C language

...

<hr class="sl">

## What's new in C++

* Comments with `//` (added in C99+ later)
* Cast with `type(value)` (ex: `int(5.0)`)
* Type `bool`
* `for(int i = ...; ... ; ...)` (added in C99+ later)

<hr class="sr">

## References

A reference is a sort of pointer to a variable. You can modify the reference, which will modify the reference variable, but deleting a reference (ex: `ref = null`) won't destroy the referenced variable. **References** are better than pointer because their size is **constant** (either 32 or 64 bits), so you can actually save memory 🚀.

```cpp
float my_float = 5.0f;
float& ref_my_float = my_float;
ref_my_float = 6.0;
// both are 6.0
```

If needed, you can declare constant reference, which means you do not need another variable that you will reference

```cpp
const float& ref_my_float = 5.0f;
```

A reference can be converted to const, and both can dereferenced.

```cpp
int x = 5;
int& y = x; // value to reference
const int& z = y; // ref to const ref
int a = y; // ref to int
int b = z; // const ref to int
y++; // x=y=6 and a=b=5
```

<hr class="sl">

## Functions

A function is a bloc of code.

<details class="details-e">
<summary>Default values</summary>

We can give **default values** to parameters. If a parameter got a default value, then every following parameter must have a default value

```cpp
void abc(int a, int b=1, float c=2.0f) { /* ... */ }
```

> **Default values** are only given in the declaration (header), and **not** in the implementation (source). This is do not take into account functions that are not in a header.

</details>

<details class="details-e">
<summary>Overload</summary>

We can **overload** (`surcharger`) a function, meaning that we can write functions with the same name but ...

```cpp
// return type do not matter
// parameters names do not matter
void f(int a, int b) { /* ... */ }
// we can have more/fewer arguments : no problems
void f(int a, int b, int c) { /* ... */ }
// if we got the same number of arguments
// types must be different
void f(int a, float b) { /* ... */ }
// ok but we can't call f(int,int,int) because
// we don't know which function it is
void f(int a, int b, int c, int d = 0) { /* ... */ }
```
</details>

<details class="details-e">
<summary>References</summary>

```cpp
void f(int& f) {}
void f(const int& f) {}
int& f(int& f) {}
const int& f(int& f) {}
const int& f(const int& f) {}
```

</details>