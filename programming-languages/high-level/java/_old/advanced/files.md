# Files

[Go back](../../index.md#advanced)

Like in C, you will use Streams of data. You may know of

```java
System.in
System.out
System.err
```

Since you could use out/err to write and in to read. You may use them in the methods bellow if you don't want to read/write to a file.

<hr class="sr">

## Logic

You will have classes starting with `Input` (read) and classes starting with `Output` (write).

Exception will be thrown will extends `IOException`, you must explicitly handles them since they are verified exception (in function declaration or with a catch).

```java
try {
    InputStream reader = System.in;
    OutputStream writer = System.out;
    // you should try catch read and write separately
    int read = reader.read();
    writer.write(5);
} catch (IOException e) {
    // do something
}
```

But this is not really good, you would want to read/write lines so we usually wrap the stream in a buffer

```java
try {
    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
    // you should try catch read and write separately
    String s = reader.readLine();
    writer.write(5);
    writer.write("....");
    writer.newLine();
} catch (IOException e) {
    // do something
}
```

<hr class="sr">

## Get File as streams

> Do not forget to close the reader / writer since this is a file by calling close.
> 
> Some are using the try with resources to automatically close a stream, check the try-catch page.

**Bytes**

```java
BufferedInputStream reader = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(file));
```

You may directly use FileInputStream / FileOutputStream since you are gonna read int anyways.

**Text**

```java
BufferedReader reader = new BufferedReader(new FileReader(file));
BufferedWriter writer = new BufferedWriter(new FileWriter(file));
```