# File investigation

<div class="row row-cols-md-2"><div>

Any file you find, be it during [Digital forensics](/cybersecurity/blue-team/forensics/index.md) or during the red team activities, may have:

* 🐟 Hidden content in a file
  * A file inside another file
  * A text inside an image
* 👀 Username/Name of the one that created the file
* 🍫 Information generated by the application that created the file
* ...
</div><div>

This is why you should investigate any file you get you hands on.
 
➡️ For instance, if you notice a "big" image <small>(usually >1MB)</small>, you may want to check if this is really an image.
</div></div>

<hr class="sep-both">

## Metadata

[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)

<div class="row row-cols-md-2"><div>

Any file has metadata, which is data that provide information on the file, such as the author, the creation date...

#### PDF metadata

You can use online tools, your PDF reader "details" menu, or `pdfinfo`.

```shell!
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

#### Image metadata

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

You can use `exiftool`, [jimpl](https://jimpl.com/), [IMV](https://www.geekyhumans.com/tools/image-metadata-viewer)... Also, do a reverse image search 🧵.

```shell!
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
</div></div>

<hr class="sep-both">

## Steganography

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

Steganography is a technique in which a person hide data inside the pixels of an image. It's used to secretly transfer data.

If the hidden content is not protected by a password, you can extract it using the `steghide` command:

```bash
$ steghide info file # check
$ steghide extract -sf file # extract
```
</div><div>

Otherwise, you may try to [crack](/cybersecurity/red-team/s3.exploitation/index.md#brute-force) the password.

```ps
# https://github.com/RickdeJager/stegseek
$ stegseek file wordlist
```
</div></div>

<hr class="sep-both">

## File steganography

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

File steganography is a subcategory of steganography in which a file is hidden in another file. Using [binwalk](https://github.com/ReFirmLabs/binwalk) (8.7k ⭐) you can investigate:

```ps
$ binwalk file.png
# from xxx to yyy: PNG
# from zzz to ttt: ZIP
```

And you can extract files using `-e`

```ps
$ binwalk -e file.png
```
</div><div>

You can alternatively use `dd` to extract a file:

```ps
# extract the size by skipping the 34562 bytes
$ dd bs=34562 skip=1 if=file.png of=file.zip
$ ls
file.png file.zip
```

👉 If there was a ZIP inside the PNG, and you can't unzip it, try with `7z x xxx.zip` or use `dd` to extract the file.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Stegosploit
</div><div>

</div></div>