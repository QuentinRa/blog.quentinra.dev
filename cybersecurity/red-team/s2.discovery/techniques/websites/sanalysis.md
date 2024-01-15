# Static analysis

[![activerecon](../../../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

For starter, you may use <kbd>CTRL+U</kbd> or Right-click and "View page source".

<hr class="sep-both">

## HTML tags

[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
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
[![picklerick](../../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cap](../../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![http_directory_indexing](../../../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)

<div class="row row-cols-lg-2"><div>

To ensure you visited every page, you may want to check every link on every page. You can use this command:

```javascript!
// list every element with a href
document.querySelectorAll('*[href]') 
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
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![html_source_code](../../../../_badges/rootme/web_server/html_source_code.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTML-Source-code)
[![http_directory_indexing](../../../../_badges/rootme/web_server/http_directory_indexing.svg)](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Directory-indexing)
[![phpbb_install_files](../../../../_badges/rootme/web_server/phpbb_install_files.svg)](https://www.root-me.org/en/Challenges/Web-Server/Install-files)

<div class="row row-cols-lg-2"><div>

I'm using this snippet to grab every HTML comments.

```javascript!
document.querySelector('html').innerHTML.replaceAll('\n', ' ').match(/<!--.*?-->/g)
```

Since newlines are removed, you can use the modified version below if you still need them:

```javascript!
document.querySelector('html').innerHTML.replaceAll('\n', '/n').match(/<!--.*?-->/g).map(x => x.replaceAll('/n', '\n'))
```
</div><div>

You may append the snippet this to remove empty comments:

```javascript!
[...].filter(r => r !== "<!---->")
```

There are more complex regexes if you want, such as [rt/96517](https://www.regextester.com/96517).
</div></div>

<hr class="sep-both">

## Analyze the javascript

[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![javascript_authentication](../../../../_badges/rootme/web_client/javascript_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication)
[![javascript_authentication_2](../../../../_badges/rootme/web_client/javascript_authentication_2.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication-2)
[![javascript_source](../../../../_badges/rootme/web_client/javascript_source.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Source)

<div class="row row-cols-lg-2"><div>

You may use the console debugger, after adding a breakpoint in the JavaScript, to analyze the javascript code, if needed.

➡️ It's hard, so feel free to explore other techniques first.
</div><div>
</div></div>