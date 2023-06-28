# mpdf

<div class="row row-cols-md-2"><div>

[mpdf](https://github.com/mpdf/mpdf) (4.0k ⭐) is a library to create PDF files.

```ps
$ composer require mpdf/mpdf
```

You can use the given code sample to test your installation.

```php!
<?php

require_once __DIR__ . '/vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf();
$mpdf->WriteHTML('<h1>Hello world!</h1>');
$mpdf->Output();
```
</div><div>

Example using HEREDOC and downloading a file:

```php!
$mpdf = new \Mpdf\Mpdf();
$mpdf->WriteHTML(
    <<<HTML
<!-- you can use PHP variables and there is no need to
escape quotes within a HEREDOC clause -->
HTML
);
// Download the PDF as a file, close the tab
$mpdf->OutputHttpDownload("filename");
```
</div></div>