# Regular expressions (regex)

<div class="row row-cols-md-2"><div>

**Regular expressions** (`expressions régulières`), commonly referred to as **regex**, are an enhanced version of [glob-patterns](/operating-systems/linux/knowledge/index.md#glob-patterns) and present in most, if not all languages.

🎯 Everything learned in glob-patterns is still available in regexes, so it won't be covered. ⚠️ The symbol for "one character" is now `.` <small>(dot)</small> and not `?` <small>(question mark)</small> which was given a new meaning.
</div><div>

**Practice** 🧪

* [regex101](https://regex101.com/) (online tester)
* [regexr](https://regexr.com/) (online tester)
* [![TryHackMe catregex](../../../cybersecurity/_badges/thm/catregex.svg)](https://tryhackme.com/room/catregex) (a bit hard)
</div></div>

<hr class="sep-both">

## Enhancements

<div class="row row-cols-md-2"><div>

Some new symbols were introduced:

<table class="table table-bordered table-striped border-dark">
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

Regex introduced **metacharacters** which are shortcut to these charsets:

* `\d` which is `[0-9]`
* `\D` which is `[^0-9]`
* `\w` which is `[a-zA-Z0-9_]`
* `\W` which is `[^a-zA-Z0-9_]`
* `\s` which is `[\t\n\r\f\v]`
* `\S` which is `[^\t\n\r\f\v]`

</div><div>

You can apply a symbol on a group by wrapping them inside parenthesis. For instance, `(ab)+(cd|e)?`. 

Many languages and commands allow us to use **capture groups** 🚩. These are groups wrapped in `\(` and `\)`. It allow us to extract parts of the matching regex, usually because we used a regex to extract data.

For instance, this regex matches a line with a least 3 characters (`.{3}`), followed by a possible empty string (`.*`). We want to know which were the 3 characters, so we wrap them in a capture group.

```ruby
^\(.{3}\).*$
```

The process to get back the capture group is different everywhere. It may be `$1` or `\1`, while it could also be an array returned by a function.

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