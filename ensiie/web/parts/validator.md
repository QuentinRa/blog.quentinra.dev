# W3Validator

[Go back](..)

W3Validator is used to verify if you are writing your code following the W3C good practices/standard.

At the ENSIIE, to check your pages, you must copy and paste the code here: <https://validator.w3.org/#validate_by_input> since the validation by URL isn't available (because a login is required). You can do the same for your CSS at <https://jigsaw.w3.org/css-validator/#validate_by_uri>.

<hr class="sl">

## Logo

In a normal website, you can add a logo that will redirect to W3Validator with your page in it, but that's **by URL**, so for us, that's pretty useless.

```html
<p>
    <a href="https://validator.w3.org/check?uri=referer"
    target="_blank" rel="noopener"><img
            src="http://www.w3.org/Icons/valid-xhtml10"
            alt="Valid XHTML 1.0!" height="31" width="88" /></a>
</p>
```

Source: <https://www.w3.org/QA/Tools/Icons>, <https://validator.w3.org/docs/help.html#icon>

**Anyone can use this logo so that not something used to show that you passed the test, but something that can allow someone to easily check your page on W3Validator**.

Note: some may notice the "referer" (not my typo 😬). When you're opening a link, the new page knows what was the previous page we were on. Personally, I don't like that, so you can do

```html
<p>
    <a href="https://validator.w3.org/check?uri=URL_OF_THE_CURRENT_PAGE"
    target="_blank" rel="noopener noreferrer"><img
            src="http://www.w3.org/Icons/valid-xhtml10"
            alt="Valid XHTML 1.0!" height="31" width="88" /></a>
</p>
```