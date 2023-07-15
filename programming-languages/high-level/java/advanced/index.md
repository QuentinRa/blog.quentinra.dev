# Java - Advanced

Since the Java course was too long, some content for more advanced users was moved here.

<hr class="sep-both">

## Annotations

<div class="row row-cols-md-2"><div>

Annotations such as `@Override` or `@Deprecated` allow us to enforce some compiler checks to a method <small>(ex: deprecated trigger a warning)</small>.

For instance, [org.jetbrains:annotations](https://www.jetbrains.com/help/idea/annotating-source-code.html) provides: `@Nullable`, `@NotNull`, or `@Contract` which are helpful for [contract programming](/tools-and-frameworks/others/testing/methodology/index.md#contract-programming).

<br>

#### SuppressWarnings

You can use `@SuppressWarnings` to suppress compiler warnings:

* `@SuppressWarnings("deprecation")`: deprecation
* `@SuppressWarnings("unchecked")`: unchecked casting
* `@SuppressWarnings("SameParameterValue")`: a non-public method is always given the same parameters
* `@SuppressWarnings("MethodDoesntCallSuperMethod")`: missing `super.xxx(...)` when overriding a method
* ...
</div><div>

#### Create annotations

You can create annotations.

```java
@Retention(...) // RetentionPolicy: CLASS = compiler, RUNTIME = runtime too
@Target(...) // ElementType: TYPE, METHOD, FIELD, PARAMETER,  LOCAL_VARIABLE, TYPE_USE... 
public @interface AnnotationName {
	// optional, args
	String field1() default "";
	int[] field2() default {};
	float field3();
}
```

Which can be used as follows:

```java
@AnnotationName(field1 = "", field2 = {}, field3 = 1)
@AnnotationName(field2 = {}, field3 = 1)
@AnnotationName(field3 = 1)
```
</div></div>

<hr class="sep-both">

## Input/output streams

<div class="row row-cols-md-2"><div>


Files, and sockets <small>(networking)</small> are two examples of streams. We read in an `InputStream` 📖, and we write in an `OutputStream` ✍️. There is also:

* `System.in`: standard input stream <small>(terminal input, stdin)</small>
* `System.out`: standard output stream <small>(terminal output, stdout)</small>
* `System.err`: error output stream  <small>(terminal output, stderr)</small>

```java
// import java.io.*;
InputStream is = System.in;
OutputStream os = System.out;
```

☠️ With in input/output stream, we can only read/write integers:

```java
int read = is.read();         // read one
os.write(5);                  // write one
```

⚠️ ️ Both raise a [verified `IOException`](../_general/index.md#verified-exceptions) that must be caught. Whether you have one or multiple `try-catch` is up to your needs.

If you open a stream <small>(not stdin/...)</small>, you have to close it. A new alternative is the `try-ressource` which automatically close a resource.

```java
// try-with-resources
try (InputStream is = ...) {
    // ...
}
```

🔥 When closing a buffer, any nested stream is automatically closed.
</div><div>

#### Buffers

We usually wrap streams within **buffers** to read more characters in one go. Each read/write still raise a [verified `IOException`](../_general/index.md#verified-exceptions) to catch.

```java
// for character streams:
BufferedReader reader = new BufferedReader(new InputStreamReader(is));
BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os));
String line;
while((line = reader.readLine()) != null) {
    // read line by line
}
writer.write("....");             // write a line
writer.newLine();                 // write a \n or \r\n
// for binary streams:
BufferedInputStream reader = new BufferedInputStream(is);
BufferedOutputStream writer = new BufferedOutputStream(os);
```

#### Files

For **binary** files, you can use:

```java
InputStream is = new FileInputStream("file");
OutputStream os = new FileOutputStream("file");
```

Otherwise, for **text** files, you can use:

```java
FileReader fileReader = new FileReader("file");
BufferedReader reader = new BufferedReader(fileReader);
```

⚠️ ️ Both raise a [verified `FileNotFoundException`](../_general/index.md#verified-exceptions) that must be caught.

💡 See also: `FileWriter` <small>(write into text files)</small>, and `File` <small>(file operations)</small>.
</div></div>

<hr class="sep-both">

## Java Generics

<div class="row row-cols-md-2"><div>

It's possible to write generic code using [Polymorphism](/programming-languages/_paradigm/oo.md#polymorphism). For instance, this functions takes instance of AAA or [subclasses](../_general/index.md#inheritance) of AAA.

```java
public static AAA xxx(AAA aaa){
    return /* ... */;
}
```

But, it's limited to subclasses. Java Generics allow us to factorize methods with the same code but no useful polymorphism usable:

```java
public static Integer firstElement(Integer[] array){
    return array.length == 0 ? null : array[0];
}

public static Float firstElement(Float[] array){
    return array.length == 0 ? null : array[0];
}
```
</div><div>

We could declare a type `<T>` and use it as follow:

```java
public static <T> T firstElement(T[] array){
    return array.length == 0 ? null : array[0];
}

// Usage:
Integer[] xxx = {0, 1, 2};
Integer first = firstElement(xxx); // 0
```

A generic type can be declared in a method, or in a class. For the latter, you must provide the type when calling the constructor:

```java
public class XXX<T> {}
// examples
XXX<Integer[]> xxx = new XXX<Integer[]>();
XXX<Integer[]> xxx = new XXX<>(); // omitted (inferred)
```

👉 You can also add constraints (`<XXX extends ...>`) or declare multiple types (`<K, V>`).

👉 You can use the "`?`" wildcard such as `XXX<?> xxx = ...` when you don't want to declare a generic type or don't need to enforce a type.
</div></div>

<hr class="sep-both">

## Threads

<div class="row row-cols-md-2"><div>

Threads allow us to run tasks in parallel 🔥. We will create a `Runnable` with the code executed by the thread.

```java
// version 1 - lambda expression
Runnable r = () -> {
    System.out.println("Hello, World!");
};
// version 2 - CodeRunByTheThread.java
public class CodeRunByTheThread implements Runnable {
	@Override
	public void run() {
		System.out.println("Hello, World!");
	}
}
Runnable r = new CodeRunByTheThread();
```

To create and execute a thread:

```java
Thread thread = new Thread(r);
thread.start();
```

👉 Use `Thread.sleep(duration);` to wait for a duration.
</div><div>

When multiple threads try to access a variable, there may be concurrency problems 💥. You can prevent them by only allowing one thread at a time to call a method using `synchronized`:

```java
[...]
    public synchronized void myMethod() { [...] }
[...]
```

Otherwise, you can use a `mutex` and `synchronized` to only allow the one that could lock the mutex to run some code:

```java
private Object lock = new Object();

public void myMethod() {
    synchronized (lock) { /* ... */ }
}
```

⚠️ If you're using threads to update a variable, you need to mark it as `volatile`, to ensure other threads will notice the variable changed. 
</div></div>

<hr class="sep-both">

## Await an async function

<div class="row row-cols-md-2"><div>

Async functions are functions executed in another [thread](#threads). For instance, to query a database/an API. Sometimes, we want to wait for the result resuming the execution.

```java
// import java.util.concurrent.CountDownLatch;
// import java.util.concurrent.atomic.AtomicReference;
public class APIHelper {
    public static int getResult() throws InterruptedException {
        CountDownLatch latch = new CountDownLatch(1);
        AtomicReference<Integer> ref = new AtomicReference<>();
        // Do an async call here, update ref, and latch
        latch.await();
        return ref.get();
    }
}
```
</div><div>

To simulate an API call, we can create a thread as follows:

```java
Thread thread = new Thread(() -> {
    ref.set(10);       // AtomicReference<Integer>
    latch.countDown(); // decrease the latch by 1
});
thread.start();
```

When the latch is empty, `latch.await()` will stop waiting. 

If you've multiple async functions to call, you can simply increase `CountDownLatch` starting value.

</div></div>

<hr class="sep-both">

## Networking

<div class="row row-cols-md-2"><div>

You can create a server from which **local** clients can connect to 🏠. As a client, you can connect to any server <small>(local or not)</small> 🌍.

#### Server

```
try (ServerSocket serverSocket = new ServerSocket(port)) {
    while (true) {
        Socket clientSocket = serverSocket.accept();
        // handle client, usually in a new thread
    }
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div><div>

#### Client

```java
// "host" could be "localhost" or an IP
Socket clientSocket = new Socket(host, port);
```

#### Sockets

Assuming `s` is a `Socket`, you can get [streams](#inputoutput-streams) using:

```java
InputStream i = s.getInputStream();
OutputStream o = s.getOutputStream();
```

Unlike common streams, you will have to flush them after using them:

```java
i.flush();
o.flush();
```
</div></div>

<hr class="sep-both">

## Properties and Preferences

<div class="row row-cols-md-2"><div>

Properties and preferences are two common ways of storing user settings, such as the user language, the theme...

#### Preferences

Preferences are available at two scopes: user and system. Each preference is associated with a class.

* Static <small>(replace `XXX.class` with any class)</small>

```java
final Preferences preferences = Preferences.userNodeForPackage(XXX.class);
```

* Instance

```java
final Preferences preferences = Preferences.userNodeForPackage(getClass());
```

Preferences are dictionaries of key-values.

```java
preferences.put("key", "value");                 // save
String stored = preferences.get("key", default); // load
preferences.remove("key");                       // delete
```
</div><div>

#### Properties

Properties are `.properties` files such as `gradle.properties`. See [INI](/programming-languages/others/data/ini.md).

```java
try (FileReader reader = new FileReader("xxx.properties")) {
    final Properties p = new Properties();
    p.load(reader);
    // read values
    String value = p.getProperty("key", "default");
} catch (IOException e) {
    throw new RuntimeException(e);
}
```

```java
try (FileWriter writer = new FileWriter("xxx.properties")) {
    final Properties p = new Properties();
    // add/set properties
    p.put("key", "value");
    p.store(writer, null);
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div></div>

<hr class="sep-both">

## Web requests

<div class="row row-cols-md-2"><div>

You can do an HTTP request using native code as follows:

```java
try {
    URL url = new URL("https://example.com");
    HttpURLConnection req = (HttpURLConnection) url.openConnection();
    try (InputStream is = req.getInputStream()) {
        // refer to the streams section
    }
    req.disconnect();
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div><div>
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2"><div>

#### JAR files

[JAR](https://docs.oracle.com/javase/tutorial/deployment/jar/index.html) files are used to bundle JAVA code. Some are executable, while others are libraries that can be used in other projects. It can contain files <small>(images...)</small>, libraries, and other stuff needed by your program. 🗃️

```shell!
$ java -jar some_jar.jar # execute
```

⚠️ Once bundled, files inside the JAR cannot be modified.
</div><div>

#### UTF-8

Non-ASCII characters are incorrectly displayed on some machines. You can use [unicode](https://unicode-table.com/en/) to ensure it won't be the case.

```java
System.out.println("\u00E9"); // print é
```

Otherwise, you can also use: `java -Dfile.encoding=UTF-8 [...]`.
</div></div>

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

#### JSON

You can use [JSON-java](https://github.com/stleary/JSON-java) to parse JSON.

```java
JSONObject o = new JSONObject("some JSON");
String string = o.getString("...");
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

<div class="row row-cols-md-2"><div>

* Complete JAR notes (common functions/asset handling...)
</div><div>
</div></div>
