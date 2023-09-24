# Builder Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: the builder pattern is supposed to simplify the process of creating complex objects. We usually have a `builder` on which we call multiple methods to configure it. Once we are done, we call `build()` and it will create a new object and configure it.

</div><div>

**Advantages** ✅

* Lessen the complexity of the code
* More modular and reusable code

**Disadvantages** 🚫

* More code to write

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2"><div>

It's often a static class inside the target class that will help us build the instances we want. It's often a chain of calls ending with `build()`.

```java
public class Main {
    public static void main(String[] args) {
        Employee employee = new Employee.Builder("John Doe")
                .age(30)
                .address("123 Main St")
                .salary(30123)
                .build();
        // ...
    }
}
```

```java
public class Employee {
    private int age;
    // ...
    private Employee(String name) {
        // ...
    }
    // ...

    public static class Builder {
        private final Employee employee;

        public Builder(String name) {
            this.employee = new Employee(name);
        }

        public Builder age(int age) {
            this.employee.age = age;
            return this;
        }

        public Employee build() {
            return employee;
        }
    }
}
```
</div><div>

Everyone needs or implementations may be different. For instance, we often call the constructor when the user calls `build()` as follows:

```java
public class Employee {
    private int age;
    // ...
    private Employee(String name) {
        // ...
    }
    // ...

    public static class Builder {
        private String name;
        private int age;

        public Builder(String name) {
            this.name = name;
        }

        public Builder age(int age) {
            this.age = age;
            return this;
        }

        public Employee build() {
            Employee employee = new Employee(name);
            employee.age = this.age;
            // ...
            return employee;
        }
    }
}

```
</div></div>