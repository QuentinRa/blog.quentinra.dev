# Heredoc

<div class="row row-cols-md-2"><div>

A [here document](https://en.wikipedia.org/wiki/Here_document), which is commonly shortened to heredoc is a multiline string literal syntax supported by multiple programming languages such as **Bash**, **PHP**, **Ruby**, etc.

It usually starts with `<<` followed by some `DELIMITER`. The string is closed when we reach the next occurrence of `DELIMITER`.
</div><div>

**Bash example** 🔥

```bash
base64 -d <<EOF
YWFhYQ==
EOF
```

**PHP example** 🔥

```php
$some_variable = <<<EOF
We can use both ' and ".
EOF;
```
</div></div>