# Static

[Go back](../index.md#structures-and-classes)

Static is a modifier used to make a class member, and not a member of each object. It means that this member is shared between every instance. A static method is called a **function**. **You can't use "this" inside**, and in fact, these are the functions you already know.

<hr class="sl">

## Static in C++

* you can use `static const` or `const static` to **declare static constants**
* **You can use static members inside static functions** 🧐
* **You can use static members inside non-static functions** (methods)
* **You can't use instance members ("this") inside static functions** (=not "this" inside a function)

> You can call static members from an instance like `obj.static_member`, but this is **not** advised. **We are using the class with `::`**.

<hr class="sr">

## Static variables (example)

```cpp
struct manager {
private:
    static int number_of_instances; // static attribute
public:
    // use static in non-static method ok
    manager() { number_of_instances++; }
    ~manager() { number_of_instances--; }

    // static method = function
    static int get_number_of_instances() { return number_of_instances; };
};
// do not forget the type, nor to init static variables
int manager::number_of_instances = 0;
```

Some code

```cpp
manager m1;
manager m2;
manager m3;
// nb=3
int nb = manager::get_number_of_instances();
```

<hr class="sl">

## Static constants (example)

```cpp
struct response {
public:
    static const int HTTP_OK = 200;
    static const int HTTP_NOT_FOUND = 404;

    static bool is_http_ok(int code) { return HTTP_OK == code; }
};

int ok = response::HTTP_OK;
int not_found = response::HTTP_NOT_FOUND;
// call function
bool is_ok = response::is_http_ok(not_found);
```