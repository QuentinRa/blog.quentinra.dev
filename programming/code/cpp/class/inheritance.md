# Inheritance

[Go back](../index.md#structures-and-classes)

## Inheritance in C++ - Liskov principle

In C++, if C is inheriting from A and B, then in memory

* the first part is the (last-1) inherited class: A
* the second part is the last inherited class: B
* the last part is everything new/declared in C

It means that we can still extract the parent from the child class, so we can slide the child and store it inside the parent: that's **Liskov substitution principle**.

```cpp
struct A { float v = 5.0; };
struct B { float v = 7.0; };
struct C : public A, public B { float v = 9.0; };

C c;
A a_from_c = c;
B b_from_c = c;
```

This is useful, because a function working for **A**, will also work for **C**.

> CPP Core guidelines are advising us [to not slice](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines-slicing.html).

<hr class="sr">

## Redefinition / override

As this example is showing, we can call the parent method in the child class, either internally or externally (if public inheritance).

```cpp
struct A { void f() {} };
// we can call super.f() with A::f()
struct B : public A { void f() overrides { A::f(); } };

// we can call f
B b;
b.f();
b.A::f(); // super.f
```

<hr>

### Problem 1

If we are **calling a method of A on B**, and **this method is not present in B**, then **B is** implicitly **cast to A**, and the method is called on A. **If this method is calling another method of A**, **even if you redefined this method in B**, **this is the method in A that will be called**.

```cpp
struct A {
	void f() { g(); }; // calling g
	void g() { std::cout << "A"; }
};
struct B : public A {
	// override g
	void g() { std::cout << "B"; }
};

B b;
b.f(); // "A" 😱
```

To prevent this behavior, you must **declare your methods in the parent class "virtual"** and **override them** in the child class.

```cpp
struct A {
	void f() { g(); }; // calling g
	// now g is virtual
	virtual void g() { std::cout << "A"; }
};
struct B : public A {
	// override g, we added "override"
	void g() override { std::cout << "B"; }
};

B b;
b.f(); // "B" 😎
```

<hr>

### Problem 2

If class D is **inheriting from two classes** B and C, **and both inheriting a class A**, then we will get some **duplicates**. To prevent this, we need to add **virtual before the modifier**, when we are inheriting such a class.

```cpp
struct A { };
// do not duplicate A
struct B : virtual public A { };
struct C : virtual public A { };
// everything is fine, no need to prefix with B:: or C::
struct D : public B, public C { };
```

<hr>

### Problem 3

```cpp
struct A { virtual void print() { std::cout << "A"; } };
struct B : public A { void print() override { std::cout << "B"; } };

A a = B();
a.print(); // "A" 😱
```

While this is working 🙄, so you must use pointers for generics stuff

```cpp
// new and delete are explained later
// we are creating a pointer and it works
A* p_a = new B;
p_a->print(); // "B" 😎
delete p_a;

// if there is no virtual destructor in A
// we should do 'delete (B*) p_a;' 
// (there isn't a virtual destructor here 🙄😱, but fortunately, B isn't allocating something)
```