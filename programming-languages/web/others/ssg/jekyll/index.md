# Jekyll

<div class="row row-cols-md-2"><div>

[Jekyll](https://jekyllrb.com/) is a popular static site generator that allows you to develop static websites with ease 🖼️.

Jekyll is built on **Ruby**, so you need Ruby to run it.

```shell!
$ sudo apt-get install ruby-full build-essential
$ # install gems locally not globally
$ echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
$ echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
$ echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
$ # install jekyll
$ gem install jekyll bundler
```
</div><div>

To create a new project:

```shell!
$ jekyll new mywebsite
```

To generate the static website <small>(in `_site/`)</small>:

```shell!
$ jekyll build
```

During development, we usually use `serve` to automatically reload the website when the code changes. The website is available at `http://127.0.0.1:4000/` by default. 

```shell!
$ jekyll serve
```
</div></div>

<hr class="sep-both">

## Jekyll basics

<div class="row row-cols-md-2"><div>

#### Jekyll Header

The first lines of every HTML file are Jekyll header:

```html!
---
title: XXX
layout: default
---
```

#### Jekyll Include

Inside every HTML, you can use `include` to load another HTML:

```js!
{% include some_folder/xxx.html %}
```

#### Jekyll Include Arguments

You'll usually pass arguments to the included file:

```js!
{% include _partial/xxx.html title="xxx"
            content="Can be on
            multiple lines"
            icon="You must escape \" quotes"
            %}
```

Inside the included file, use `include.` to access them:

```html!
<img src="{{ include.icon }}"></i>
<h3>{{ include.title }}</h3>
<p>{{ include.content }}</p>
```
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Beautiful Jekyll](https://beautifuljekyll.com/)
* [Jekyll Themes](http://jekyllthemes.org/)
</div><div>
</div></div>