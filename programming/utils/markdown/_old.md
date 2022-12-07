# HTML in Markdown

You can use HTML in Markdown. But beware, you can't use Markdown **inside** HTML tags unless you add a blank line

```markdown
<div>

I can write markdown here like <https://example.com/>,
because I added a blank line.
</div>
```

Here are some things you can do using HTML

* [centering something](features/centering.md)
* [dropdown](features/dropdown.md)

And here are some HTML tags you may use

| Tag | Preview |
| ------ | ------ |
| <b>s</b> (strikethrough) | <s>word</s> |
| <b>u</b> (underline) | <u>word</u> |
| <b>kbd</b> | <kbd>CTRL+X</kbd> |
| <b>sup</b> (used in footnotes) | <sup>[1]: From XXX</sup><br><sup>[2]: Notation used in XXX</sup> |
| <b>dl</b>, <b>dt</b> (keyword), and <b>dd</b> (definition). <br> (the definition is usually indented, so it looks better) | <dl><dt>Keyword</dt><dd>definition</dd></dl> |
| <b>abbr</b> (show a note on hover) | <abbr title="Shown when hovered">some text</abbr> |
| <b>mark</b> | This <mark>word</mark> has a yellow background. |
| <b>ruby</b> and <b>rt</b> (put some text above another one) | <ruby>Memorize<rt>version 5.0</rt></ruby> |
| <b>progress</b> | <progress value="50" max="100"></progress> 50% |

<hr class="sr">

## Summary

| Markdown | HTML |
| ------ | ------ |
| \#\# Title | &lt;h2&gt;title&lt;/h2&gt; |
| \*\*bold\*\* | &lt;b&gt;bold&lt;/b&gt;|
| \*italic\* | &lt;i&gt;bold&lt;/i&gt;|
| \~\~crossed text\~\~ | &lt;s&gt;strikethrough&lt;/s&gt;|
| a list | &lt;ul&gt;, &lt;ol&gt;, and &lt;li&gt; |
| \`code\` | &lt;code&gt;code&lt;/code&gt; |
| code-block | &lt;pre&gt;&lt;code&gt;code&lt;/code&gt;&lt;/pre&gt; |
| \[link](url)|&lt;a href="url"&gt;link&lt;/a&gt;|
| \!\[alt](url)|&lt;img src="url" alt="alt"&gt;|
| \> text | &lt;blockquote&gt;text&lt;/blockquote&gt; |
| \--- | &lt;hr&gt; |
| new line | &lt;br&gt; |

<hr class="sl">

## Sources

* <https://www.markdownguide.org/basic-syntax/>
* <https://www.markdowntutorial.com/>
* <https://www.markdownguide.org/getting-started/>
* [comments in MD](https://stackoverflow.com/questions/4823468/comments-in-markdown)
* <https://www.madoko.net/>
* <https://guides.github.com/features/mastering-markdown/>
* <https://sindresorhus.com/github-markdown-css/>
* <https://www.jetbrains.com/help/hub/Markdown-Syntax.html>
* <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet>