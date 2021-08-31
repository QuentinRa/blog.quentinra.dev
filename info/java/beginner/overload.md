# Overload

[Go back](../index.md#beginner)

The overload or surcharge in French is the ability for us to write a lot of methods having the same name but different parameters (=redefinitions).

The return type must be the same!

```java
class PersonFactory {
    public Person createPerson(){ return null; }
    public Person createPerson(String name){ return null; }
    public Person createPerson(String name, int age){ return null; }
    public Person createPerson(int age, String name){ return null; }
}
```

Note that the name of the variable are not read when the compiler is checking if you declared two times the same function, **so you can't write**

```java
public Person createPerson(int a, String b){ return null; }
public Person createPerson(int c, String b){ return null; }
```