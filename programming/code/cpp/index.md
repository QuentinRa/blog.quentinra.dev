# C++ programming

<div class="row row-cols-md-2"><div>

The C++ programming language is a middle-level language which is build on top of the [C](/programming/code/c/index.md), with additional features.

You will create a file with the `.cpp` extension, for instance, `main.cpp`

```c
#include <iostream>

int main() {
    std::cout << "Hello World" << std::endl;
}
```

➡️ You can use `.cc` too. For headers, use `.hpp` (see [.h or .hpp](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions)).
</div><div>

Then, use `g++` to generate an executable of your program.

```powershell
$ g++ main.cpp -o a.out
```

Then, run your executable with

```powershell
$ ./a.out
Hello World
```

➡️ The current standard of C++ is C++20, C++23 will be released soon, and some famous versions are C++17, C++11, and C++98.
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2 mt-4"><div>

...
</div><div>

#### References

**Reminder**: in C, parameters of a function are passed by value. We could use pointers to allow a function to edit a variable from the outer scope. In C++, we could use references instead of pointers.

<div class="row row-cols-md-2"><div>

**C** (using a pointer)

```c
void inc(int* v){ (*v)++; }

int a = 0;
int* b = &a;
inc(b); // a == *b == 1
```
</div><div>

**C++** (using a reference)

```cpp
void inc(int& x){ x++; }

int a = 0;
int& b = a;
inc(b); // a == b == 1
```
</div></div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [cpp-cheatsheet](https://github.com/mortennobel/cpp-cheatsheet)
</div><div>

* [old.md](_old.md)
</div></div>