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
