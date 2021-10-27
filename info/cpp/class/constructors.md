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

## Code a constructor

As the constructor is a method, everything we learnt before is applied.

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