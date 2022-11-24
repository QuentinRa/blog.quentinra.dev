# Destructor

[Go back](../index.md#structures-and-classes)

A destructor is automatically called when the object is destroyed. A destructor has **the same name as the class, prefixed by a tilde (`~`)**. It takes **no arguments**, and as the constructor, it **does not have a return type**, it's public and does nothing by default.

> **Usage?**: free resources, close resources, update static attributes (explained later).

<hr class="sl">

## Basic Destructor

```cpp
struct my_structure {
public:
    ~my_structure() {
        // some code
    }
};
```

<hr class="sr">

## Default Destructor

You may declare a default destructor with

```cpp
struct my_structure {
public:
	// sort of {}
    ~my_structure() = default;
};
```