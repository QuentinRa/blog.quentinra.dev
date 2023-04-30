# IPV6 address

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The Internet Protocol version 6 (**IPV6**) address is a **128-bit long address** such as `2002:6963:6961:2046:616c:636f:6e20:3c33`. It's 8 blocks of 16 bits, separated with `:`. 

* The first 64 bits are called prefix <small>(network address)</small>
* The last 64 bits are called interface identifier <small>(host address)</small>

Because it's somewhat long, there are a few rules to shorten it

* Any leading $0$ in a block can be removed <small>(`0014 -> 14`)</small>
* A whole block of $0$ can be replaced with one $0$ <small>(`0000 -> 0`)</small>
* **One**, and only one suite of null-groups, may be merged in `::` <small>(`...:0000:0000:... -> ...::...`)</small>

<br>

➡️ See also "IPv4-mapped IPv6 addresses"
</div><div>


There are 8 kinds of IPV6 addresses

| Type/Name                        | Prefix (128 bits) | IPV6 notation            |
|----------------------------------|-------------------|--------------------------|
| Unspecified (`non spécifié`)     | 0...0             | ::/128                   |
| LoopBack (=localhost)            | 0...01            | ::1/128                  |
| Multicast (=broadcast)           | 111111110...0     | ff00::/8                 |
| Multicast (using ARP)            |                   | ff02::/8                 |
| Link-local Unicast (subnet only) | 1111111110...0    | fe80::/10                |
| Unique local Unicast (private)   | 11111101...0      | fc00::/7                 |
| Global Unicast (Internet)        | ...               | 2001..<br>2002...<br>... |
</div></div>