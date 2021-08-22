# Saving, converting, and archiving files/websites

[Go back](..)

How to easily save a page as PDF, converting a file, or archiving a website (either online, locally, or saving each page as a single HTML file).

<hr class="sl">

## Save a page as a PDF

You can save a page as a PDF with

* CTRL-P
* Save as PDF
* you may add/remove the headers in the options
* if you want to remove something else, before CTRL-P
  * open the console
  * go to Elements
  * press CTRL+SHIFT+C (or use the selection icon)
  * select the element you want to remove
  * remove the HTML code that got focused in Elements
* then go back to the printing as PDF window

<hr class="sr">

## Converter

Simply use your favorite search engine (DuckDuckGo, Google, Qwant, Ecosia, ...)

* search "xxx to yyy" to convert xxx to yyy
* like "PNG to PDF"
* You got these too
  * "merge PDF"
  * "compress PDF"

Some links (not clickable)

* https://www.ilovepdf.com/ (a lot of PDF's tools, great)
* https://png2pdf.com/ (not many tools but the best)
* https://www.img2go.com/ (not tested, a batch of tools)

<hr class="sr">

## Archiving

* **online**

The most well-known archiving tool is <https://archive.org/web/>, allowing you to archive one page (per one page) of a website or a lot of other things.

* **local**

You may also install an archive manager locally, if you feel like it, like with **ArchiveBox**

* <https://github.com/ArchiveBox/ArchiveBox/wiki/Quickstart>
* on Windows (auto-script)
  * you can use inside a git bash (installed by git-scm)
  * ``curl -sSL 'https://get.archivebox.io' | sh``
  * but you must have docker and python+pip installed
  * (it didn't work for me)
* on Windows (WSL - Ubuntu)
  * I followed the [official tutorial](https://github.com/ArchiveBox/ArchiveBox#quickstart)
  * but before starting
    * ``sudo apt-get install python3``
    * ``sudo apt-get install python3-pip``
  * and if you got a problem (infinite fetching)
    * CTRL-C (exit)
    * ``sudo npm install -g yarn``
    * ``yarn install`` (in the archivebox directory)

You can run the web server with ``archivebox server 0.0.0.0:8000`` and open ``http://127.0.0.1:8000/`` in your browser.

* **me**

After trying to use archive.org (but it's slow, and I'm looking for a file rather than this). I tried to use "ArchiveBox", but this was still not what I wanted (taking too long to archive, too tiring to use). 


I'm  using [the SingleFile plugin](https://github.com/gildas-lormeau/SingleFile#install). It's saving a page as one HTML file (like you should with CTRL-S) but you only have 1 file. And the result is better, like saving a website using CTRL-S makes the JavaScript executed each time you open the page (and sometimes the pages are not properly rendered), while this plugin is creating a fixed copy of what you saw when you asked for one.