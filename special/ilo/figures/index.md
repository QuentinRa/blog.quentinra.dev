# TP FIGURES

[Go back](..)

This is the first practical class that you should have. You're supposed to implement in Java, a lot of figures such as Point2D, Point3D, ... Some code is given to you, with the tests to check that your code is working.

First and foremost: **DO NOT USE ECLIPSE**. Eclipse is not helping a beginner. It won't make things harder, but they could be easier. The best choice would be to use VSCode. Any other IDE helping more than eclipse (vanilla) is welcome.

<hr class="sr">

## Introduction

This TP is an example of what we call "test-driven". You will first write tests, to test the code that you will write later. Then you have to write the code to pass the tests. Fortunately, the tests had already been written for us, so we <s>only</s> have to write the code passing the tests.

That's one hell of a job because there are too many comments, and sometimes you don't know exactly what you need to do. Do it step by step, and you will see that's easy (at least not that hard, take your time).

The subject [is hosted here](https://github.com/memorize-code/memorize-references/raw/main/special/ilo/TP-Figures.zip).

<hr class="sl">

## Choose your IDE

An IDE will help you understand a lot of your mistakes, especially if you use ``IntelliJ`` which is good at finding potential mistakes and providing a patch for them. For this TP, I recommend [VSCode](https://code.visualstudio.com/).

**VSCode**

To do it in ``VSCode``, you should simply open it and that's okay.

**IntelliJ**

Do not use IntelliJ for this TP (IntelliJ is good for projects, not test-driven like this), trying VSCode for this one would be better. You can try IntelliJ later. But just in case, [here is your tutorial](idea.md).

<hr class="sr">

## FAQ

``What's a constructor?``

<blockquote class="spoiler">
That's simply a <code>method</code> (or a function) called in order to create an object. We will set all the attributes (the properties of our class) and we can even call another constructor. 

```java
// classname, so we have Test.java
public class Test {
    // attributes
    private String result;

    public Test(int n){
        this("a", n); // call another constructor
    }

    public Test(String s, int n){
        // some (stupid) code
        // note that String.valueOf is useless
        // to convert an int to a String
        // since Java do it implicitely with "+"
        this.result = s+String.valueOf(n);
        // same as
        this.result = s+n;
    }

    // "copy" constructor
    public Test(Test t){ this.result = t.result; }
}
```
</blockquote>

``What's static?``

<blockquote class="spoiler">

That's simply an attribute (or a method) that is owned by the class. The attribute has the same value in each instance  (=each point for a class Point). <b>Some methods will be static</b>, so make sure that you don't forget the keyword. You will know when a method is likely to be static when you are not using the instance's attributes inside.

To call a static method, use the name of the class instead of this/an object. For instance, you can call ``Math.round(4.5)``, the static method `round` from the class `Math`.
</blockquote>

``What are equals? hashcode? And "=="?``

<blockquote class="spoiler">
When using ==, you are comparing addresses. For String, or any object in general, we are using equals. By default, equals is the same as doing a == but each class can rewrite (namely override) this default behavior.

```java
@Override
public boolean equals(Object o) {
    if (o == null) return false;
    if (this == o) return true;
    // is "o" a Point2D? 
    // note that "instanceof"
    // returns false if o == null (so this check was useless)
    // but do like Mr. Roussel want you to do
    if (!(o instanceof Point2D)) return false;
    // cast
    Point2D point2D = (Point2D) o;
    return this.equals(point2D);
}
```

Here we are checking if an object is a Point 2D. If that's the case then we are testing equality but this time with ``equals(Point2D p)`` (instead of `equals(Object o)`).

Note that in java >= 14 you can do that

```java
@Override
public boolean equals(Object o) {
    if (o == null) return false;
    if (this == o) return true;
    // p declared in the if
    if (o instanceof Point2D p) return this.equals(p);
	return false;
}
```

As for hashcode, that's a method which is returning a number. If two objects are equals, **then they must have the same hashcode.**

```java
@Override
public int hashCode() {
    return Objects.hash(getX(), getY());
}
```

Or you can explicitly evaluate the hashCode like Roussel is doing, using a `hash` variable, that's the same.
</blockquote>

About the TP, this constructor was a bit tricky. I think instead of what I did, you should test xMin and xMax, yMin and yMax but that's passing the tests so...

```java
public Rectangle(double xMin, double xMax, double yMin, double yMax) {
    this(new Point2D(xMin, yMin), new Point2D(xMax, yMax));
}

public Rectangle(Point2D pMin, Point2D pMax) {
    this.pMin = pMin; // bottomLeft
    this.pMax = pMax; // topRight
}
```