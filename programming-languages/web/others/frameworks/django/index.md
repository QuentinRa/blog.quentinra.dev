# Django

[![django](../../../../../cybersecurity/_badges/thm/django.svg)](https://tryhackme.com/room/django)

<div class="row row-cols-lg-2"><div>

[Django](https://www.djangoproject.com/) is a python framework to create and deploy websites.

```shell!
$ django-admin startproject <project_name>
$ python3 manage.py migrate # apply configuration
$ python3 manage.py runserver
$ python3 manage.py runserver 0.0.0.0:8080
$ python3 manage.py startapp <app_name>
```

The default admin page is at URI: `/admin`.
</div><div>

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
</div></div>

<hr class="sep-both">

## Django Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Django Enumeration

[![django](../../../../../cybersecurity/_badges/thm/django.svg)](https://tryhackme.com/room/django)
[![unbakedpie](../../../../../cybersecurity/_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)

* Check if there is a `/admin` or a `/media` endpoint

* Check for Python Headers (`WSGIServer`, `CPython`)

* If `DEBUG` mode is enabled, any error including 404, but even error 500 will expose a lot of information:

```text!
Python Version - may help to customize payloads
Python Path - may expose usernames
HOSTNAME - may help to customize payloads
LOGIN_URL - if you didn't know the URL
MEDIA_ROOT - may expose usernames
STATICFILES_DIRS - may expose usernames
```

It even discloses the type of DBMS and how it is configured.
</div><div>

#### Django Exploitation

[![unbakedpie](../../../../../cybersecurity/_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)

* If `DEBUG` mode is enabled, try to generate an error, which would in turn makes Django expose a part of the code related to the error

</div></div>