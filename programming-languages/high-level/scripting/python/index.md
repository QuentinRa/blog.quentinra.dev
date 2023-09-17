# Python

[![pythonbasics](../../../../cybersecurity/_badges/thm/pythonbasics.svg)](https://tryhackme.com/room/pythonbasics)
[![pythonforcybersecurity](../../../../cybersecurity/_badges/thmp/pythonforcybersecurity.svg)](https://tryhackme.com/room/pythonforcybersecurity)

<div class="row row-cols-md-2"><div>

Python 🐍 is a multipurpose high-level scripting language. Because it's quite easy to learn/use, it's unfortunately used as a [Golden hammer](https://sourcemaking.com/antipatterns/golden-hammer) 🔨🔥 <small>(AntiPattern)</small> by many developers.

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

Python 2 was the previous major version of Python. With little changes, most Python scripts can be run by Python 3.

* `print "xxx"` ➡️ `print("xxx")`
* `5 / 2 == 2` ➡️ `5 / 2 == 2.5`
* ASCII strings ➡️ Unicode strings
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

#### Imports

```python
import xxx
import xxx as yyy         # alias
import xxx.yyy.zzz        # "zzz" in package "xxx.yyy"

from xxx import aaa       # import only aaa
from xxx import aaa, bbb  # import aaa and bbb
from xxx import *         # import all
```

#### VENV

Each project needs some packages in specific versions. To avoid messing with other projects when installing, updating, or removing packages, we usually create a virtual environment (**VENV**) per project. Once **activated** <small>(by sourcing activate)</small>, new packages will be added to the local copy at `path/to/venv`.

```ps
$ python3 -m venv path/to/venv      # create
$ source path/to/venv/bin/activate  # load
(venv) $ echo $VIRTUAL_ENV          # see the current VENV
(venv) $ pip3 install xxx           # installed to the VENV
```

We usually store in a file `requirements.txt` packages and their versions used by the project.

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

Each type is associated with a class 🤖. You can use the **constructor** <small>(`className()`)</small> to convert values: `str(5) == "5"`.

```python
xxx = True or False           # bool 🤖 | ???
xxx = b'\x00'                 # bytes 🤖 | ???
xxx = 42                      # int 🤖 | %d - %i - %x - %X 
xxx = 42.0                    # float 🤖 | %f - %.xf - %0x.yf
xxx = "42" + '42' + """42"""  # str 🤖 | %s
xxx = object()                # object 🤖 | %r
```

You can check the class of a variable using `isinstance`

```python
if isinstance(var, className): # ex: isinstance(xxx, bool)
    ...
```

➡️ To indicate the non-existing of something, we use `None`:

```python
x = None
if x is None:
    pass
```

➡️ You can get the type of something using `type(objet)`

```python
type("xxx") # <class 'str'>
```

🦄 Variables can be strongly typed, but it's NOT enforced by the language, e.g., there is no compilation errors:

```python
xxx : bool = False
```
</div><div>

#### Ranges

Range are sets generated from an interval:

```python
set = range(10) # set = [0, 1, ..., 9]
set = range(3, 7) # set = [3, 4, ..., 6]
set = range(3, 7, 2) # set = [3, 5]
```

#### Operators

You can learn more about [operators here](/programming-languages/_paradigm/stuff/operators.md).

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
if 5 == 5: pass           # true
if 5 != 5: pass           # false
                          # see also: >, >=, <, <=
if not False: pass        # logicial NOT → true
if True or False: pass    # logical OR → true
if True and False: pass   # logical AND → false
```

➡️ As long as they have the **SAME TYPE**, you can use `+` between two variables. This result either in **addition**, or in **concatenation**.

#### Print something on the console

You can use `print`:

```python
print("Hello, World!")      # normal

msg = "Hello, World"
print("Message: %s" % msg)  # ❌ old
print(f"Message: {msg}")    # ✅ new

print("Code: "+ str(5))     # 🤔 concatenation
```

➡️ Use `input` to get input text: `input_text = input('Prompt text: ')`.
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

Inside any statement, you can use `pass` to indicate a statement without any code. It's useful for blocks that are not coded yet.

#### Branching - if

```python
if True:
    pass
elif False:
    pass
else:
    pass
```

🤡 It's worth noting that `else:` can be used after most blocks such as for/while loops or exceptions. It's executed after the block.

#### Branching - if in

You can check if something is inside a set using `in`:

```python
if True in set:
    pass
```
</div><div>

Inside Loops, you can use:

* `continue`: skip the current iteration, process to the next one
* `break`: end the loop

#### Loops - for

We usually use a [range](#ranges) to imitate a `for i`.

```python
for i in anIterable: # string, array, list, range...
    pass
for i, j in tuple: # dictionnary.items(), tuples...
    pass
```

#### Loops - while

```python
while False:
    pass
```

#### Exceptions

Exceptions are mostly raised when an error occurred. You can catch them to handle them using `try-except`:

```python
try:
    raise Exception("example")
except Exception as e: # 👉 "as e" is optional
    print(e.args[0]) # "example"
finally: # optional, run after either try or except 
    pass
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

Similarly to control-flow structures, you can use `pass` for empty functions. Functions can access outer-scope variables.

```python
def my_function():
    pass
	
my_function() # invoke
```

Functions parameters can have a default value.

```python
def my_function(a, b=2):
    return a ** b
```

🦄 Functions can be strongly typed, but it's NOT enforced by the language, e.g., there are no compilation errors:

```python
def my_function(a: string) -> string:
    pass
```
</div><div>

#### Variadic functions

You can create variadic functions <small>(e.g. variable number of arguments)</small>:

```python
def fct(*args):
    print(list(args))

fct()
fct(1)
fct(1, 2)
fct(1, 2, 3)
```

#### Options

You can create functions with options:

```python
def fct(..., **opt):
    print(opt.get("key1", "default"))


fct(..., key1= "value", ...)
```
</div></div>

<hr class="sep-both">

## Classes and objects

<div class="row row-cols-md-2"><div>

Example with a [class](/programming-languages/_paradigm/oo.md#classes-and-objects) object with two attributes and one method:

```python
class Person:
    name = "John Doe"
    country = "US"

    def tostring(self):
        return f'Person{{name:{self.name}, country:{self.country}}}'
```

➡️ When calling `a.b()`, `self` is automatically filled with the variable `a`.

```python
johnDoe = Person()
print(johnDoe.name)
print(johnDoe.tostring())
```
</div><div>

#### Constructors

You can use a [constructor](/programming-languages/_paradigm/oo.md#constructors) to set attributes:

```python
class Person:
    def __init__(self, name, country = "US"):
        self.name = name
        self.country = country

johnDoe = Person("Jane Doe", "US")
```

#### Builtin methods

Each class has methods that we can override. For instance, instead of `toString`, you can override `__str__` to convert something to a string:

```python
class Person:
    def __str__(self) -> str:
        return f'Person{{name:{self.name}, country:{self.country}}}'
```

➡️ See also: `__eq__`, `__ne__`, `__hash__`, `__dir__`...
</div></div>

<hr class="sep-both">

## Common types

<div class="row row-cols-md-2"><div>

#### String

```python
string = "Hello, World!"
len(string)                 # length (=13)
string.count('l')           # occurrence count (=3)
string.index('l')           # first index of (=2)
string.upper()              # see also "lower()"
string.startswith('H')      # or ...
parts = string.split(',')   # split in ['Hello', ' World!']
```

#### Dictionary

```python
map = {"a": 5, "b": 7}
map["a"] = 9        # set
b = map["b"]        # get
map.pop('b')        # delete
if b in map: pass   # contains
for k, v in map:    # iterate
	pass
```
</div><div>

#### Lists

Lists are arrays that can have elements of different types.

```python
tab = [3, 5, 6]
len(tab)           # length (=3)
tab.append(3)      # add last (=[3, 5, 6, 3])
tab[0]             # get first (=3)
tab.count(3)       # occurrences (=2)
tab = sorted(tab)  # sort (=[3, 3, 5, 6])
```

You can also generate lists using [list comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions):

```python
list = [i for i in in range(0,10) if i%2==0]
```

➡️ See also `arrays` for homogeneous data <small>(same type for all values)</small>.
</div></div>

<hr class="sep-both">

## Common usages

<div class="row row-cols-md-2"><div>

#### Program arguments

```python
import sys

print(len(sys.argv)) # number of args (>= 1)
print(sys.argv[0])   # executable name
```

#### Python version

```python
import sys

print(sys.version_info)  # {major=3, ...}
```

#### Check if this is the main script

This is used to run some code when a script is the main.

```python
if __name__ == '__main__':
    # ...
```
</div><div>

#### Dates

```python
import datetime

print(datetime.datetime.now())
```

#### Files

It's common to open a file using `with`, as they are automatically closed <small>(`file.close()`)</small>. The opening mode can be `r` <small>(read)</small>, `w` <small>(write)</small>, or `a` <small>(append)</small>.

```python
with open(password_file, 'r') as file:
    # do something
    content = file.read()    # read the whole file
    lines = file.readlines() # stores lines in a list
    for line in file:        # read line by line
        # ...
    file.write("xxx")        # append/write a line
```
</div></div>

<hr class="sep-both">

## Some libraries

<div class="row row-cols-md-2"><div>

#### numpy - manipulate lists

`numpy` is a library simplifying and optimizing operations on lists.

```python
import numpy

tab = numpy.array([2, 5, 7])
tab_square = tab ** 2  # ex: [4, 25, 49]
```

#### requests - http requests

`requests` is a library to do HTTP requests.

```python
import requests

r = requests.get("https://example.com")
r = requests.get("https://example.com", allow_redirects=True)
if r.status_code == 404:
    pass
# r.json() r.text()...
```

➡️ If the host is unreachable, a `requests.ConnectionError` is raised.

Requests may be wrapped in a session, which can be used to keep track of things like authentication cookies...

```python
from requests import Session
session = Session()
session.get('', headers={'Content-Type': 'application/json'})
session.put('', json={})
session.delete('')
session.post('', files= {'file': open('xxx','rb')}, data={})
````

#### scrapy - manipulate packets

`scrapy` is a library to manipulate packets. A packet is created by combining multiple protocols using `/`. It's sent using `send` or other functions such as `srp` for layer 2 packets.

```python
from scapy.layers.l2 import *

# EX: ARP Scan
p = Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(pdst = "10.10.10.0/24")
r, u = srp(p, timeout=2, iface="tun0", inter=0.1)

for s,r in r:
    print(r.sprintf(r"%Ether.src% - %ARP.psrc%"))
```

#### keyboard - grab keystrokes

`keyboard` can capture keyboard strokes.

```python
import keyboard

keys = keyboard.record(until ='ENTER')  # until ENTER
print(keys)                             # see key down/up
keyboard.play(keys)                     # replay input
```

#### pyfiglet - banner

`pyfiglet` can be used to show your "program name" using ASCII art.

```python
import pyfiglet

print(pyfiglet.figlet_format("Metasploit"))
```

#### hashlib - hash manipulation

`hashlib` can hash a password.

```python
import hashlib

m = hashlib.md5("a password".strip().encode())
digest = m.hexdigest()
if digest == "your hash":
    pass
```
</div><div>

#### socket - networking

`socket` is a low-level networking library.

```python
import socket

ip = socket.gethostbyname("example.com") # host to IP
port = 4444
try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(0.5)
    # raise exception on error
    r = sock.connect((ip, port))
    # return 0 or ERRNO
    r = sock.connect_ex((ip, port))
    # ...
except socket.error as e: # may be wider
    pass
finally:
    sock.close()
```

#### paramiko - SSHv2 implementation

`paramiko` can connect to an SSH server.

```python
import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
try:
    ssh.connect(target, port=22, username=username, password=password)
except paramiko.AuthenticationException:
    pass
ssh.close()
```

#### Django - create and deploy websites

[![django](../../../../cybersecurity/_badges/thm/django.svg)](https://tryhackme.com/room/django)

`django` is a library to create and deploy a website.

```shell!
$ django-admin startproject <project_name>
$ python3 manage.py migrate # apply configuration
$ python3 manage.py runserver
$ python3 manage.py runserver 0.0.0.0:8080
$ python3 manage.py startapp <app_name>
```

You will usually edit `urls.py` to add a route which is a `path`, a `function`, and optionally a name. For instance:

```python
from django.http import HttpResponse

def index(request):
	return HttpResponse("Hello, World!")
	
from django.shortcuts import render

def index(request):
	return render(request, 'index.html')
```

If you're using HTML, then you can use template injection: `{% ... %}`. Refer to the documentation, there are multiple instructions possible.

#### Click - command line interfaces

Click is prompting the user for input for arguments that were not given to the program (`script.py --key some_key [...]`).

```python
import click

@click.command()
@click.option('--key', prompt=True, help='A key')
@click.option('--value', prompt=True, default='N/A')
def create_xxx(key, value):
    print(key, value)

create_xxx()
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [pythonanywhere](https://www.pythonanywhere.com/)
* [peps](https://peps.python.org/pep-0008/) (style guide)
* [pyenv](https://github.com/pyenv/pyenv), Anaconda, Miniconda
* [pyzo](https://github.com/pyzo/pyzo)
* [pythonawesome](https://pythonawesome.com/)
* [taichi](https://github.com/taichi-dev/taichi)
* `del()`: delete a variable
* `dir()`: class properties
* py2exe
* `apt install python3-xxx`
* pipx
* `Optional[type]`
* `class XXX(Enum): XXX = 0, ...`
* `Enumerate(xxx.items())`
* `Dict[bool,bool]`

```
a = 5 + \
    3 + \
    2
```
</div><div>

```
str[3:7] # s 3rd to 7th
str[3:7:2] # step = 2
str[:5] # 1st to 5th
str[5:] # 5th to last
str[::-1] # reverse
```

* `# -*- coding: utf-8 -*-`
* lambda: `lambda x : x[0]`

```
$ curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
$ sudo python2 get-pip.py
$ pip2 install --upgrade xxx
```
</div></div>