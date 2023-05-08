# Python

<div class="row row-cols-md-2"><div>

Python 🐍 is a multi-purpose high-level scripting language. Because it's quite easy to learn/use, it's unfortunately used as a [Golden hammer](https://sourcemaking.com/antipatterns/golden-hammer) 🔨🔥 <small>(AntiPattern)</small> by many developers.

You can use **Python interpreter**:

```ps
$ python3
>>> "Hello, World"
'Hello, World'
>>> quit()
```
</div><div>

Otherwise, you can also create a **Python script** `xxx.py`:

```ps
# print "Hello, World!"
print("Hello, World!");
```

Then execute it through the interpreter:

```ps
$ python3 xxx.py
Hello, World
```
</div></div>

<hr class="sep-both">

## Python ecosystem

<div class="row row-cols-md-2"><div>

#### Python2

Python is the previous major version of Python. With little changes, most python scripts can be run by python3.

* ...

➡️ `python`/`pip` will link to `python2`/`pip2` or `python3`/`pip3` according to your configuration, but you can have both.

<br>

#### Packages

You can look for packages at [pypi.org](https://pypi.org/). You can use `pip3` to install `python3` packages:

```ps
$ pip3 install xxx # install
$ pip3 list --outdated # see latest versions
$ pip3 install -U xxx # update
```

🦄 To upgrade `pip`, you can use:

```ps
$ python3 -m pip install --upgrade pip
```
</div><div>

#### VENV

Each project need some packages and in some specific versions. To avoid messing with others project when installing/updating/... packages, we usually create one virtual environment **VENV** per project. Once **activated** <small>(by running activate)</small>, new packages will be added to the local copy at `path/to/venv`.

```
$ python3 -m venv path/to/venv # create
$ source path/to/venv/bin/activate # load
$ echo $VIRTUAL_ENV # see the current VENV
$ pip3 install xxx # installed to the VENV
```

We usually store in a file `requirements.txt` the library and their versions used by the project.

```shell!
$ pip3 freeze > requirements.txt # create
$ pip3 install -r requirements.txt # load
````

➡️ See also `virtualenv`, `Pipenv`, `Pipfile`, and `Poetry`.
</div></div>

<hr class="sep-both">

## Python basics

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching

...
</div><div>

#### Loops

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>