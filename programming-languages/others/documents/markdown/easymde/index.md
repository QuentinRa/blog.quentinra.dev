# EasyMDE

<div class="row row-cols-md-2"><div>

[EasyMDE](https://github.com/Ionaru/easy-markdown-editor) is an HTML and JavaScript editor. It uses [marked](https://github.com/markedjs/marked) to parse Markdown and [codemirror](https://github.com/codemirror/dev/) for the editor ✍️.

```html!
<link rel="stylesheet" href="https://unpkg.com/easymde@2.16.0/dist/easymde.min.css" integrity="sha256-rx7mVtufBWbJp2lFfXVNuOQJqIg3pmKeh8jS6RQ6Ock=" crossorigin="anonymous" referrerpolicy="no-referrer">

<label hidden for="editor"></label>
<textarea id="editor" name="file" form="upload-form">some
default content</textarea>

<script src="https://unpkg.com/easymde@2.16.0/dist/easymde.min.js"
        integrity="sha256-FFV66UtTp49ryn2U5JZS7IM96dx4/qy+aBAGekRPjao="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```

You will then have to configure and run the editor:

```xml!
<script>
  const editor = new EasyMDE({
    autofocus: true,
    element: document.getElementById("editor"),
    lineWrapping: true,
    height: "700px",
    maxHeight: "700px"
  });
  editor.toggleSideBySide();
</script>
```
</div><div>

```xml!
<script>
  const editor = new EasyMDE({
    insertTexts: {
      // text shown when clicking on the "table" icon
      table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
    },
    shortcuts: { drawTable: "Cmd-Alt-T" },
    showIcons: ["code", "table", "horizontal-rule"],
    toolbar: [
      // list all icons you want
      'bold', 'italic', 'heading',
      // custom icon
      'side-by-side', {
        name: "guide",
        action: "http://example.com",
        className: "fa fa-question-circle",
        title: "SomeTitle",
      },
    ]
  });
</script>
```
</div></div>

<hr class="sep-both">

## Add Math Support

<div class="row row-cols-md-2"><div>

Adding Math support can be somewhat complicated. You can use MathJax for rendering and KaTex for parsing.

```xml!
<script>
  MathJax = {
    tex: {
      inlineMath: [['$', '$'], ['\\(', '\\)']],
      displayMath: [['@', '@'], ['\\[', '\\]']],
    }
  };
</script>

<script id="MathJax-script" async
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/3.2.0/es5/tex-mml-chtml.min.js"
        integrity="sha512-9DkJEmXbL/Tdj8b1SxJ4H2p3RCAXKsu8RqbznEjhFYw0cFIWlII+PnGDU2FX3keyE9Ev6eFaDPyEAyAL2cEX0Q=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/3.0.7/marked.min.js" integrity="sha512-a+W0h6Sho4fGYABZAQg6zdWP/qtyE+gzeVfNB/UApXRLuHKh7bT3TeA/LUOno+pcDjX0Vfzgtz6crFQC3YL9lA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.18/katex.min.css" integrity="sha512-nii0D5CrWiLjtPcfU3pQJifaRLxKKVut/hbsazsodCcIOERZbwLH7dQxzOKy3Ey/Fv8fXCA9+Rf+wQzqklbEJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.18/katex.min.js" integrity="sha512-DAZH0Wu7q9Hnm0Fw8tRZsTeQBzIugiUy6k2r7E0KKMlC2nBvvrNSH/LVnGueCXRfDs5epP+Ieoh3L+VzSKi0Aw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```

Use the following code to use the custom renderer:

```xml!
<script>
  const editor = new EasyMDE({
    // custom parser
    previewRender: function(plainText) {
      return marked(plainText); // Returns HTML from a custom parser
    },
  });
</script>
```
</div><div>

```xml!
<script>
  function renderMath(matches, text, inline=true, size=2) {
    if (matches != null){
      const options = inline ? {output: "html"} :  { displayMode: true, output: "html" };
      for (const m of matches) {
        let latex = m.substring(size, m.length - size);
        let parsed;
        try {
          parsed = katex.renderToString(latex, options);
        } catch (e) {
          if (e.name === "ParseError"){
            if (latex.indexOf("&") !== -1) {
              latex = latex.replaceAll("&lt;", "<")
              latex = latex.replaceAll("&gt;", ">")
              parsed = katex.renderToString(latex, options);
            }
          }
        }
        text = text.replace(m, parsed)
      }
    }
    return text;
  }

  marked.use({
    renderer: {
      text(text) {
        // rendering $$
        if (text.indexOf("$") !== -1) {
          text = renderMath(text.match(/\$+([^$]+)\$+/g), text, true, 1)
        }
        // rendering @@
        if (text.indexOf("@") !== -1) {
          text = renderMath(text.match(/@+([^@]+)@+/g), text, false, 1)
        }
        return text;
      },
      html(text) {
        if (text.indexOf("\(") !== -1) {
          text = renderMath(text.match(/\\\(([^)]+)\\\)+/g), text)
        }
        if (text.indexOf("\[") !== -1) {
          text = renderMath(text.match(/\\\[[^\]]+\\]/g), text, false)
        }
        return text;
      }
    }
  });
  
  // ...
</script>
```
</div></div>

<hr class="sep-both">

## Add Syntax Highlighting Support

<div class="row row-cols-md-2"><div>

This is an example of using highlight.js to highlight code.

```xml!
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/styles/base16/materia.min.css" integrity="sha512-OekoFypwczt07fw6kJhvvRo4rbmyK/o6fh4NTw7tKeSPO9SXRZH+2sln1h51KPj0zSBA6/WUiW/eJog2YVn9lA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/highlight.min.js" integrity="sha512-IaaKO80nPNs5j+VLxd42eK/7sYuXQmr+fyywCNA0e+C6gtQnuCXNtORe9xR4LqGPz5U9VpH+ff41wKs/ZmC3iA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/languages/markdown.min.js" integrity="sha512-8YFObAd0dPoua15RGQBCDtnXMA4zJnAxaL4QSjgLLEKmJ1A2Aar7M1gamz2512/mKzx1ut96KNV7ggEV8WvRxg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```
</div><div>

```xml!
<script>
  // ...

  marked.setOptions({
    highlight: function (code, language) {
      if (language && hljs.getLanguage(language)) {
        return hljs.highlight(code, { language: language, format: 'html' }).value;
      } else {
        return hljs.highlightAuto(code).value;
      }
    }
  });
  
  // ...
</script>
```
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-md-2"><div>

#### Keystrokes

You can keep track of keystrokes using this:

```js!
    status: ["autosave", "lines", "words", "cursor", {
      className: "keystrokes",
      defaultValue: function(el) {
        this.keystrokes = 0;
        el.innerHTML = "0 Keystrokes";
      },
      onUpdate: function(el) {
        el.innerHTML = ++this.keystrokes + " Keystrokes";
      },
    }],
```
</div><div>
</div></div>