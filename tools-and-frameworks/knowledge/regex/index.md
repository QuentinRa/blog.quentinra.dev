# Regular expressions (regex)

[![catregex](../../../cybersecurity/_badges/thm/catregex.svg)](https://tryhackme.com/room/catregex)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day16.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Regular expressions, commonly referred to as **regex**, are an enhanced version of Unix [glob-patterns](/operating-systems/linux/_knowledge/index.md#glob-patterns). They are commonly used by application to locate and/or extract a specific pattern in a string.

<table class="table table-bordered border-dark table-dark bg-transparent">
<thead>
<tr><th>Wildcards</th><th>Description</th></tr>
</thead>
<tbody>

<tr><td><code>x</code></td><td>matches the character 'x'</td></tr>
<tr><td><code>.</code></td><td>matches one character</td></tr>
<tr><td><code>[abc]</code></td><td>one character which is either a, b, or c.</td></tr>
<tr><td><code>[^abc]</code></td><td>any character which is not a, nor b, nor c.</td></tr>
</tbody></table>

There are some symbols that are applied to the preceding regex. For instance `(a|b)?` means "optionally" "a or b".

<table class="table table-bordered border-dark table-dark bg-transparent">
<thead>
<tr><th></th><th>Description</th></tr>
</thead>
<tbody>

<tr><td><code>?</code></td><td>optionally matches the preceding element</td></tr>
<tr><td><code>*</code></td><td>matches the preceding element 0 or more times</td></tr>
<tr><td><code>+</code></td><td>matches the preceding element 1 or more times</td></tr>
<tr><td><code>^regex</code></td><td>matches lines starting with the succeeding regex</td></tr>
<tr><td><code>regex$</code></td><td>matches lines ending with the preceding regex</td></tr>
<tr><td><code>(r1|r2|...)</code></td><td>matches one of the provided regexes</td></tr>
<tr><td><nobr><code>r{n,m}</code></nobr><br><nobr><code>r{n,}</code></nobr><br><nobr><code>r{,m}</code></nobr><br><nobr><code>r{n}</code></nobr></td><td>matches if the preceding regex if it is at least present $n$ times and up to $m$ times.<br>
Leaves either empty if there is no min/max.<br>The last format means "exactly $n$" times.</td></tr>
</tbody></table>
</div><div>

Regex introduced shortcuts for charsets called **metacharacters**:

* `\d` which is `[0-9]`
* `\D` which is `[^0-9]`
* `\w` which is `[a-zA-Z0-9_]`
* `\W` which is `[^a-zA-Z0-9_]`
* `\s` which is `[\t\n\r\f\v]`
* `\S` which is `[^\t\n\r\f\v]`

Regexes also introduced the notion of **capture groups** to separately extract a part of the match. These groups are wrapped in `\(` and `\)`.

```diff
-^.{3}.*$
+^\(.{3}\).*$
```

The process to get the capture group back is implementation specific. It may be `$1` or `\1`, while it could also be an array like in Python.

```ps
$ cat example
abc
de
feghi
# match lines with >=3 chars and replace the tail with "..."
$ sed "s/^(.\{3\}).*$/\1.../g" example
abc...
de
feg...
```

**Practice** 🧪

* [regex101](https://regex101.com/) (online tester)
* [regexr](https://regexr.com/) (online tester)
* [cyrilex](https://extendsclass.com/regex-tester.html) (online visual tester)
</div></div>