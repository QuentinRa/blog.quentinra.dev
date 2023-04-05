# Wireshark

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

See [wireshark](https://www.wireshark.org/download.html). Wireshark is providing a graphical interface. Inside the search bar, you can filter requests/responses

* `ip.src == some_IP`, or `ip.dest == some_IP`
* `ip.addr == some_IP`
* `tcp.port == some_port`, or `udp.port == some_port`
* `http.request.method == GET`, or `... == POST`...
* You can use `&&` (logical AND), `||` (logical OR), `!=` (different)
* You can enter a protocol, or `tcp`/`udp`

Once you find something interesting, right-click on it > Follow TCP Stream, and you will see in a human-readable way the data exchanged.

Use File > Export > HTTP to GET download files.
</div><div>

* [wireshark](https://unit42.paloaltonetworks.com/wireshark-workshop-videos/)
* [wireshark capture filters](https://gitlab.com/wireshark/wireshark/-/wikis/CaptureFilters)
* [THM/startup](https://tryhackme.com/room/startup): `wireshark xxx.pcapng`.
</div></div>