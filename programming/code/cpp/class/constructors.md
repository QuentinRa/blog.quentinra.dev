# Constructors

[Go back](../index.md#structures-and-classes)

<hr class="sr">

## Create a constructor

Inline constructor. Opposite of:

```cpp
xxx::xxx(float v) : xxx(v) {}
```

<hr class="sr">

## Copy constructor

This is a constructor, taking one argument having the type of structure/class. The **default copy constructor** is copying every attribute, using their copy constructor.

```cpp
struct my_structure {
    float my_float_;
public:
    my_structure(float f) : my_float_(f) {};

    // that's unneeded here, as this is what the default copy constructor is doing
    my_structure(const my_structure& s) : my_float_(s.my_float_) {}
    // same as my_structure(const my_structure& s) = default;
};
```

As the copy constructor is the default copy constructor, we could write `my_structure(const my_structure& s) = default;`

```cpp
my_structure object0(3.0);
// each is calling the copy constructor
my_structure object1 = object0; // ONLY WHEN the left-side is a declaration
my_structure object2(object0);
my_structure object3 = my_structure(object0);
// this function will trigger the copy constructor
void test(my_structure ms);
// while this ones won't
void test(my_structure& t);
void test(const my_structure& t);
```