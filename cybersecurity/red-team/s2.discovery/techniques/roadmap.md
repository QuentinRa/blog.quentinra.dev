# Website penetration checklist

<div class="row row-cols-md-2"><div>

Based on the topics in [Discovery > Tools and methods](../index.md#tools-and-methods-), a checklist would be <small>(work in-progress)</small>:

* [ ] [nmap](../tools/nmap.md) scan to find webservers
* [ ] [website mapping](../techniques/mapping.md) to find links to investigate
* [ ] [forced browsing](../techniques/forced_browsing.md) to find more links to investigate
* [ ] [robots.txt/sitemap.xml](../techniques/code_analysis.md#links) to find more links to investigate
* ...
</div><div>

On each page found:

* [ ] [Find hidden comments/tags](../techniques/code_analysis.md)
* [ ] Test forms 
  * to find useful/vulnerable [HTTP Headers](../techniques/code_analysis.md#analyze-the-network)
  * to find [SQLi/XSS/...](../../s3.exploitation/index.md#common-techniques)
  * ...
* ...
</div></div>