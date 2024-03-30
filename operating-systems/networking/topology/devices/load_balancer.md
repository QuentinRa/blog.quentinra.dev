# Load balancer

[![httprequestsmuggling](../../../../cybersecurity/_badges/thm/httprequestsmuggling.svg)](https://tryhackme.com/r/room/httprequestsmuggling)

<div class="row row-cols-lg-2"><div>

A load balancer is a device sitting between clients and servers. Its main purpose is to ensure the charge is appropriately balanced between every server, to avoid overcooking servers.

They operate either at layer 4 <small>(TCP, IP...)</small> or at layer 7 <small>(HTTP...)</small>.

➡️ There are hardware-based and software-based load balancers.
</div><div>

They commonly use algorithms such as round-robin <small>(in turn)</small>, weighted round robin <small>(is server busy?)</small>, least connections/response time...

There are periodic checks to ensure that servers are still available. If there is no response from a server, it's considered as down. When the server is "up" again, it notifies the load balancer.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* AWS Elastic Load Balancing
* HAProxy
* F5 BIG-IP
</div><div>
</div></div>