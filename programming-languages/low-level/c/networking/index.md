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
#include <string.h>

typedef struct sockaddr SA;

int open_listen_fd_server(int port){
    int listen_fd, opt_val = 1;
    struct sockaddr_in server_addr;

    // 🔥 todo 1: create the socket

    // 🌹 todo 2: set options for the socket

    // ✈️ todo 3: bind the socket to the address/port

    // 🍀 todo 4: additional configuration

    return listen_fd;
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

</div></div>