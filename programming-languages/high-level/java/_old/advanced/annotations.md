# Annotations

<hr class="sr">

## New annotations

You can create your own annotations. It's a `@interface` kind of class.

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