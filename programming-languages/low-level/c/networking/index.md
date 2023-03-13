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
* 🥀 How are error handled?
* ...
</div></div>

<hr class="sep-both">

## Base template

<div class="row row-cols-md-2"><div>

Both the code for the client and the server are starting from the same template, regardless of the type of socket.

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

In the client, both in UDP and TCP clients, you will need to generate a `server_addr` with the address and port of the server. You can extract the code in one reusable function: `create_server_addr`.

```cpp
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

int create_server_addr(struct sockaddr_in *server_addr, char *hostname, int port) {
    struct hostent *hp;

    if ((hp = gethostbyname(hostname)) == NULL)
        return -1;

    bzero((char *) server_addr, sizeof(*server_addr));
    server_addr->sin_family = AF_INET;
    server_addr->sin_port = htons(port);
    bcopy((char *) hp->h_addr, (char *) &server_addr->sin_addr.s_addr, hp->h_length);

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
if (create_server_addr(&server_addr, hostname, port) < 0)
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

## Common functions

<div class="row row-cols-md-2"><div>

**inet_aton** 🔢: convert an IP (`cp`) in a machine representation (`in_addr`).

```cpp
int inet_aton(const char *cp, struct in_addr *inp);
```

**inet_aton** 🔤: return from `in_addr` the human-readable IP address.

```cpp
char *inet_ntoa(struct in_addr in);
```

**gethostbyname** 🌍: find the IP address from a DNS name.

```cpp
struct hostent *gethostbyname(const char *name);
```
</div><div>

📥 You can use these to convert a number in the machine format <small>(big-endian, little-endian)</small> to a network format <small>(standardized)</small>.

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