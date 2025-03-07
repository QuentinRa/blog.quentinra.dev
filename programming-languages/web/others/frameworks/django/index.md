# Django

[![django](../../../../../cybersecurity/_badges/thm/django.svg)](https://tryhackme.com/room/django)

<div class="row row-cols-lg-2"><div>

[Django](https://www.djangoproject.com/) is a python framework to create and deploy websites. It's not a framework and by default, it doesn't come bundled with much.

* A default install page
* An administration page at `/admin/` to create accounts

Django is then extended by writing python code and adding django applications such as `djangorestframework` for a REST API.
</div><div>

There is no default user. The default port is `8000`.

```shell!
$ django-admin startproject <project_name>
$ python3 manage.py migrate
$ python3 manage.py createsuperuser
$ python3 manage.py runserver
$ python3 manage.py runserver 0.0.0.0:8080
```
</div></div>

<hr class="sep-both">

## Django Overview 🗺️

<div class="row row-cols-lg-2"><div>

When getting started, we will create a project. It has the following:

* `urls.py` 📚: defines the route of the application
* `settings.py` ✍️: defines the settings of the application

The following setting variables are commonly used:

* `DEBUG = True`: dangerous setting, expose a lot of information
* `ALLOWED_HOSTS = []`: allowed domains aside from localhost
* `INSTALLED_APPS = []`: ordered list of applications
* `SECRET_KEY = "..."`: ordered list of applications

⚠️ The secret key is used to optionally sign cookies (`value:signature`) and for multiple other cryptographic operations.
</div><div>

Django is dividing the codebase in applications. For instance, we can add a route `api/` linking to the `myapi/urls.py` file.

```py
urlpatterns = [
    path('api/', include('myapi.urls')),
]
```

And in the application `myapi`, we can define relative routes.

```py
urlpatterns = [
    path('hello/', ..., name='hello_world'),
]
```
</div></div>

<hr class="sep-both">

## Django Routes

<div class="row row-cols-lg-2"><div>

We can path multiple types of values for `path()`: a class or a function.

```py
    path('', index),
    path('hello', HelloWorld.as_view(), name='hello_world'),
```

For APIs, we may use:

```python
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class HelloWorld(APIView):
    def get(self, request):
        return Response({"message": "Hello, world!"}, status=status.HTTP_200_OK)
```
</div><div>

For common HTML pages, we can use:

```py
from django.http import HttpResponse

def index(request):
	return HttpResponse("Hello, World!")
```

```py
from django.shortcuts import render

def index(request):
	return render(request, 'index.html')
```

If you're using HTML, then you can use template injection: `{% ... %}`. Refer to the documentation, there are multiple instructions possible.
</div></div>

<hr class="sep-both">

## Django — Website Discovery

<div class="row row-cols-lg-2"><div>

#### Django Discovery — Forced Browsing

Django doesn't have many endpoints that are hidden. The API toolkit may have been installed along the documentation toolkit.

* [x] Check if `/api/` or similar is available
* [x] Check if `/api/redoc/` or `/redoc/` is available
* [x] Check if `/api/swagger/` or `/swagger/` is available

#### Django Discovery — Mapping

Django doesn't come with default many endpoints.

* [x] Check if `/admin/` login page seems present
* [x] Check if `/media/` seems present
* [x] Check if `/static/` seems present
</div><div>

#### Django Discovery — Core Fingerprint

[![django](../../../../../cybersecurity/_badges/thm/django.svg)](https://tryhackme.com/room/django)
[![unbakedpie](../../../../../cybersecurity/_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
[![django_unchained](../../../../../cybersecurity/_badges/rootme/realist/django_unchained.svg)](https://www.root-me.org/en/Challenges/Realist/Django-unchained)
[![djangocatz](../../../../../cybersecurity/_badges/rootme/realist/djangocatz.svg)](https://www.root-me.org/en/Challenges/Realist/DjangocatZ)

Django doesn't expose itself. When DEBUG is enabled:

* [x] Check if `/PAGENOTFOUND` returns the list of URLs
* [x] Check if `Host: invalid` returns all DEBUG variables

```text!
Python Version   - may help to customize payloads
Django Version   - may help tunning attacks
HOSTNAME         - may help to customize payloads
Server time      - may help to customize payloads
ALLOWED_HOSTS    - List of domains allowed along with localhost.
LOGIN_URL        - if you didn't know the URL ; may not be correct
DBMS Section     - Type of DBMS and configuration
ANY_PATH         - may expose usernames such as in /home/toto/myapp/
```

Regardless, the `Server` header may expose the Python version.
</div></div>

<hr class="sep-both">

## Django — Website Exploitation ☠️

<div class="row row-cols-lg-2"><div>

#### Django Exploitation — Cracking Hashes

[![djangocatz](../../../../../cybersecurity/_badges/rootme/realist/djangocatz.svg)](https://www.root-me.org/en/Challenges/Realist/DjangocatZ)

Django hashes have the format `pbkdf2_sha256$iter$salt$hash`. They can be cracked with [hashcat and maybe john](/cybersecurity/cryptography/algorithms/hashing/index.md) too.

```ps
$ hashcat -m 10000 hash /usr/share/wordlists/rockyou.txt
$ john --format="django" [...] # didn't work
```
</div><div>
</div></div>