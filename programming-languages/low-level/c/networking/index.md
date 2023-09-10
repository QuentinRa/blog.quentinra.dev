# Networking in C

<div class="row row-cols-md-2 mt-4"><div>

Networking in C is done by creating sockets, which are either:

* 🌊 **STREAM sockets**: refer to the TCP protocol
* 🌾 **DATAGRAM sockets**: refer to the UDP protocol
* 🦆 **UNIX sockets**: refer to the Unix domain protocol
</div><div>

You also need to define an applicative protocol for each app:

* 📃 What's the format of data exchanged? <small>(endianness, types...)</small>
* ✈️️ What's the common flow for messages? <small>(ex: TCP SYN-ACK...)</small>
* 🥀 How are errors handled?
* ...
</div></div>

<hr class="sep-both">

## Base template

<div class="row row-cols-md-2"><div>

Both the code for the client and the server start from the same template, regardless of the type of socket.

```c
#include <sys/socket.h>

typedef struct sockaddr SA;

int open_client_fd(char *hostname, int port){
    int client_fd;

    // 🔥 todo 1: create a socket

    // 🍀 todo 2: additional configuration

    return client_fd;
}
```
</div><div>

```c
#include <sys/socket.h>
#include <netinet/in.h>

typedef struct sockaddr SA;

int open_server_fd(int port){
    int server_fd;
    struct sockaddr_in server_addr;

    // 🔥 todo 1: create the socket

    // 🌹 todo 2: set options for the socket

    // ✈️ todo 3: bind the socket to the address/port

    // 🍀 todo 4: additional configuration

    return server_fd;
}
```
</div></div>

<hr class="sep-both">

## Filling the common parts

<div class="row row-cols-md-2"><div>

In UDP clients/servers and TCP clients, you will need to generate a `sock_addr` with the address and port of the client/server. You can extract the code into one reusable function: `create_sock_addr` 👑.

```cpp
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

int create_sock_addr(struct sockaddr_in *sock_addr,
                       char *hostname, int port) {
    struct hostent *hp;

    if ((hp = gethostbyname(hostname)) == NULL)
        return -1;

    bzero((char *) sock_addr, sizeof(*sock_addr));
    sock_addr->sin_family = AF_INET;
    sock_addr->sin_port = htons(port);
    bcopy((char *) hp->h_addr, (char *) &sock_addr->sin_addr.s_addr, hp->h_length);

    return 0;
}
```
</div><div>

For **🌹 todo 2: set options for the socket**, you can set the "reuse address" option to true, to allow the immediate reuse of a port.

```c
int opt_val = 1;
if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, (const void *)&opt_val, sizeof(int)) < 0)
    return -1;
```

For **✈️ todo 3: bind the socket to the address/port**, you can use this snippet to associate (bind) the socket with the address/port.

```c
#include <string.h>
```

```cpp
memset(&server_addr, 0, sizeof(server_addr));
server_addr.sin_family = AF_INET;
server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
server_addr.sin_port = htons((unsigned short) port);

if (bind(server_fd, (SA *)&server_addr, sizeof(server_addr)) < 0)
    return -1;
```
</div></div>

<hr class="sep-both">

## TCP client/server

<div class="row row-cols-md-2"><div>

#### Client

Additional imports

```c
// none
```

**🔥 todo 1: create a socket**

```cpp
if ((client_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    return -1;
```

**🍀 todo 2: additional configuration**: we connect to the host. We will be able to send messages until the connection is closed.

```cpp
struct sockaddr_in server_addr;
if (create_sock_addr(&server_addr, hostname, port) < 0)
    return -1;
if (connect(client_fd, (SA *)&server_addr, sizeof(server_addr)) < 0)
    return -1;
```
</div><div>

#### Server

Additional imports

```c
// none
```

**🔥 todo 1: create a socket**

```cpp
if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    return -1;
```

**🍀 todo 4: additional configuration**: we listen for up to 1024 concurrent TCP connections.

