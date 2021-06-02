# TP FIGURES

This tutorial is about using other IDE (basically
a software like eclipse) than eclipse, because if you do
things will go way smoother.

## Introduction

The main IDEA is to practice test-driven, 

* you can some test classes
* you need to code your classes to pass the tests

That's one hell of a job because there are too many comments,
and sometimes you don't know exactly what you need to do
but do it step by step and you will see that's easy
(at least not that hard).

## Choose your IDE

It will help you understand a lot of your mistakes, 
especially if you use ``IntelliJ`` that is good at finding
potential mistakes and providing a patch.

**VSCode**

To do it in ``VSCode``, you should
simply open it and that's okay.

**IntelliJ**

Do not use IntelliJ for this TP (IntelliJ is only good
for projects not "test-driven development" like this),
trying VSCode for this one would be better. Then switch or
try IntelliJ for others. 
But just in case, [here is your tutorial](figures/idea.md).

## Here some tips

``Writing some constructors``

<blockquote class="spoiler">
That's simply a <code>method</code> (or a function) called
in order to create an object. We will set all the attributes
(the properties of our class) and we can even call another
constructor. 

```java
public class Test {
    private String result;

    public Test(int n){
        this("a", n); // call another constructor
    }

    public Test(String s, int n){
        // some code
        // note that String.valueOf is useless since Java do it himself
        this.result = s+String.valueOf(n);
    }

    // copy
    public Test(Test t){ this.result = t.result; }

}
```
</blockquote>

``What's static``

<blockquote class="spoiler">
That's simply an attribute (or a method) that is owned by the class.
The attribute has the same value of each instance (each Point for a class
Point for instance). <b>Some methods will be static</b> so make sure that you don't
forget the keyword. You will know when a method is 
likely to be static when you are not using
instance's attributes inside.
</blockquote>

``equals ? hashcode ? and ==``

<blockquote class="spoiler">
When using ==, you are comparing addresses. For String, ... and
Object in general we are using equals. By default equals
if doing a == but each class can rewrite (namely override)
this default behavior.

```java
@Override
public boolean equals(Object o) {
    if (o == null) return false;
    if (this == o) return true;
    // is a Point2D ? note that this also return
    // false if o == null but do like Roussel
    // want you to do
    if (!(o instanceof Point2D)) return false;
    // cast
    Point2D point2D = (Point2D) o;
    return this.equals(point2D);
}
```

Here we are check if an object is a Point 2D. If that's
the case then we are testing equality but this time
this one ``equals(Point2D p)``.

Note that in java >= 14 you can do that

```java
@Override
public boolean equals(Object o) {
    if (o == null) return false;
    if (this == o) return true;
    // p declare in if
    if (o instanceof Point2D p) return this.equals(p);
	return false;
}
```

As for hashcode, that's a method which is returning a number. If two
objects are equals, **then they must have the same hashcode.**

```java
@Override
public int hashCode() {
    return Objects.hash(getX(), getY());
}
```

Or you can explicitly evaluate the hashCode
like Roussel is doing, using a `hash` variable,
that's the same.
</blockquote>

About the TP, this constructor was a bit tricky. I think
instead of what I did you should test xMin and xMan,
yMin and yMax but that's passing the tests so...

```java
public Rectangle(double xMin, double xMax, double yMin, double yMax) {
    this(new Point2D(xMin, yMin), new Point2D(xMax, yMax));
}

public Rectangle(Point2D pMin, Point2D pMax) {
    this.pMin = pMin; // bottomLeft
    this.pMax = pMax; // topRight
}
```