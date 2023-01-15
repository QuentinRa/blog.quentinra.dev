# Visibility

[Go back](../index.md#structures-and-classes)

The visibility is defining **who can access**, what with call members (attributes + methods) of our structure. We got **3 modifiers** of the visibility

* **public** (default for structures): everyone
* **protected**: inheritors, the structure itself
* **private** (default for classes): only the structure itself

It means that **public > protected > private**, if we are sorting them by their exposition of the internal structure to the outside.

> A good practice 📚? **Set everything private**, especially attributes, and make some methods public.

<hr class="sl">

## How?

You will use the syntax `modifier:`, such as `public:` (default). Every member declared after the `:` will be public/... according to the modifier you used.

```cpp
struct my_structure {
public:
    int attribute;
    void my_method() {};
};
```

You can add many times the same modifier if you want to sort things.

```cpp
struct my_structure {
public: // public members
    int attribute;
    void my_method() {};
private: // bunch of private members I
    void my_method1() {};
private: // bunch of private members II
    void my_method2() {};
};
```

<hr class="sl">

## Usage?

```cpp
my_structure object;
// public: ok
object.attribute = 5;
object.my_method();
// private: KO = DO NOT WORK
object.my_method1();
object.my_method2();
```