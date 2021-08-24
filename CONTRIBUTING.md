# How to contribute

First, you can edit a course directly on the website. You will have to solve a captcha, but this is easy.

You can also [fork the repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository). Then simply edit the file(s) you wanted to, and [submit a pull request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork).

## Editing a file

The syntax is Markdown, but we are allowing some extensions

* you may use **quotes**
* you may use **checkbox**
* you may use **comments**
* you may **not** use **strikethrough** (use the HTML tag "s" instead)
* you may use Markdown **tables** (as of August 2021)
* you may use **HTML** in Markdown, but
  * do not use the style attribute
  * you may use classes, including **Bootstrap 5** classes

You may also write Latex inside your Markdown file, like you would in an Rmd file (RMarkdown).

* ``$latex$``: **inline latex**
* ``\(latex\)``: inline latex inside an HTML tag
* ``@latex@``: whole-line latex, the latex takes a whole line
* ``\[latex\]``: **whole-line latex**, inside an HTML tag

The syntax with the description having words in bold means that you should use this syntax rather than the other one.

**Note**: the latex is rendered using Mathjax v3. Please, read their documentation first, if something is not rendering (ex: newlines).

```html
<div>
\[
\begin{split}
\text{this equation is centered}
\end{split}
\]
</div>
```

## Other notes

Do not forget to add the references that you used to write something.

You may check your typos using Grammarly, LanguageTool, or anything you're fond of.

You should use ``<hr class="sl">`` (separator left) and ``<hr class="sr">`` (separator right), when you want to use a separator. This is the black line that you can see in other courses.

They should be at least **one** header h1 per page. You should split your code, to make sure that the course is as readable as possible.

Do not copy-paste something, try to factorize or reference it.

You may use the class "tms", to add a text that will look like a comment (grey and small). This is like the "text-muted" class in Bootstrap.