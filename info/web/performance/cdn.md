# Content delivery network (CDN)

[Go back](../index.md#performance-and-best-practices)

You can learn [here, what's a Content delivery network (CDN)](https://www.keycdn.com/what-is-a-cdn). They will make your website faster. **As a programmer**, you can even use one for **free**, as I'm doing with this website.

**CDNs** are (usually) faster than hosting locally the files. You can also set up your local server to reduce the GAP with CDN (by using good headers for images etc.). You got a lot of notes about this on the WEB.

<hr class="sl">

## CDN for libraries

For instance, for [Bootstrap](https://getbootstrap.com/docs/5.1/getting-started/download/), you can **download the css/js** (as you may have been doing only now), but if you're reading further, you can use a link

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
```

That's it. It is usually quite easy.

<hr class="sr">

## CDN for your assets

*Note*: assets are your stylesheets, your images, your videos, your audios, etc.

* [jsdeliver](https://www.jsdelivr.com/)
  * free
  * for a file hosted on GitHub, simply submit the URL `https://cdn.jsdelivr.net/gh/user/repo/path/to/file.png`
* [cdnjs](https://cdnjs.com/)
  * free
  * but you need to submit an issue to add your repository (not tested)
* [gitcdn](https://github.com/schme16/gitcdn.xyz)
  * free
  * same as jsdeliver, but slower (🙄)
* [raw.githack.com](https://raw.githack.com/)
  * not tested
  * seems free