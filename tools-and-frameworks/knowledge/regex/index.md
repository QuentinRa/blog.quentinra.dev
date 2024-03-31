# Regular expressions (regex)

[![catregex](../../../cybersecurity/_badges/thm/catregex.svg)](https://tryhackme.com/room/catregex)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day16.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

**Regular expressions** (`expressions régulières`), commonly referred to as **regex**, are an enhanced version of [glob-patterns](/operating-systems/linux/_knowledge/index.md#glob-patterns) and are present in most, if not all languages.

🎯 Everything learned in glob-patterns is still available in regexes, so it won't be covered. ⚠️ The symbol for "one character" is now `.` <small>(dot)</small> and not `?` <small>(question mark)</small> which was given a new meaning.
</div><div>

**Practice** 🧪

* [regex101](https://regex101.com/) (online tester)
* [regexr](https://regexr.com/) (online tester)
</div></div>

<hr class="sep-both">

## Enhancements

<div class="row row-cols-lg-2"><div>

Some new symbols were introduced:

<table class="table table-bordered border-dark table-dark bg-transparent">
<thead>
<tr><th></th><th>Description</th></tr>
</thead>
<tbody>

<tr><td><code>x?</code></td><td>an optional character 'x'</td></tr>
<tr><td><code>x+</code></td><td>at least x times this character</td></tr>
<tr><td><code>^x</code></td><td>lines starting with x</td></tr>
<tr><td><code>x$</code></td><td>lines ending with x</td></tr>
<tr><td><code>(x|y)</code></td><td>either x or y</td></tr>
<tr><td><nobr><code>x{n,m}</code></nobr><br><nobr><code>x{n,}</code></nobr><br><nobr><code>x{,m}</code></nobr><br><nobr><code>x{n}</code></nobr></td><td>at least $n$ times x, up to $m$ times, leave either empty if no limit.<br>The last one means "exactly $n$" times.</td></tr>
</tbody></table>

Regex introduced **metacharacters** which are shortcuts to these charsets:

* `\d` which is `[0-9]`
* `\D` which is `[^0-9]`
* `\w` which is `[a-zA-Z0-9_]`
* `\W` which is `[^a-zA-Z0-9_]`
* `\s` which is `[\t\n\r\f\v]`
* `\S` which is `[^\t\n\r\f\v]`

</div><div>

You can apply a symbol to a group by wrapping it inside a parenthesis. For instance, `(ab)+(cd|e)?`. 

Many languages and commands allow us to use **capture groups** 🚩. These are groups wrapped in `\(` and `\)`. It allows us to extract parts of the matching regex, usually because we used a regex to extract data.

For instance, this regex matches a line with at least 3 characters (`.{3}`), followed by a possibly empty string (`.*`). To know what the three characters are, we can wrap them up in a capture group.

```ruby
^\(.{3}\).*$
```

The process to get the capture group back is different everywhere. It may be `$1` or `\1`, while it could also be an array returned by a function.

```ps
$ echo -e "abc\nde\nfeghi\nklmnop" > example
$ cat example
abc
de
feghi
klmnop
# replace the match with the first 3 followed by "..."
$ sed "s/^(.\{3\}).*$/\1.../g" example
abc...
de
feg...
klm...
```
</div></div>