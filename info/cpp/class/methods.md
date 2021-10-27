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

> **This is increasing the size of your structure, so this may not be a good idea**. You may declare methods like below (outside the class), using the keyword `inline` to let the compiler pick whether or not this method should be inline. **Note that the syntax above is an implicit `inline`, so we are "fine"**.

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