```cpp
if (listen(server_fd, 1024) < 0)
    return -1;
```
</div></div>

<hr class="sep-both">

## UDP client/server

<div class="row row-cols-md-2"><div>

#### Client

Additional imports

```c
// none
```

**🔥 todo 1: create a socket**

```cpp
if ((client_fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
    return -1;
```

**🍀 todo 2: additional configuration**: UDP is not connected to a host. We need to specify the hostname and the port in every message.

```cpp
// none
```
</div><div>

#### Server

Additional imports

```c
// none
```

**🔥 todo 1: create a socket**

```cpp
if ((server_fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
    return -1;
```

**🍀 todo 4: additional configuration**

```cpp
// none
```
</div></div>

<hr class="sep-both">

## Read and write

<div class="row row-cols-md-2"><div>

#### TCP (server)

TCP server needs to accept a connection first. Once you do, you will get a client file descriptor, and will be able to use the same functions as in a client (see the section below 📌).

```cpp
int client_fd;
struct sockaddr_in client_addr;
socklen_t client_addr_length = sizeof(client_addr);
if ((client_fd = accept(server_fd, (struct sockaddr *)&client_addr, &client_addr_length))<0) {
    // handle error
}
```

Inside `client_addr`, you will find the IP address of the client and other data as in any `sockaddr_in`.

<br>

#### TCP (client)

If you are familiar with [system calls](/programming-languages/low-level/c/system_calls/index.md), you should already know that low-level functions such as `read` or `write` take a file descriptor. They work with `client_fd` then.

```cpp
int client_fd = [...];
// Read
char buffer[1024] = {0};
if (read(client_fd, buffer, 1024) < 0) {
    // handle error
 }

// send
char *message = "Hello, XXX!";
size_t message_len = strlen(message);
if (write(client_fd, message , message_len) < 0) {
    // handle error
}
```

👉 You can also use `recv`/`send` with `0` (flag).
</div><div>

You can gracefully close a socket using close.

```cpp
close(client_fd);
```

In some specific scenarios, you may want to stop receiving/sending messages. You can do that using shutdown.

```cpp
shutdown(client_fd, SHUT_WR); // close - send
shutdown(client_fd, SHUT_RD); // close - receive
```

<br>

#### UDP (client/server)

You can use `recvfrom`/`sendto` to receive/send messages. As a reminder, you first need the address of the host:

```
// 👉 could be the address of a client/a server
struct sockaddr_in sock_addr;
create_sock_addr(&sock_addr, "127.0.0.1", 66554);
```

Send a message:

```cpp
char *message = "Hello, XXX!";
size_t message_len = strlen(message);

if (sendto(client_fd, message, message_len, 0, (struct sockaddr *) &sock_addr, sizeof(sock_addr)) < 0) {
    // handle error
}
```

Receive a message:

```cpp
char buffer[1024];
socklen_t sock_len = sizeof(sock_addr);
if (recvfrom(client_fd, buffer, 1024, 0, (struct sockaddr *)&sock_addr, &sock_len) < 0) {
    // handle error
}
```
</div></div>

<hr class="sep-both">

## Common functions

<div class="row row-cols-md-2"><div>

**inet_aton** 🔢: convert an IP (`char*`) to the machine representation (`in_addr`). It stores inside `inp` the result.

```cpp
int inet_aton(const char *cp, struct in_addr *inp);
```

**inet_aton** 🔤: return from `in` the human-readable IP address.

```cpp
char *inet_ntoa(struct in_addr in);
```

**gethostbyname** 🌍: find the IP address from a domain name.

```cpp
struct hostent *gethostbyname(const char *name);
```
</div><div>

**XtoY** 📥: You can use these to convert a number in the machine format <small>(big-endian, little-endian)</small> to a network format <small>(standardized)</small>.

```cpp
// machine to network format
ulong htonl(ulong hostlong);
ulong htons(ulong hostshort);
// network format to machine
ulong ntohl(ulong netlong);
ulong ntohs(ulong netshort);
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

</div></div>