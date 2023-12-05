# Virtual Network Computing (VNC)

[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day5.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Virtual Network Computing (VNC) is a protocol used to access a  desktop with a graphical interface from another computer over a network connection. It's similar to  [RDP](/operating-systems/networking/protocols/rdp.md). It uses the RFB protocol.

It can optionally allow the remote user to control the keyboard and the mouse, on top of the remote computer.

🐊️ **Port**: 5900 to 5909 (TCP) - each port is a display

Mainly used on Linux.
</div><div>

VNC tools (server/client):

* TigerVNC
* TightVNC
* RealVNC (🔒++)
* UltraVNC (🔒++)

You can use [Remmina](/operating-systems/networking/protocols/rdp.md) client. Select VNC instead of RDP in the dropdown next to the IP address field.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* virtual mode/sessions
* `xtightvncviewer ip:port` (SSH tunneling first?)
</div><div>
</div></div>