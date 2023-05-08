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

#### Variables

```python
var1 = 5
var2, var3 = "a", "b" # multiple
var4 = str("ab") # constructor
```

#### Types

Each type is associated to a class 🤖. You can use the **constructor** <small>(`className()`)</small> to convert values: `str(5) == "5"`.

```python
xxx = True or False           # bool 🤖 | ???
xxx = b'\x00'                 # bytes 🤖 | ???
xxx = 42                      # int 🤖 | %d - %x - %X 
xxx = 42.0                    # float 🤖 | %f - %.xf - %0x.yf
xxx = "42" + '42' + """42"""  # str 🤖 | %s
xxx = object()                # object 🤖 | ???
```


You can check the class of a variable using `isinstance`

```python
if isinstance(var, className): # ex: isinstance(xxx, bool)
    ...
```

#### Ranges

Range are sets generated from an interval:

```python
set = range(10) # set = [0, 1, ..., 9]
set = range(3, 7) # set = [3, 4, ..., 6]
set = range(3, 7, 2) # set = [3, 5]
```
</div><div>

#### Operators

```python
# arithmetic
sum = 5 + 5           # 10
substraction = 5 - 5  # 0
product = 5 * 5       # 25
division = 6 / 5      # 1
power = 6 ** 2        # 6^2 = 36
mod = 7 % 2           # 1
sum += 1              # same as sum = sum + 1
                      # see also: -=, *=, and /=
# logical
if 5 == 5 : pass          # true
if 5 != 5 : pass          # false
                          # see also: >, >=, <, <=
if not False : pass       # logicial NOT => true
if True or False : pass   # logical OR => true
if True and False : pass  # logical AND => false
```

➡️ As long as they have the **SAME TYPE**, you can use `+` between two variables. This result either in **addition**, or in **concatenation**.
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching - if

```python
if True:
    pass
elif False:
    pass
else:
    pass
```
</div><div>

#### Loops - for

We usually use a `range` to imitate a `for i`.

```python
for i in set:
	pass
```

#### Loops - while

```python
while False:
    pass
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `a is b` (same value+address?)
* `%s %r %i`

```
block:
    block:

a = 5 + \
    3 + \
    2
```
</div><div>
</div></div>