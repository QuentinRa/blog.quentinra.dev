## W3Validator

[Go back](..)

W3Validator is used to verify if you are writing your code using good practices.
At ENSIIE, to check your pages, you must copy and paste le code here :
<https://validator.w3.org/#validate_by_input)> since URL will not work (because
of login). You can do the same for css <https://jigsaw.w3.org/css-validator/#validate_by_uri>.

In normal website, you can add a logo

```html
<p>
    <a href="https://validator.w3.org/check?uri=referer"><img
            src="http://www.w3.org/Icons/valid-xhtml10"
            alt="Valid XHTML 1.0!" height="31" width="88" /></a>
</p>
```

(Source: <https://www.w3.org/QA/Tools/Icons>, <https://validator.w3.org/docs/help.html#icon>)

that will redirect to W3Validator and your page in it, but that's by URL so
for us, that's pretty useless.

**Anyone can use this logo so that not something used to show that you passed
the test, but something that can allow someone to easily check your page
on W3Validator**.