# Unpatched Vulnerabilities

<div class="row row-cols-lg-2"><div>

The following tools are specifically designed to detect unpatched Windows Vulnerabilities given Windows Build Version.

* [wesng](https://github.com/bitsadmin/wesng) <small>(3.9k ⭐, work locally from an output file 🙌)</small>
* [Watson](https://github.com/rasta-mouse/Watson) <small>(1.5k ⭐, 2020 🪦)</small>
* [Sherlock](https://github.com/rasta-mouse/Sherlock) <small>(1.8k ⭐, 2018 🪦)</small>
* [Windows-Exploit-Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester) <small>(3.8k ⭐, 2017 🪦)</small>

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