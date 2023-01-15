# Attributes

[Go back](../index.md#structures-and-classes)

An attribute (`membre de données`) is a variable inside a structure, used to store data. Usually, they are **private**, and we are using **methods** to get/set them. We are also adding a `_` (before, or maybe after the name), because it makes things less wordy later.

```cpp
struct my_structure {
private:
    int attr1_;
    // [C++ feature] you can give a default value 
    float attr2_ = 5.0;
};
```

> **Note**: we are usually using what we call a **constructor**, rather than initializing attributes with a default value.