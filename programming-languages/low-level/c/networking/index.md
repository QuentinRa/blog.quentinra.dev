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

int open_listen_fd_server(int port){
    int listen_fd;
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

For **🌹 todo 2: set options for the socket**, I'm using this code:

```c
int opt_val = 1;
```

For **✈️ todo 3: bind the socket to the address/port**, I'm using this code: 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

</div></div>