# Portable Executable (PE)

<div class="row row-cols-lg-2"><div>

The [Portable Executable](https://en.wikipedia.org/wiki/Portable_Executable) (PE) file format is mainly used on Windows for executable files (.exe) or dynamically linked libraries (DLL).

Common PE sections include:

* `.text`: executable code
* `.data`: variables
* `.rdata`: constants
* `.pdata`: imported functions
* `.pdata`: exported functions

These can be visualized from [pestudio](https://pestudio.en.lo4d.com/windows).
</div><div>

We can examine DLL imports with [CFF Explorer](https://ntcore.com/?page_id=388) <small>(👻)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `MZ` (4D 5A) indicates an executable file
* [0xrick's blog](https://0xrick.github.io/win-internals/pe1/)
</div><div>
</div></div>