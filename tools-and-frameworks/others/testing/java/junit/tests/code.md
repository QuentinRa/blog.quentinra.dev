# Write some tests

[Go back](../../../../../../programming-languages/high-level/java/_old/index.md#tests-with-junit)

You will create a java usually named `TestXXXX.java`. Then you write some methods, add `@Test` if it's a test. It would look something like that.

```java
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

// you can use Assertions.assertTrue(...)
// and not this static import, but that's up to you!
import static org.junit.jupiter.api.Assertions.assertTrue;

// test SomeClass method
public class TestSomeClass {

    @Test
    @DisplayName("SomeClass()")
    public void testConstructor(){
        // some stupid test    
        assertTrue(true);
    }
}
```

Your test is passed if all you assert are true. You should ensure that the code is working when you give right or wrong parameters are given.

<div class="sl"></div>

## Some notes

If a whole test should raise an exception, you can use `@Test( expected = ClasseException.class )`.

If you want to test a maximum duration for a method, then use `@Test( timeout = value )`.

You may use `fail()` in a try-catch like opening a file may raise an exception, and you are unlucky and the open failed (so put it in the catch).

If you don't make any assertions in a @Test method, then in most cases, the test is considered a failure.

Every assert method has an argument usually called `message` to send with the Exception a pertinent error message.

You can annotate a method with

* `@Disabled`: don't run this test
* `@DisplayName("name")`: name of the test run