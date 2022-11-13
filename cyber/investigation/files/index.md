# Find data in files

<hr class="sep-both">

## Find data from a PDF

[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)

<div class="row row-cols-md-2"><div>

You can use `pdfinfo`.

```bash
$ sudo apt install poppler-utils
$ pdfinfo xxx.pdf
Author:         XXX
Creator:        Microsoft Word
CreationDate:   Sun Aug 28 22:12:17 2022 EDT
ModDate:        Sun Aug 28 22:12:17 2022 EDT
[...]
PDF version:    1.7
```
</div><div>

There are other alternatives 📌

* Online tools
* Your PDF reader which should have a "details" section
* ...
</div></div>

<hr class="sep-both">

## Find data from an image

[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)
[![agentsudoctf](../../_badges/thm/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

You can use `exiftool`

```bash
$ sudo apt install libimage-exiftool-perl
$ exiftool xxx.png
[...]
File Modification Date/Time     : 2022:10:22 18:01:32-04:00
[...]
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
[...]
Software                        : www.inkscape.org
[...]
```
</div><div>

You can view stuff like the GPS coordinates, the camera/device model...

There are other alternatives 📌

* [jimpl](https://jimpl.com/) (website)
* [IMV](https://www.geekyhumans.com/tools/image-metadata-viewer) (website)

You can also do a reverse image search 🧵

* [images.google.com](https://images.google.com/):  drag and drop your image in the search bar
</div></div>

<hr class="sep-both">

## Find hidden data in an image

[![agentsudoctf](../../_badges/thm/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

You can hide things in images using [Steganography](https://0xrick.github.io/lists/stego/).

```bash
$ steghide info file
$ steghide extract -sf file
```

The content may be protected by a password. In such case, you may try brute force. More information about wordlist [here](/cyber/exploitation/general/index.md#-wordlists-).

```bash
# https://github.com/RickdeJager/stegseek
$ stegseek file wordlist
```
</div><div>

There was a case in which a zip was hidden inside an image, but not using steganography.

```bash
$ unzip file.png
# found 34562 bytes at the start of the file
# ...
# TL;DR can't unzip
```

In such case, what I did was first extract the zip ([source](https://unix.stackexchange.com/questions/6852/best-way-to-remove-bytes-from-the-start-of-a-file))

```bash
# extract the size by skipping the 34562 bytes
$ dd bs=34562 skip=1 if=file.png of=file.zip
$ ls
file.png file.zip
```

Then, I could extract it with 7z ([source](https://stackoverflow.com/questions/28383199/error-while-unzipping-a-file-in-shell-script-need-pk-compat-v5-1-can-do-v4))

```bash
# move to a folder with the zip
$ mkdir /tmp/zip-content/
$ cp file.zip /tmp/zip-content/
$ mv /tmp/zip-content/
# extract in the current folder
$ 7z x file.zip
$ ls
# files that were in the zip
```
</div></div>