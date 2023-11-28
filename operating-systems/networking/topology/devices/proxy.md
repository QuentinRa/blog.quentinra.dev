# Proxy

[Go back](../index.md#networking-devices)

<div class="row row-cols-lg-2"><div>

There are multiple types of proxy, and their features are different.

#### Open proxy

An open proxy, also called dedicated or forward proxy, is a proxy that is filtering outgoing traffic.

For instance, between users of a company, and the internet, a company may set up an open proxy to prevent users from accessing some websites.

➡️ They can be anonymous <small>(hide requester)</small> or not <small>(transparent)</small>.

🚀 Transparent proxies can cache frequently accessed resources.
</div><div>

#### Reverse Proxy

A reverse proxy is the opposite of an open proxy. Instead of filtering outgoing traffic, it filters incoming traffic.

➡️ A reverse proxy can act as a [Load balancer](balancer.md).

➡️ A reverse proxy can act as a [WAF](firewall.md).

<br>

#### Protocols

➡️ See the [SOCKS](../../protocols/socks.md) proxy protocol.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [frp](https://github.com/fatedier/frp)
</div><div>

```text!
export http_proxy='http://example.com:4444/'
export https_proxy='https://example.com:8888/'

Acquire::http::Proxy "http://example.com:4444/";
Acquire::https::Proxy "https://example.com:8888/";
```
</div></div>