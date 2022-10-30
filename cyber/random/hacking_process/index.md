# H@cking process

<hr class="sl">

## Investigation

<div class="row row-cols-md-2 mt-4"><div>

* Learn more about the company, programming languages, software...

* Find targets that may be used for an attack, for instance, a server used with a subdomain for another purpose
</div><div>

...

</div></div>

<hr class="sr">

## Discovery

<div class="row row-cols-md-2 mt-4"><div>

* Find running services, their version...

* Find the running OS

* If there is a website, try to check what you can get from it.

</div><div>

* Try to find vulnerabilities

* Try to bruteforce credentials on running services
</div></div>

<hr class="sl">

## Once on the host

<div class="row row-cols-md-2 mt-4"><div>

**Find more infos about the computer** 🗺️

If you can, try to see the computer as its users do, because you may find some interesting stuff.

**Get to root using privilege escalation** 😎

As you can't do much as a regular user, that's the main goal when getting inside.

</div><div>

**Fetch data** 🪙

* Try to look for backups
* Try to look for mails/conversations
* Try to look the browser history of the target
* Try to look the command history of the target
</div></div>

<hr class="sr">

## After

<div class="row row-cols-md-2 mt-4"><div>

* Cleanup logs

* Mess with timestamp/... to complicate forensics
</div><div>

* Leave a backdoor

* Edit software configurations / users permissions

* Use this machine as a starting point. Scan the network to discover more vulnerable machines.
</div></div>