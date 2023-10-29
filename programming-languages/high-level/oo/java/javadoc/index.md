# Javadoc

<div class="row row-cols-lg-2"><div>

The Javadoc is **java documentation engine** ✍️. Developers will write Javadoc comments inside their code, and using the `javadoc` command, a website will be generated 🌍.

Aside from versions before 11, you can change the number in the URL to access the Javadoc for another version of Java at:

* [Java 8](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) <small>(previous LTS)</small>
* [Java 11](https://docs.oracle.com/en/java/javase/11/docs/api/index.html) <small>(previous LTS)</small>
* [Java 17](https://docs.oracle.com/en/java/javase/17/docs/api/index.html) <small>(LTS)</small>
* [Java 20](https://docs.oracle.com/en/java/javase/20/docs/api/index.html) <small>(latest)</small>

</div><div>

❌ Don't write meaningless documentation.

* the type of an argument for primitive types <small>(for objects, it's ~OK)</small>
* a trivial getter/setter/constructor

✅ Write useful stuff such as:

* ranges, intervals, preconditions <small>(not null...)</small>
* exceptions
* post-conditions <small>(null->null, not null->not null...)</small>
* examples of calling a class/method/...
* ...
</div></div>

<hr class="sep-both">

## Writing Javadoc

<div class="row row-cols-lg-2"><div>

Javadoc comments are comments starting with `/**`.

```java
/**
 * Class description
 *
 * @author author
 * @version 0.0.0.1 09 November 2019
 * @see AnotherClassYouMustCheck
 * @see AnotherClassYouMustCheck#aMethodName
 */
public class AClass {

    /**
     * Method description
     *
     * @param a description
     * @param b description
     *
     * @return description
     *
     * @throws UnsupportedOperationException description
     * @see UnsupportedOperationException
     * @see #aDeprecatedMethod()
     *
     * @since 0.0.0.1
     */
    public ATypeHere methodName(int a, float b) {
        // code
    }

    /** @deprecated no reason */
    public void aDeprecatedMethod(){ /* ... */ }

}
```
</div><div>

**Explanations** ✍️

Most elements are not present in every Javadoc comment, albeit you may see some warnings if according to the context, one is missing.

* `@author author`: can have multiple authors tags or a list of authors

* `@version version`: for instance, `1.0.0.0 xxxx-xx-xx`

* `@since version`: since which version this was added

* `@see xxx`: a class or a method the reader should check too
    * `@see class`
    * `@see class#method`<br><span>&nbsp;</span>

* `@deprecated why`: why we should not use it

* `{@link xxxx}`: inside a param, a return, or some text, you can use this to create a link to a class/method.

* `@param name desc`: describe a param
* `@return desc`: describe what the method returns
* `@throws exception_class desc`: if an exception is thrown

To comment on a generic class/method parameter, use `@param` too:

```java
/**
 * ...
 * @param <T> description
 */
public class GenericClass<T> {}
```
</div></div>

<hr class="sep-both">

## package-info.java

<div class="row row-cols-lg-2"><div>

A `package-info.java` is a file used to document a [package](../_general/index.md#packages).

```java
/**
* Some Javadoc here
*
* @author xxx
* @version yyy
*/
package com.lgs.memorize;
```
</div><div>
</div></div>