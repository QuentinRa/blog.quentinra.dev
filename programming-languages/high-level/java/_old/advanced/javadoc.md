# Javadoc

[Go back](../index.md#advanced)

The idea is the same as for doxygen (tools/doxygen course) but only for Java. Using `javadoc` command, you will generates a website like this one [javadoc index](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) And something like that for a class [javadoc Boolean](https://docs.oracle.com/javase/8/docs/api/java/lang/Boolean.html).

A Javadoc comment is a comment looks like that

```java
/**
* A desc
* 
* @sometag some parameters
*/
```

<hr class="sr">

## Tags

The class only tags are 

* `@author author`: can have multiple authors tags or a list of authors
* `@version version date`: something like `1.0.0.0 xxxx-xx-xx`

Tags you may use everywhere

* `@since version`: since which version you added this class/method/...
* `@see xxxx`: a class or a method the reader should check
    * `@see class`
    * `@see class#method`
    * can have multiples see
* `@deprecated why`: why we should not use this class/method and since when. You may add a link to the new method.
* `{@link xxxx}`: inside a param, returns, or some text, you can use this to create a link to a class/method.
    
And for a method you might use

* `@param name desc`: describe a param
* `@return desc`: describe what's the method returns
* `@throws exception_class desc`: if an exception is thrown

Note that you can add multiples of param and throws. Note that if the class is generic or a method is generic, you can comment the param using this syntax

<hr class="sl">

## Example

```java
/**
 * Class desc
 *
 * @author auteur
 * @version 0.0.0.1 09 november 2019
 * @see AnotherClassYouMustCheck
 * @see AnotherClassYouMustCheck#aMethodName
 */
public class Classe{

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

    @Deprecated
    public void aDeprecatedMethod(){ /* ... */ }

}
```

<hr class="sr">

## Generic parameters

```java
/**
 * ...
 * @param <T>
 */
public class GenericClass<T> {}
```