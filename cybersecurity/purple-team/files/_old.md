# Find data in files

<hr class="sep-both">

## Find hidden data in an image

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

You can hide things in images using [Steganography](https://0xrick.github.io/lists/stego/).

```bash
$ steghide info file
$ steghide extract -sf file
```
</div><div>

The content may be protected by a password. In such a case, you may try brute force. More information about wordlists [here](/_cybersecurity/exploitation/general/index.md#-wordlists-).

```bash
# https://github.com/RickdeJager/stegseek
$ stegseek file wordlist
```
</div></div>

<hr class="sep-both">

## Find hidden data in a file

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

There could be a case where there is for an instance a zip inside an image. Using [binwalk](https://github.com/ReFirmLabs/binwalk) (8.7k ⭐) you can find if that's the case

```bash
$ binwalk file.png
# the output is basically telling you
# from xxx to yyy: PNG
# from zzz to ttt: ZIP
```

And you can extract files using `-e`

```bash
$ binwalk -e file.png
```

Then, I couldn't extract it with `unzip` but it works with `7z` ([source](https://stackoverflow.com/questions/28383199/error-while-unzipping-a-file-in-shell-script-need-pk-compat-v5-1-can-do-v4))

```bash
# move to a folder with the zip
$ mkdir /tmp/zip-content/
$ cp zzz.zip /tmp/zip-content/
$ mv /tmp/zip-content/
# extract in the current folder
$ 7z x zzz.zip
$ ls
# files that were in the zip
```
</div><div>

You could also do it manually. Here you try to extract the PNG

```bash
$ unzip file.png
# found 34562 bytes at the start of the file
# ...
# TL;DR can't unzip
```

Then you can remove the leading bytes ([source](https://unix.stackexchange.com/questions/6852/best-way-to-remove-bytes-from-the-start-of-a-file))

```bash
# extract the size by skipping the 34562 bytes
$ dd bs=34562 skip=1 if=file.png of=file.zip
$ ls
file.png file.zip
```

Then, the steps are the same as after using `binwalk -e`. If the former is working, there is no need to tire yourself out with the stuff above.
</div></div>