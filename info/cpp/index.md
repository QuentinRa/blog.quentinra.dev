# C++

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
#include "main.h"

int main(void)
{
	// ...
}
```
</td>
<td>

You will write declarations, meaning the signatures of things <small>(functions, classes, structures, ...)</small>. You may write some code too. It seems to be a good idea to use `.hpp` instead of `.h`, [to differentiate C++ headers with C headers](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions).

```cpp
#ifndef MAIN_H
#define MAIN_H

// ...

#endif //MAIN_H
```
</td>
</tr>
</tbody>
</table>

> To compile your files, you may use `g++` to compile your files, which is working like `gcc` in C.