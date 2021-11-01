# Inheritance

[Go back](../index.md#structures-and-classes)

Inheritance (`héritage`) is allowing us to extend a structure. It means that instead of starting with a structure from scratch, we are now able to pick one or more structures as our starting point.

If your class B is inheriting from A, then we call

* `A` : **parent** class (`class mère`), **superclass** (`super-classe`), **base** class (`classe de base`)
* `B` : **child/heir** class (`classe fille`), **subclass** (`sous-classe`), **derived** class (`classe dérivée`)

<hr class="sl">

## Inheritance in C++

We got `public`, `protected`, and `private` inheritance.

* `public`: no changes
* `protected`: **public** methods from the parent are now **protected**
* `private`: **public, protected** methods from the parent are now **private**

The syntax is `child : modifier parent` or `child : modifier_1 parent_1, ..., modifier_n parent_n`.

> **If the modifier is omitted**, then
> * it's **public** for structures
> * it's **private** for classes

<hr class="sr">

## Example

```cpp
struct A {
public:
    float attr_a = 5.0;
};
struct B : public A {
public:
    float attr_b = 7.0;
};

B b;
float va = b.attr_a; // from A
float vb = b.attr_b;
```

Notes

* If we used `protected A`, then in B `attr_a` would be protected
* If we used `private A`, then in B `attr_a` would be private

<hr class="sr">

## Inheritance : Constructors & Destructors

* Constructors are called **from parent to children**

```cpp
struct Parent {
public:
    Parent() {};
    // ~same as Parent() = default;
};
struct Child : public Parent {
public:
    // simply call the parent constructor Parent()
    Child() : Parent() {};
};
```

* Destructors are called **from children to parent** 🔄

<hr class="sl">

## Inheritance in C++ - Liskov principle

In C++, if C is inheriting from A and B, then in memory

* the first part is the (last-1) inherited class: A
* the second part is the last inherited class: B
* the last part is everything new/declared in C

It means that we can still extract the parent from the child class, so we can slide the child and store it inside the parent: that's **Liskov substitution principle**.

```cpp
struct A { float attr_a = 5.0; };
struct B { float attr_b = 7.0; };
struct C : public A, public B { float attr_c = 9.0; };

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