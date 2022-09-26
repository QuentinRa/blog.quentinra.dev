# Attacks on websites

...

<hr class="sl">

## Cookies

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

Cookies are used to store data. Most of the time, they are encrypted, but if they can be decrypted, then someone can change the value, and re-encrypt them.

**How**: use F-12 to open the console, go to Application, then **Cookies**.

* <i class="bi bi-shield-exclamation"></i> A cookie is just a value associated with a file on the server side. If someone manage to get this "value", for instance for an authentication cookie, then they can bypass 2FA/... and login.
* <i class="bi bi-shield-minus"></i> You may try to decrypt a cookie using [Cyberchef](https://gchq.github.io/CyberChef/)

<hr class="sr">

## Forms

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

Forms are an entrypoint for way too many attacks. They can use bruteforce to guess username/password; try injecting some queries to expose your database, or execute malicious code; simply overusing your quota of sms/emails/... to make your services unavailable; or alter some request to get unlimited funds.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Open the console, and try to look for hidden input fields. Sometimes, you can do some stuff to break the server-side. You can also easily bypass JavaScript checks. You can also make a JavaScript extension to BruteForce forms (it's quite easy).
* <i class="bi bi-info-square" style="background:#ffd700"></i> See **BurpSuite** to intercept requests, bruteForce forms, repeat requests...

<hr class="sl">

## Cross Site Scripting (XSS)

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

XSS injections, sometimes called JavaScript injections, is an attack in which a hacker execute some malicious JavaScript  inside someone's else browser. To protected your website, you should filter JavaScript, along with using modern headers/settings that can prevent such things from happening. Nonetheless, there are lots of ways to inject JavaScript in a webpage, you might want to check this long [cheatsheet of ways of evading XSS filters by OWASP here](https://cheatsheetseries.owasp.org/cheatsheets/XSS_Filter_Evasion_Cheat_Sheet.html).

<details class="details-e">
<summary>Stored XSS</summary>

The hacker submitted some JavaScript in a form (ex: username of an account, a comment). Then, anyone loading this page may execute the JavaScript.

**Example**

* The "profile.php" below is a vulnerable script which is not "filtering" the value of `to`

```php
<?php
function get_user_from_id($id): string {
    // consider that this values was loaded from the database,
    // and this is what the user submitted when creating his account
    return "Marie<script>alert('Stored XSS')</script>";
}

$username = get_user_from_id($_GET['id']);
echo "Show the profile of ".$username;
```

* Then, anyone loading `http://localhost/profile?id=5`, will execute the malicious JavaScript

</details>

<details class="details-e">
<summary>Reflected XSS</summary>

The hacker is dynamically loading the JavaScript, usually in a GET form: inside the URL, there is some malicious JavaScript, and when the page is loaded using the malicious JavaScript, then it will be executed.

**Example**

* Here, the script say_hello is a vulnerable script like this, which is not "filtering" the value of `to`

```php
<?php
$username = $_GET['to'];
echo "Hello, ".$username;
```

* Then, anyone clicking on this link will execute the malicious XSS (just a popup)  `http://localhost/say_hello.php?to=Marie<script>alert('Reflected XSS')</script>`

> **Note**: in this somewhat stupid example, we can see that there is a script inside the URL, but there is a lot of ways to hide it, for instance making the URL quite long, and because the page is showing "Hello Marie", people won't see at first glance that they were attacked.
</details>

<details class="details-e">
<summary>Some well-known XSS payloads</summary>

[XSS Payload List (GitHub)](https://github.com/payloadbox/xss-payload-list)

```html
<script>/*some malicious JavaScript*/</script>

<a onmouseover="/*some malicious JavaScript*/">some link</a>

<img src="https://link/to/malicious.js" alt="something making it not obvious"/>
```
</details>

You may use these in PHP, to avoid filtering in cases where you know that any form of HTML should be forbidden

```php
# remove tags
echo "Hello, ".strip_tags($username);

# replace "<" and ">" with their HTML code, so that the code is not executed
echo "Hello, ".htmlentities($username);

# this is the same as htmlentities, but it may show weird characters in old browsers,
# as some characters will be escaped twice
echo "Hello, ".htmlspecialchars($username);
```

<hr class="sr">

## Common Gateway Interface (CGI)

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

Some computers don't use PHP to load some websites, and relies on CGI scripts. Basically, CGI is a way of interfacing between a client requesting a webpage, and another language (Java/Python/Perl/...) proving the webpage (as you would in PHP). CGI scripts are usually stored in `/cgi-bin/`.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> If you try `/cgi-bin/some_random_text_for_404`, then a vulnerable server may answer `bash: some_random_text_for_404: command not found`.
*  <i class="bi bi-info-square" style="background:#7cfc00"></i> If you can identify a script such as `/cgi-bin/load.sh`, then you may try `/cgi-bin/load.sh&systeminfo` to get information on the system <small>(systeminfo is a command on Windows, you can try other commands)</small> 

<hr class="sr">

## Server-Side Request Forgery (SSRF)

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

Sometimes, a website may rely on another service to provide its service. in a SSRF attack, an attacker will use the website, which is *too much* trusted by the service used, to attack the other service. The goal is the

* enumerate open ports to detect services 
* steal files
* access internal services

As you could guess, reducing the trust between the two services, or/and limiting what the user could do with the expose services, may help avoiding this attack. Usually if the web, there is way for us to insert a URL. You can try to intercept the request, and make the other services work on something he should not work on such as

* `file:///etc/passwd`
* `http://127.0.0.1`
* `http://127.0.0.1:22`

For instance, in PHP, you can use `file_get_content(...)` to GET the content of something. Now, if instead of getting the content of an external source, the user ask for one of the payload above, he could steal some files, or see ports that are enabled if there are (useful?) error messages.