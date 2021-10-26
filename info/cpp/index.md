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

<hr class="sl">

## Structure

...

<hr class="sr">

## Classes

A class is used like a structure, but its members are **private by default**. In the **header**, you will **declare** a lot of things, and you **may implement inline methods**, while in the **source** file, you will **code everything that was not implemented**.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th><b>Source</b><br> Implementation 🚀</th><th><b>Headers</b><br>Declaration ✨</th></tr></thead>
<tbody>
<tr>
<td>

```cpp
// usually xxx.cpp
#include "xxx.hpp"

// implements constructor(s)

// implements methods

// implements internal operators

// implements external operators
```
</td>
<td>

```cpp
#ifndef XXX_HPP
#define XXX_HPP

class Class_name {
private:
	// attributes
public:
	// constructors, methods
	// internals operators
	// another batch of methods
};

// externals operators

#endif //XXX_HPP
```
</td>
</tr>
</tbody>
</table>

* [Visibility](class/visibility.md)
* [Attributes](class/attributes.md)
* [Methods](class/methods.md)
* [Constructors](class/constructors.md)
* [Operators](class/operators.md)