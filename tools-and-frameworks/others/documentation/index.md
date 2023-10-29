# Code Documentation

<div class="row row-cols-lg-2"><div>

Developers usually redact some documentation along the code to document some knowledge related to their code, such as:

* ✍️ how, and when the code can be used
* 📝 how the code is expected to behave
* ⏳ how the code was designed/implementation notes
* ...

There are plenty language-specific documentation tools such as [Javadoc](/programming-languages/high-level/oo/java/javadoc/index.md) for [Java](/programming-languages/high-level/oo/java/_general/index.md), [JSDoc](https://jsdoc.app/about-getting-started.html) for [JavaScript](/programming-languages/web/javascript/_general/index.md), or [phpDoc](https://phpdoc.org/) for [PHP](/programming-languages/web/php/_general/index.md)...
</div><div>

There are also [Doxygen](doxygen/index.md) and [Sphinx](sphinx/index.md) which work with many languages.

Mostly for user documentation, you can use these:

* [mkdocs](https://www.mkdocs.org/)
* [docsify](https://docsify.js.org/)
* [daux](https://daux.io/)
* [Just the Docs](https://github.com/just-the-docs/just-the-docs)
* [GitBook](https://www.gitbook.com/)
* [retype](https://retype.com/)

🌍 [ReadTheDocs](https://docs.readthedocs.io/en/stable/index.html) is a popular documentation hosting platform.
</div></div>

<hr class="sep-both">

## Documentation tips

<div class="row row-cols-lg-2"><div>

**You may do** ✅

* 😍 Do provide a [README.md](/tools-and-frameworks/vcs/git/files/readme.md)
* 🔐 For imports, you may indicate why they are used
* 🛣️ For variables, you may indicate their indented usage
* 🧼 Do group similar functions <small>(getter, setters, constructors, visibility...)</small>
* 🚀 Do provide example code calling your function/class with different use cases or different arguments/program states
* ❓ Do provide a clear description of the purpose of each file
</div><div>

**You shouldn't do** ❌

* 🧐 Don't write something useless, such as "the parameter is an integer" when the type is explicit <small>(int xxx)</small>.
* 🥱 Don't write documentation for trivial getters/setters/...
* ☠️ Don't copy-paste, use `@see` or something more appropriate
* 🪦 Don't add `@version` or `@date` unless they will be updated
* 🕳️ Don't forget normal comments along with user documentation
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [dokuwiki](https://www.dokuwiki.org/dokuwiki)
* [mediawiki](https://www.mediawiki.org/wiki/MediaWiki)
* [utterances](https://github.com/utterance/utterances)
</div><div>
</div></div>