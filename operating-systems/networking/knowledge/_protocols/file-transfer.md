# File transfer

[Go back](../index.md)

<hr class="sep-both">

## SSH File Transfer Protocol (SFTP)

<div class="row row-cols-md-2"><div>

SSH File Transfer Protocol (SFTP) is an implementation of FTP based on SSH. It has a wider range of commands, but may be slower than SCP.

🐊️ **Port**: 22 (TCP)

```ps
$ sftp user@IP
```
</div><div>

...
</div></div>


<hr class="sep-both">

## Secure copy protocol (SCP)

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