# Website penetration checklist

<div class="row row-cols-md-2"><div>

Based on the topics in [Discovery > Tools and methods](../index.md#tools-and-methods-), a checklist would be <small>(work in-progress)</small>:

* [ ] [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) scan to find webservers
* [ ] [website mapping](../techniques/mapping.md) to find links to investigate
* [ ] [forced browsing](../techniques/forced_browsing.md) to find more links to investigate
* [ ] [robots.txt/sitemap.xml](../techniques/sanalysis.md#links) to find more links to investigate
* ...
</div><div>

On each page found:

* [ ] [Find hidden comments/tags](../techniques/sanalysis.md)
* [ ] Test forms/parameters
  * to find useful/vulnerable [HTTP Headers](../techniques/sanalysis.md#analyze-the-network)
  * to find basic vulnerabilities [SQLi/XSS/LFI/...](../../s3.exploitation/index.md#common-techniques)
  * [Fuzz](/cybersecurity/red-team/s2.discovery/techniques/fuzzing.md) weak/default accounts
  * with compromised accounts (if any) to check for reuse
  * ...
* [ ] Try testing the page under different contexts <small>(logged or anonymous, correct cookies vs poisonous cookies, etc.)</small>
* ...
</div></div>