# File analysis

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

File analysis refer to analyzing the code of the website, both statically, and dynamically, while trying to find a flaw.

For starter, you may do a static analysis of the source HTML page. Use <kbd>CTRL+U</kbd> or Right-click and "View page source".
</div><div>
</div></div>

<hr class="sep-both">

## Hidden HTML tags

<div class="row row-cols-md-2"><div>

This sample of script below is fetching every HTML tag that is hidden aside from some uninteresting ones.

➡️ Find hidden input fields...
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

[![picklerick](../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)

<div class="row row-cols-md-2"><div>

To ensure you visited every page, you may want to check every link on every page. You can use this command:

```javascript!
// list every element with a href
document.querySelectorAll('*[href]') 
```

As this process is done by search engines, websites may have a file `/sitemap.xml` with every page of their website, but there is no guaranty that all pages were added inside.
</div><div>

There is also a file `/robots.txt` with the pages that robots should not crawl, with may indicate vulnerable/sensitive pages.

**Both files may not exist**: `https://example.com/robots.txt` not found.
</div></div>

<hr class="sep-both">

## Comments

<div class="row row-cols-md-2"><div>

I'm using this version to grab every HTML comments.

```javascript!
document.querySelector('html').innerHTML.replaceAll('\n', ' ').match(/<!--.*?-->/g)
```

Since newlines are removed, you may use the patch below if you still need them:

```javascript!
document.querySelector('html').innerHTML.replaceAll('\n', '/n').match(/<!--.*?-->/g).map(x => x.replaceAll('/n', '\n'))
```
</div><div>

You may append this function call to remove empty comments

```javascript!
[...].filter(r => r !== "<!---->")
```

There are more complex regexes if you want, such as [rt/96517](https://www.regextester.com/96517).
</div></div>

<hr class="sep-both">

## Dynamic analysis

<div class="row row-cols-md-2"><div>

#### Analyze the javascript

You may use the console debugger, after adding a breakpoint in the JavaScript, to analyze the javascript code, if needed.

➡️ It's tiring so feel free to explore other techniques first.
</div><div>

#### Analyze the network

After opening the network tab of your console, every HTTP request is listed inside. You can see where the forms are sent, and examine the headers of every request.

🔑 The server <small>(Nginx, Apache, IIS, Node.js)</small> and the version may be exposed in the headers.

👉 You can use the network tab to tune requests and re-send them.
</div></div>