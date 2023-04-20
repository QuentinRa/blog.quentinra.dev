# Annotations

[Go back](../../index.md#advanced)

You should already know at least `@Override` annotation. They are used to send messages to the programmers or explicitly confirm that the program really wanted to do something and that he isn't making a mistake.

* `@FunctionalInterface`: this interface is supposed to a be FunctionalInterface
* `@Deprecated`: class/method is supposed to not be used anymore.
* `@Override`: overriding a method
  
Some annotations that are not in the JDK but may be used by others

* `@Nullable`: a parameters can be null
* `@NotNull`: a parameters can't be null
* `@Contract`: a method is pure (no side-effect)

<hr class="sl">

## SuppressWarnings

You must know this `@SuppressWarnings(...)` annotation. The compiler may raise warnings if he thinks you did something wrong. You can suppress them using this annotation.

* `@SuppressWarnings("deprecation")`: remove deprecation warning
* `@SuppressWarnings("unchecked")`: unchecked casting warning
* `@SuppressWarnings("MethodDoesntCallSuperMethod")`: you didn't call super method
* `@SuppressWarnings("SameParameterValue")`: non public method is always given the same parameters warning.

<hr class="sr">

## New annotations

You can create your own annotations. It's a `@interface` kind of class.

```java
@Retention(...)
@Target(...)
public @interface name {
}
```

You can even add arguments like this

```java
@Retention(...)
@Target(...)
public @interface nomAnnotation {
    String field1() default "";
    float field2();
}

// only field2 is required
@nomAnnotation(field2=1);
```

* Retention
    * `RetentionPolicy.SOURCE`: ???
    * `RetentionPolicy.CLASS`: checked by the compiler
    * `RetentionPolicy.RUNTIME`: check that the annotation is still valid during runtime
* Target : where I can use this annotation
    * `ElementType.METHOD`
    * `ElementType.FIELD`
    * `ElementType.PARAMETER`
    * `ElementType.LOCAL_VARIABLE`
    * `ElementType.TYPE_USE`
    * you can give a lot of values using `{a,b,...}` syntax

You can annotates a `@interface` with

* `@Documented`: ???
* `@Inherited`: ???