# metasploit

<hr class="sl">

## Introduction

<div class="row row-cols-md-2"><div>

The [Metasploit Framework](https://github.com/rapid7/metasploit-framework) is a penetration testing framework that you can use to test your systems.
</div><div>

...
</div></div>

<hr class="sr">

## msfconsole

<div class="row row-cols-md-2"><div>

This is a console in which you can search an exploit, test if the target is vulnerable, and use the exploit on the target.

Start the console

```bash
$ msfconsole -q
msf6 >
```

Search an exploit. It returns a list of modules, with an index, and a name, that can be "used" later.

```bash
msf6 > search word1 word2 # simple search for words in name/description
msf6 > search service # ex: apache, ftp...
msf6 > search module # ex: exploit/windows/http/xxx
msf6 > search CVE-YEAR-ID
```

Use an exploit

```bash
msf6 > use module_name # ex: exploit/windows/http/xxx
msf6 > use module_index # ex: 0
```
</div><div>

See the options required by the module. Find properties marked "required", but with no default value.

```bash
msf6 exploit('module_used') > options
msf6 exploit('module_used') > show options # same
# set an option
msf6 exploit('module_used') > set <option> <value>
```

<details class="details-e">
<summary>Usual modules options</summary>

* `set LHOST <value>`: ip of the attacker
* `set RHOST(s) <value>`: ips of the defenders
* `set RPORT <value>`: port of the defender
* `set TARGETURI <value>`: an URI (ex: location to a script)
* `set use <module>`: use another module
* `set PAYLOAD <value>`: use another module
</details>

Once ou filled everything you need to, run the exploit.

```bash
msf6 exploit('module_used') > run
msf6 exploit('module_used') > exploit # same
```
</div></div>