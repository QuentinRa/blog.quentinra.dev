# Java - Advanced

Since the Java course was too long, some content for more advanced users was moved here.

<hr class="sep-both">

## Input/output streams

<div class="row row-cols-md-2"><div>


Files, and sockets <small>(networking)</small> are two examples of streams. We read in an `InputStream` 📖, and we write in an `OutputStream` ✍️. There is also:

* `System.in`: standard input stream <small>(terminal input)</small>
* `System.out`: standard output stream <small>(terminal output)</small>
* `System.err`: error output stream  <small>(terminal output)</small>

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

⚠️ ️ Both raise a [verified `IOException`]() that must be caught. Whether you have one or multiple `try-catch` is up to your needs.

</div><div>

#### Buffers

We usually wrap streams within **buffers** to read more characters in one go. Each read/write still raise a [verified `IOException`]() to catch.

```java
// for character streams:
BufferedReader reader = new BufferedReader(new InputStreamReader(is));
BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os));
String s = reader.readLine();     // read a line or NULL
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

⚠️ ️ Both raise a [verified `FileNotFoundException`]() that must be caught.

💡 See also: `FileWriter` <small>(write into text files)</small>, and `File` <small>(file operations)</small>.
</div></div>

<hr class="sep-both">

## Threads

<div class="row row-cols-md-2"><div>

Threads allow us to run tasks in parallel 🔥. We will create a `Runnable` with the code executed by the thread.

```java
// version 1
Runnable r = () -> {
    System.out.println("Hello, World!");
};
// version 2
class CodeRunByTheThread implements Runnable {
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

## 👻 To-do 👻

<div class="row row-cols-md-2"><div>

```java
// try-with-resources
try (FileReader reader = new FileReader(file)) {
    // ...
}
```
</div><div>

...
</div></div>
