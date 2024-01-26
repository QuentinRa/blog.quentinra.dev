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