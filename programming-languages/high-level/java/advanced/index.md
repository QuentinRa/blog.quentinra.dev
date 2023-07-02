# Java - Advanced

Since the Java course was too long, some content for more advanced users was moved here.

<hr class="sep-both">

## Input/output streams

<div class="row row-cols-md-2"><div>

Files, and sockets <small>(networking)</small> are two examples of streams. We read in `InputStream` 📖, and write in an `OutputStream` ✍️. There is also:

```java!
System.in           // standard input stream
System.out          // standard output stream
System.err          // error output stream
```

☠️ With in input/output stream, we can only read/write integers:

```java
// import java.io.IOException;
// import java.io.InputStream;
// import java.io.OutputStream;
InputStream reader = System.in;   // example
OutputStream writer = System.out; // example
int read = reader.read();         // read one
writer.write(5);                  // write one
```
</div><div>

So, we usually wrap them within a **buffer**.

```
BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));   // example
BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out)); // example
String s = reader.readLine();     // read a line
writer.write("....");             // write a line
writer.newLine();                 // write a \n or \r\n
```

⚠️ Reading/writing may fail. You need to [try-catch]() every `IOException`. Whether you have one or multiple `try-catch` is up to your needs.

#### Streams of bytes

Streams of bytes are not using BufferedReader/Writer.

```java
BufferedInputStream reader = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(file));
```
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
