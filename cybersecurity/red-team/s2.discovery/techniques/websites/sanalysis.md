# Static analysis

[![ctfcollectionvol1](../../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![lianyu](../../../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![easypeasyctf](../../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)

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

## Analyze the javascript

[![server_side_attacks](../../../../_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![pythonplayground](../../../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)
[![glitch](../../../../_badges/thm-p/glitch.svg)](https://tryhackme.com/r/room/glitch)
[![javascript_authentication](../../../../_badges/rootme/web_client/javascript_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication)
[![javascript_authentication_2](../../../../_badges/rootme/web_client/javascript_authentication_2.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Authentication-2)
[![javascript_source](../../../../_badges/rootme/web_client/javascript_source.svg)](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Source)

<div class="row row-cols-lg-2"><div>

You may use the console debugger, after adding a breakpoint in the JavaScript, to analyze the javascript code, if needed.

📚 Some developers might use well-known script name to hide their scripts such as `jquery.js`.

➡️ It's hard, so feel free to explore other techniques first.
</div><div>
</div></div>