# Static

[Go back](../index.md#structures-and-classes)

Static is a modifier used to make a class member, and not a member of each object. It means that this member is shared between every instance. A static method is called a **function**. **You can't use "this" inside**, and in fact, this is the functions you already know.

<hr class="sl">

## Static in C++

* you can use `static const` or `const static` to **declare static constants**
* you can declare **static functions**
  * you can use static members inside
  * you can't use "this" or instance members inside
* **You can use static members inside non-static functions**

```cpp
struct response {
public:
    static const int HTTP_OK = 200;
    static const int HTTP_NOT_FOUND = 404;

    // can be used in a function
    static bool is_http_ok(int code) { return HTTP_OK == code; }
};

// can be used outside the class
int ok = response::HTTP_OK;
int not_found = response::HTTP_NOT_FOUND;
// call function
bool is_ok = response::is_http_ok(not_found);
```

> You can call static members from an instance like `obj.static_member`, but this is **not** advised.