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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Beautiful Jekyll](https://beautifuljekyll.com/)
* [Jekyll Themes](http://jekyllthemes.org/)
</div><div>
</div></div>