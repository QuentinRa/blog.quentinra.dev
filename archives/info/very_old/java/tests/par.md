# Parametric tests

[Go back](../index.md#tests-with-junit)

A parametric test is a test repeated as long a a stream of data is not depleted. You will create one or more methods returning a stream of data that will be used as the value for our arguments.

```java
// we are in a test class
@ParameterizedTest
@MethodSource({"method_name1", ...})
// or @MethodSource("method_name1")
public void myTest(ArgumentType name){
    // code
}


private static Stream<ArgumentType> method_name1(){
    return ...;
}
```

<hr class="sr">

## Example

```java
@ParameterizedTest
@MethodSource({"test", "test2", "test"})
public void monTest(int p){
    // some code here
    System.out.println(p);
}

private static Stream<Integer> test() {
    ArrayList<Integer> e = new ArrayList<>();
    e.add(5);
    return e.stream();
}

private static Stream<Integer> test2() {
    ArrayList<Integer> e = new ArrayList<>();
    e.add(7);
    e.add(3);
    return e.stream();
}
```

Here the call trace would be

```java
monTest(5) // from test (first value)
monTest(7) // from test2 (first value)
monTest(3) // from test2 (second value)
monTest(5) // from test (first value
```

<hr class="sr">

On JUnit4, here some old notes,

* annotate class `@RunWith(Parameterized.class)`
* the Parameterized class must have a constructor having the method parameters
* a `static` method annotated `@Parameterized.Parameters` returning a Collection (Arrays.asList()) of each object we want to test in the test method