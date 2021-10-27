# Inheritance

[Go back](../index.md#structures-and-classes)

Inheritance (`héritage`) is allowing us to extends a structure. It means that instead of starting with a structure from scratch, we are now able to pick one or more structures as our starting point.

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

* Constructor are called **from parent to children**

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

