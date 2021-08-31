# First java file

[Go back](../index.md#vocabulary)

We are going to print "Hello, World!". But first **note** this

* the name of a class start with an **UpperCase**
* the name of a file like `Name.java` means that the (public) class inside is named `Name`.
* you **must** use the `CamelCase` notation (no spaces, use an upper case: `Accounting table` becomes the class `AccountingTable`)

So we will create a class `Main` (and the file name **must** be according to above **Main.java**).

```java
public class Main {
}
```

Everything will be explained later. Java, like in C with `int main(void)`, will run a method `main`. 

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

Then if you are not using an IDE, after compiling with `javac Main.java`, simply run `java Main` (notice that we write the name of the class, not a file).

> "Hello, World!"