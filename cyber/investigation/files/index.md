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
</div></div>

<hr class="sep-both">

## Find hidden data in an image

> Hide things in images: [Steganography](https://0xrick.github.io/lists/stego/)