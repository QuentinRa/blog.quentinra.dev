# First java file

[Go back](../index.md#vocabulary)

As usual, we are going to make a program printing "Hello, World!".  Create a file called `Main.java`, and add this code inside

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

Then if you are not using an IDE, after compiling with `javac Main.java`, simply run `java Main` (notice that we write the name of the class, not a file).

> "Hello, World!"

<hr class="sl">

## Some notes

* the name of a class start with an **UpperCase** (ex: Main not main)
* the name of a file like `Name.java` means that the (public) class inside is named `Name`.
* you **must** use the `CamelCase` notation (no spaces: `Accounting table` becomes the class `AccountingTable`)
* Java, like in C with `int main(void)`, will run a method `main`, when you are executing a class.