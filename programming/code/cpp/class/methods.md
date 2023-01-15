# Methods

[Go back](../index.md#structures-and-classes)

A method is something that may use the attributes, and do something on the current object.

<hr class="sl">

## Inline methods

An inline method is a method that can be coded in one line. Most of the time, you may put these directly inside the **declaration**, rather than in the **source**.

```cpp
struct my_structure {
private:
    float my_float_ = 5.0;
public:
    float getMyFloat() const { return my_float_; }
};
```

> **This is increasing the size of your structure, so this may not be a good idea**. You may declare methods like below (outside the class), using the keyword `inline` to let the compiler pick whether this method should be inline. **Note that the syntax above is an implicit `inline`, so we are "fine"**.

<hr class="sr">

## Other methods

Most of the time, we will only declare methods in the **header**

```cpp
struct my_structure {
private:
    float my_float_ = 5.0;
public:
    float get_my_float() const;
    void set_my_float( float my_float );
};
```

And inside the **source**

```cpp
float my_structure::get_my_float() const
{
    return my_float_;
}

void my_structure::set_my_float( float my_float )
{
    my_float_ = my_float;
}
```

<hr class="sl">

## Getters and Setters

* Getters (`accesseurs`) are methods that return something. They are usually starting with `get` or `is`. They are usually **not** changing the object.

* Setters (`mutateurs`) are methods that set something. They are usually starting with `set`. They are usually changing the attributes of the object.

<hr class="sr">

## this

As you could see in the function we declared, we could use the attributes of our functions inside `get_my_float` and `set_my_float`. This is because, **in every method of our class** (and only these), we got a pointer `this` on which we can

* call methods of our class
* call attributes of our class

To make things easier for us, it can be omitted, and that's why it was not present until now. With this, your code would look like this

```cpp
float my_structure::get_my_float() const
{
    return this->my_float_;
}

void my_structure::set_my_float( float my_float )
{
    this->my_float_ = my_float;
}
```

> This pointer "this" is simply a reference to the current object, allowing us to check its values for our attributes.

<hr class="sl">

## const

As you could see, a getter was `const`. **We are adding this keyword right after the right parenthesis of the arguments**. We learned before that we could have **const references**. Such a reference can't be modified, so you can only call `const` methods on it. **This is only working for methods inside a structure/class**.

> To be accurate, it means that "this" is a const reference, so we can't modify "this", that's why we are only allowed to call "const" methods.