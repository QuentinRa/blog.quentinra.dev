# Networking

[Go back](../index.md#advanced)

You can only create a client-server app locally like your local network (you will need a real server if you want to do a real client-server).

<hr class="sl">

## Server Socket

As a server, create a socket to allow connections

```java
ServerSocket s = new ServerSocket(port);
```

Then you simply need to wait for connection with `Socket client = s.accept();`. This call will wait for a connection then resume your code with the client socket. You may create a new thread to handle your new client like sending or receiving his/her messages using this socket.

Don't forget to close the connection with `close()`.

<hr class="sr">

## Client Socket

To create a client socket, simply use

```java
Socket s = new Socket(host, port);
```

With `host` an (local) IP/localhost (string), and `port` the port of your server.

<hr class="sr">

## Use sockets

Now that you got a socket in both sides, you can use it to received and send information to ONE client.

It's like a thread linking two person, and the link is established with the socket returned by accept.

You can use these methods to create read/write streams

```java
InputStream i = s.getInputStream();
OutputStream o = s.getOutputStream();
```

but in order to use that you will have to check the file section.

Also, you must note than writing and reading are using the system buffers. They may not send your message and wait for more input. You can, and should force, at the end of your input, the stream to be flushed

```java
i.flush();
o.flush();
```