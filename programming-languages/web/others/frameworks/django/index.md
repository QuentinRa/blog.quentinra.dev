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
[![django_unchained](../../../../../cybersecurity/_badges/rootme/realist/django_unchained.svg)](https://www.root-me.org/en/Challenges/Realist/Django-unchained)
[![djangocatz](../../../../../cybersecurity/_badges/rootme/realist/djangocatz.svg)](https://www.root-me.org/en/Challenges/Realist/DjangocatZ)

* Check if there is a `/admin` or a `/media` endpoint

* Check for Python Headers (`WSGIServer`, `CPython`)

* If `DEBUG` mode is enabled, error 404 will expose the endpoints

* If `DEBUG` mode is enabled, error 500 will expose a lot of information. It can be triggered sometimes by omitting parameters, or using invalid parameters such as an invalid format or type.

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

You can examine variables and the code in the traceback section too.
</div><div>

#### Django Exploitation

[![unbakedpie](../../../../../cybersecurity/_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)

* If `DEBUG` mode is enabled, try to generate an error, which would in turn makes Django expose a part of the code related to the error

</div></div>