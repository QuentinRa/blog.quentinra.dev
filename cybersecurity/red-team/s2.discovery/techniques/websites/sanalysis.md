# Static analysis

[![activerecon](../../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

For starter, you may use <kbd>CTRL+U</kbd> or Right-click and "View page source".

<hr class="sep-both">

## HTML tags

[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![ctfcollectionvol1](../../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![lianyu](../../../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![easypeasyctf](../../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![html_disabled_buttons](../../../../_badges/rootme/web_client/html_disabled_buttons.svg)](https://www.root-me.org/en/Challenges/Web-Client/HTML-disabled-buttons)

<div class="row row-cols-lg-2"><div>

A webpage often have hidden or disabled HTML tags.

This sample script below is fetching every HTML tag that is hidden aside from some uninteresting ones.

➡️ Find hidden input fields, hidden content...
</div><div>

```javascript!
Array.from(document.querySelectorAll('*')).filter(x => {
    // There were not displayed to the user in the first place
    if (x.nodeName === "HEAD" || x.nodeName === "META"
        || x.nodeName === "LINK" || x.nodeName === "STYLE"
        || x.nodeName === "SCRIPT" || x.nodeName === "TITLE") return false
    // hidden hidden="" hidden="hidden"
    if (x.hidden === true) return true
    // style (visibility/display/font-size)
    const style = window.getComputedStyle(x)
    if (style.visibility === 'hidden') return true
    if (style.display === 'none') return true
    if (style.fontSize === "0px") return true
    return false
}).map(x => x.outerHTML)
```
</div></div>

<hr class="sep-both">

## Links

[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day16.svg)](https://tryhackme.com/room/adventofcyber2)
[![picklerick](../../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![gamingserver](../../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![surfer](../../../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cap](../../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![http_directory_indexing](../../../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)

<div class="row row-cols-lg-2"><div>

To ensure you visited every page, you may want to check every link on every page. You can use this command:

```javascript!
// list every element with a href
document.querySelectorAll('*[href]') 
```

Another way is to use [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-crawl-module) or [ZAProxy](/cybersecurity/red-team/tools/utilities/proxies/zap/index.md).

```ps
$ # crawl internal URLs (same domain)
$ onectf crawl -u https://example.com/
```
</div><div>

As this process is done by search engines, websites may have a file `sitemap.xml` with every page of their website, but there is no guaranty that all pages were added inside.

👉 Common URL if present: `https://example.com/sitemap.xml`

There is also a file `robots.txt` with the pages that robots should not crawl/index, with may indicate vulnerable/sensitive pages.

👉 Common URL if present: `https://example.com/robots.txt`
</div></div>

<hr class="sep-both">

## Comments

[![howwebsiteswork](../../../../_badges/thmp/howwebsiteswork.svg)](https://tryhackme.com/room/howwebsiteswork)
[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![picklerick](../../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![wgelctf](../../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![gamingserver](../../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![cyborgt8](../../../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![html_source_code](../../../../_badges/rootme/web_server/html_source_code.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTML-Source-code)
[![http_directory_indexing](../../../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)
[![phpbb_install_files](../../../../_badges/rootme/web_server/phpbb_install_files.svg)](https://www.root-me.org/en/Challenges/Web-Server/Install-files)

<div class="row row-cols-lg-2"><div>

You can use JavaScript to fetch every HTML comment ([rt/96517](https://www.regextester.com/96517)):

```js!
document.querySelector('html').innerHTML.replaceAll('\n', ' ').match(/<!--.*?-->/g)
```
```js!
document.querySelector('html').innerHTML.replaceAll('\n', '/n').match(/<!--.*?-->/g).map(x => x.replaceAll('/n', '\n'))
```

You may append the snippet this to remove empty comments:

```javascript!
[...].filter(r => r !== "<!---->")
```
</div><div>

You can use [onectf](/cybersecurity/red-team/tools/frameworks/onectf/index.md#onectf-crawl-module) to crawl a website and display HTML comments:

```ps
$ onectf crawl -u https://example.com/ --pc
```
</div></div>

<hr class="sep-both">

## Analyze the javascript

[![server_side_attacks](../../../../_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![javascript_authentication](../../../../_badges/rootme/web_client/javascript_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication)
[![javascript_authentication_2](../../../../_badges/rootme/web_client/javascript_authentication_2.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication-2)
[![javascript_source](../../../../_badges/rootme/web_client/javascript_source.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Source)

<div class="row row-cols-lg-2"><div>

You may use the console debugger, after adding a breakpoint in the JavaScript, to analyze the javascript code, if needed.

📚 Some developers might use well-known script name to hide their scripts such as `jquery.js`.

➡️ It's hard, so feel free to explore other techniques first.
</div><div>
</div></div>