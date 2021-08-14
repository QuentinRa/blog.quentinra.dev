# Saving, converting and/or Archiving

[Go back](..)

<hr class="sl">

## Save a page as PDF

You can save a page as a PDF with

* CTRL-P
* Save as PDF
* you may add/remove the headers in the options
* if you want to remove some content, before CTRL-P
  * open the console
  * go to Elements
  * press CTRL+SHIFT+C (or use the icon)
  * select the element you want to remove
  * remove the HTML code that got focused
* then go back to the printing as PDF window

<hr class="sr">

## Converter

Simply use your favorite search engine (duckduckgo, google,
Qwant, ecosia, ...)

* search "xxx to yyy" to convert xxx to yyy
* like "PNG to PDF"
* You got these too
  * "merge PDF"
  * "compress PDF"

Some links (not clickable)

* https://www.ilovepdf.com/ (a lot of PDF's tools, great)
* https://png2pdf.com/ (not many tools but the best)
* https://www.img2go.com/ (not tested, batch of tools)

<hr class="sr">

## Archiving

* **online**

The most well-known archiving tool is
<https://archive.org/web/> allowing you to archive
one page (per one page) of a website or many other
things.

* **local**

You may also install an archive manager at your home,
if you feel like it with **ArchiveBox**

* <https://github.com/ArchiveBox/ArchiveBox/wiki/Quickstart>
* on Windows (auto-script)
  * you can use inside a git bash (installed by git-scm)
  * ``curl -sSL 'https://get.archivebox.io' | sh``
  * but you must have docker and python+pip installed
  * (it didn't work for me)
* on Windows (WSL - ubuntu)
  * I followed the [official tutorial](https://github.com/ArchiveBox/ArchiveBox#quickstart)
  * but before starting
    * ``sudo apt-get install python3``
    * ``sudo apt-get install python3-pip``
  * and if you got a problem (infinite fetching)
    * CTRL-C (exit)
    * ``sudo npm install -g yarn``
    * ``yarn install`` (in the archivebox directory)
then run the web server with
    * ``archivebox server 0.0.0.0:8000``

You can find your archives' website
at ``http://127.0.0.1:8000/``.

* **me**

After trying to use archive.org (but it's slow, and I'm look
for a file rather than this). I tried to use "ArchiveBox",
but this was not too 
(taking too long to archive, too tiring to use).
So now, I'm using [the SingleFile plugin](https://github.com/gildas-lormeau/SingleFile#install).

Basically, it's saving your website as a HTML file
(like you should with CTRL-S) but you only have
1 file. And the result is better, like saving a website
using CTRL-S make the JavaScript run each time
you open the page while this plugin does not create
such a HTML.