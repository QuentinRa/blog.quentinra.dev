# Destructor

[Go back](../index.md#structures-and-classes)

A destructor is automatically called when the object is destroyed. A destructor has **the same name as the class, prefixed by a tilde (`~`)**. It takes **no arguments**, and as the constructor, it d**oes not have a return type**.

> **Usage?**: free resources, update static attributes (explained later).

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