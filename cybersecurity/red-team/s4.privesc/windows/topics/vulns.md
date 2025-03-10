# Unpatched Vulnerabilities

<div class="row row-cols-lg-2"><div>

The following tools are specifically designed to detect unpatched Windows Vulnerabilities given Windows Build Version.

* [wesng](https://github.com/bitsadmin/wesng) <small>(4.2k ⭐, work locally from an output file 🙌)</small>
* [Watson](https://github.com/rasta-mouse/Watson) <small>(1.6k ⭐, 2020 🪦)</small>
* [Sherlock](https://github.com/rasta-mouse/Sherlock) <small>(1.9k ⭐, 2018 🪦)</small>
* [Windows-Exploit-Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester) <small>(4.0k ⭐, 2017 🪦)</small>

You can use `wmic qfe` or `Get-HotFix | ft -AutoSize` to list the last installed hotfixes.
</div><div>

Using [wesng](https://github.com/bitsadmin/wesng), you either `systeminfo` output or `missingkbs.vbs`?

```ps
PS> systeminfo > output.txt
```

Upload either output on your host and analyze it:

```ps
$ wes.py --update         # update local database
$ wes.py [...] output.txt # process the selected tool output
```
</div></div>