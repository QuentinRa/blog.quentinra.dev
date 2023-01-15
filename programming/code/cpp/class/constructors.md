# Constructors

[Go back](../index.md#structures-and-classes)

Constructors are methods **without a return type**, having the **same name as the structure/class**, and **initializing the attributes**.

> **Default constructor**: No parameters. Do nothing. Public. Destroyed if overloaded.

<hr class="sl">

## Calling a constructor

```cpp
Class obj1; // implicit call to the default constructor
Class obj2(); // explicit call to a constructor
Class obj3 = Class(); // explicit call to a constructor
```

<hr class="sr">

## Create a constructor

As the constructor is a method, everything we learned before is applied.

```cpp
struct my_structure {
private:
    float my_float_;
public:
	// inline constructor
    my_structure(float my_float) {
        my_float_ = my_float;
    }
};
```

We got a shortened syntax for this, with `: attribute(value)`. You can add more parameters by separating them with a comma `,`.

```cpp
struct my_structure {
private:
    float my_float_;
public:
	// inline constructor
    my_structure(float f) : my_float_(f) {
        // if needed
    }
};
```

And we could also do

```cpp
struct my_structure {
private:
    float my_float_;
public:
    my_structure(float f);
};


my_structure::my_structure(float f) : my_float_(f) {
	// if needed
}
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