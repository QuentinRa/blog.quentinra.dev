# SQLMap

[![sqlilab](../../../_badges/thm/sqlilab.svg)](https://tryhackme.com/room/sqlilab)

<div class="row row-cols-md-2"><div>

From the [SQLMap GitHub Repository](https://github.com/sqlmapproject/sqlmap) (25k ⭐): "sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers.".


> [SQLMap CheatSheet](https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet) (2017)<br>
> [SQLMap CheatSheet](https://www.daronwolff.com/sqlmap-cheetsheet/) (2020)

</div><div>

You can use **SQLMap with BurpSuite**. Once you intercepted a request in BurpSuite, right-click on it, and use **Save item**. Then, in SQLMap, use `-r /path/to/your/saved/item`. If your antivirus is blocking SQLMap, then doing that *may* bypass it.
</div></div>
