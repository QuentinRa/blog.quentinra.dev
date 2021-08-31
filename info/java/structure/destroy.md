# Destroying objects

[Go back](../index.md#vocabulary)

You can't destroy an object by yourself in Java. They introduced something called the **garbage collector** that will look for any unused variable and free them. You can try to accelerate the process by **setting a variable to null**, while making sure that **no one is still referencing your variable** (otherwise, it's pretty useless).

<hr class="sl">

## Finalize

Take note since some are still using it (🙄),  that when an object is destroyed (or about to be destroyed), the method `finalize` will be called on it (each class have this method).

```java
public class Person {
    @Override
    protected void finalize() throws Throwable {
        super.finalize();

        // some code before dying
    }
}
```

But do not use this: it's a **deprecated** (=it will be removed). According to the Javadoc

> The finalization mechanism is inherently problematic. Finalization  can lead to performance issues, deadlocks, and hangs. Errors in finalizers can lead to resource leaks; there is no way to cancel finalization if it is no longer necessary; and no ordering is specified among calls to finalize methods of different objects. Furthermore, there are no guarantees regarding the timing of finalization. The finalize method might be called on a finalizable object only after an indefinite delay, if at all. Classes whose instances hold non-heap resources should provide a method to enable explicit release of those resources, and they should also implement AutoCloseable if appropriate. The ref.Cleaner and ref.PhantomReference provide more flexible and efficient ways to release resources when an object becomes unreachable.