# Chisel

<div class="row row-cols-lg-2"><div>

[Chisel](https://github.com/jpillora/chisel) <small>(10.5k ⭐)</small> is a post-exploitation tool that can be used to remotely access a website using TCP. This can be useful to access website from your browser will a firewall is blocking connections.

On Kali, you can install it using:

```ps
$ sudo apt-get install chisel
$ chisel server -p <port_a> --reverse
```
</div><div>

On the remote target server, you need to get `chisel`

* Use `lscpu` to find which binary is appropriate
* Download the appropriate binary [here](https://github.com/jpillora/chisel/releases/)
* Unzip (`gunzip xxx.gz`) and upload it on the target

Using the configuration below, `http://localhost:8080` on Kali will show the website on port `80` of the remote target server:

```ps
$ ./chisel client host_ip:port_a R:8080:localhost:80
```
</div></div>