# DCOM

<div class="row row-cols-lg-2"><div>

DCOM is a Microsoft technology that allows applications to communicate with each other over a network. For instance, it's used to remotely access [Windows Management Instrumentation](/operating-systems/windows/_knowledge/index.md#content-wmic) (WMI).

🐊️ **Ports**:

* 135 (TCP) — default initial port for connections
* Random port (TCP) — used after the initial handshake

DCOM is built on top of [MSRPC](rpc.md#rpc-smb-footprinting), which is why it uses the same port.
</div><div>
</div></div>

<hr class="sep-both">

## MSSQL Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

You can use [impacket](tools/impacket.md#wmiexec) to obtain a powershell:

```shell!
$ impacket-wmiexec -shell-type powershell username:password@IP
$ impacket-wmiexec -shell-type powershell username:password@IP "hostname"
```
</div><div>
</div></div>