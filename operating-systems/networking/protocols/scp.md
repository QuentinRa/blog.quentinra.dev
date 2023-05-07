# Secure Copy Protocol (SCP)

[![linuxfundamentalspart3](../../../cybersecurity/_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)

<div class="row row-cols-md-2"><div>

Secure copy protocol (SCP) is an implementation of FTP based on SSH.

🐊️ **Port**: 22 (TCP)

```ps
# upload
$ scp file_to_upload user@IP:remote/path/
# download
$ scp user@IP:remote/path/ local_path_to_dest
```

➡️ Use `scp -r` to download/upload a folder with all its content.
</div><div>
</div></div>