# Threads

[Go back](..)

You can run some code in parallel to your main
thread. A thread will run some code and die.

You must write a Runnable and write the code
of your thread.

```java
public class ThreadCode implements Runnable {
    @Override
    public void run() {
        // code here
        System.out.println("some code here");
    }
}
```

Then create an starts your thread

```java
Thread t = new Thread(new ThreadCode());
t.start();
```

And that's it!

<div class="sr"></div>

## Runnable

Since runnable is a functional interface,
you might see

```java
Thread t = new Thread(new Runnable() {
    @Override
    public void run() {
        System.out.println("some code here");
    }
});
// or
Thread t = new Thread(() -> System.out.println("some code here"));
// or
Thread t = new Thread(() -> {
    System.out.println("some code here");
});
```

<div class="sl"></div>

## Thread-safe

Not all methods are thread-safe. That means that this
method may not works properly if you are using threads. 
For instance calling a methods in two different
threads can result in a value not correctly
set etc.

You can use ``synchronized`` to make sure only one person
at a time is calling this method.

```java
public synchronized void methode() { ... }
```

And you could do the same with a part of the code
of a method like this

```java
// attribute only for synchronized
// only one person at a time could
// request to read this attribute
// so the synchronized bloc will wait
private Object lock = new Object();

public void methode() {
    synchronized(this.lock){
        /* ... */
    }
}
```

You may declare an attribute ``volatile`` if the
attribute value is changed inside a thread and
you want to disabled the caching.

```java
private volatile int attribute;
```

You will only use that if you have a loop like
```while(attribute){}``` since in that case since
in the thread the attribute don't change then the 
value is cached and the loop will raise a infinite
looping error.

<div class="sr"></div>

## Sleep

```java
try {
    Thread.sleep(duration);
} catch(InterruptedException e) {
    // ...
}
```