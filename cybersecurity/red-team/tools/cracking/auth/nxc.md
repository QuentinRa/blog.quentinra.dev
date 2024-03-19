# NetExec

<div class="row row-cols-lg-2"><div>

[NetExec](https://github.com/Pennyw0rth/NetExec) or NXC <small>(1.8k ⭐)</small> is a fork of [CrackMapExec](cme.md) which is now archived. It can be used to brute force network services passwords.

The [wiki](https://www.netexec.wiki/) further lists everything else you can do.

```shell!
$ sudo apt install pipx git
$ pipx ensurepath
$ pipx install git+https://github.com/Pennyw0rth/NetExec
```
</div><div>
</div></div>

<hr class="sep-both">

## Example Commands

<div class="row row-cols-lg-2"><div>

#### NXC SMB Commands

All [SMB](/operating-systems/networking/protocols/smb.md) commands are available under `nxc smb`.

```ps
$ nxc smb IP [...]
$ nxc smb IP [...] -u 'username' # or username.list
$ nxc smb IP [...] -p 'password' # or password.list
$ nxc smb IP [...] --continue-on-success
$ nxc smb IP [...] -H hash
$ nxc smb IP [...] --local-auth # SAM instead of AD
$ nxc smb IP [...] -d .         # Domain
```

```ps
$ nxc smb IP [...] --shares     # List shares + access
$ nxc smb IP [...] -x whoami    # See also: --exec-method smbexec
$ nxc smb IP [...] --pass-pol   # Password Policy
$ nxc smb IP [...] --users      # Domain Users
                                # show the badpasswordcount
$ nxc smb IP [...] --groups     # Domain Group
$ nxc smb IP [...] --loggedon-users
$ nxc smb IP [...] --lsa
$ nxc smb IP [...] --sam
```
</div><div>
</div></div>