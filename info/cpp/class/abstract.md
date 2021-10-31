# Abstract classes

An **abstract class**, is a class **partially defined**. It means that in this class, there is **at least one method that we didn't code**, such methods are **called abstract methods**. **An abstract class is not instantiable**, meaning that you can't create variables having this type, or that you can't call constructors of this class. This is useful to make generic stuff while asserting that child classes got some properties.

To define an abstract method, it's easy, use `virtual` and `= 0`.

```cpp
struct Pet { 
	virtual void feed() = 0; // abstract
	virtual ~Pet() = default; // better than {} (empty)
};
struct Fish : public Pet {
    void feed() override { std::cout << "Fish::feed" << std::endl; };
    ~Fish() override = default; // better than {} (empty)
};
struct Dog : public Pet {
    void feed() override { std::cout << "Dog::feed" << std::endl; }
    ~Dog() override = default; // better than {} (empty)
};
```

And we are running some code

```cpp
Pet* p = new Fish();
p->feed(); // Fish::feed
delete p; // free the new

p = new Dog();
p->feed(); // Dog::feed
delete p; // free the new
```