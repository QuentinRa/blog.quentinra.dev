# Prototype Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: when the constructor is doing some extensive stuff, we may not want to call it often. To do so, we can use cloning to create subsequent objects from the first one.

</div><div>

**Advantages** ✅

* Simplify the creation of said objects

**Disadvantages** 🚫

* Cloning may be complex especially for a deep copy

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2 mt-4"><div>

```java
public class BankAccount implements Cloneable {
    public BankAccount(String accountHolder, double balance) {
        // ...
    }

    @Override
    public BankAccount clone() {
        try {
            return (BankAccount) super.clone();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        // Create a prototype BankAccount
        BankAccount prototypeAccount = new BankAccount("John Doe", 1000.0);

        // Create new accounts by cloning the prototype
        BankAccount account1 = prototypeAccount.clone();
        BankAccount account2 = prototypeAccount.clone();
        // ...
    }
}
```
</div><div>

If implementing `Cloneable` isn't working, you can always fallback to the previous way of doing it.

```java
public class BankAccount {
    // ...

    @Override
    public BankAccount clone() {
        BankAccount account = null;
        try {
            Object clone = super.clone();
            if (clone instanceof BankAccount) {
                account = (BankAccount) clone;
                // Set BankAccount-specific parameters
                // ...
            } else {
                throw new CloneNotSupportedException();
            }
        } catch (CloneNotSupportedException e) {
            // fallback
            account = new BankAccount(...);
        }
        return account;
    }
}
```
</div></div>