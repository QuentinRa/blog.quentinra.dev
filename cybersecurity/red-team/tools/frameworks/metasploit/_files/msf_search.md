# Searching exploits - msfconsole

[Go back](../index.md#msfconsole)

<div class="row row-cols-lg-2"><div>

The first thing you want to do is to find exploits <small>(to perform an attack)</small> or auxiliaries <small>(to see if the target is vulnerable)</small>.

**Common usages** 🪴

```shell!
msf6> search xxx yyy # search by terms
msf6> search CVE-YEAR-ID # CVE
msf6> search exploit/xxx/yyy/ # module
msf6> search type:exploit [...] # ex: only exploits...
msf6> search cve:year [...] # only disclosed in year
```

</div><div>

**Examples** 🔥

```shell!
msf6> search apache tomcat
msf6> search exploit/linux/local/
msf6> search type:auxiliary cve:2022 wordpress
msf6> search eternalblue pool
#  Name  Disclosure Date  Rank     Check  Description
-  ----  ---------------  ----     -----  -----------
0  exploit/windows/smb/ms17_010_eternalblue  [...]
```

⚠️ The first column is called **module search index**, while the second is called **module name** on this website.
</div></div>