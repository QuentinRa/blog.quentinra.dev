# Burp Suite

[![burpsuitebasics](../../../../../_badges/thm/burpsuitebasics.svg)](https://tryhackme.com/room/burpsuitebasics)
[![burpsuiterepeater](../../../../../_badges/thmp/burpsuiterepeater.svg)](https://tryhackme.com/room/burpsuiterepeater)
[![burpsuiteintruder](../../../../../_badges/thmp/burpsuiteintruder.svg)](https://tryhackme.com/room/burpsuiteintruder)
[![burpsuiteom](../../../../../_badges/thmp/burpsuiteom.svg)](https://tryhackme.com/room/burpsuiteom)
[![burpsuiteextender](../../../../../_badges/thmp/burpsuiteextender.svg)](https://tryhackme.com/room/burpsuiteextender)
[![usingwebproxies](../../../../../_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/using-web-proxies)

<div class="row row-cols-lg-2"><div>

Burp Suite is a collection of tools that can be used to intercept requests, responses, and inject content into them. This process can be automated, and it's useful both to test websites, and API.

Burp Suite Community is free, and most features are included in 😎, through the intruder is rate-restricted, we can't save our project, and we can't use the automated vulnerability scanner.

* [Download](https://portswigger.net/burp/releases#community) <small>(it's advised to use a "stable" version)</small>
* Run and create a new <small>(temporary)</small> project

➡️ You can set options for the project according to your needs for this project, or/and for the user, such as using the dark theme.
</div><div>

On Kali Linux, Burp Suite is installed by default:

```ps
$ sudo apt install -y burpsuite # if not installed
$ burpsuite
```

📚 As a student, you can apply for a [free trial](https://portswigger.net/burp/pro/trial).
</div></div>

<hr class="sep-both">

## Burp Suite Modules

<div class="row row-cols-lg-2"><div>

There are 6 modules in the suite:

* [Proxy](modules/proxy.md): intercept, and modify requests
* [Repeater](modules/repeater.md): intercept, modify, and resend multiple times
* [Intruder](modules/intruder.md): try to brute force entry point/forms/...
* [Decoder](modules/decoder.md): decode something, or encode a payload
* [Comparer](modules/comparer.md): compare data
* [Sequencer](modules/sequencer.md): check algorithm generating tokens/...
</div><div>

You can use <kbd>CTRL+SHIFT</kbd> and a letter to switch to a tab:

* <kbd>D</kbd> - Dashboard
* <kbd>T</kbd> - Target
* <kbd>P</kbd> - Proxy
* <kbd>R</kbd> - Repeater
* <kbd>I</kbd> - Intruder
</div></div>

<hr class="sep-both">

## Extender

<div class="row row-cols-lg-2"><div>

Like most community-friendly software, you can write extensions/plugins to enhance them. You can find extensions in the `Extender | BApp Store` tab. There are useful extensions such as:

* **Logger++**: "[...] logging extension for Burp Suite."
* **WordPress Scanner**: "Find known vulnerabilities in WordPress plugins and themes using WPScan database."
* **Request Timer**: "This extension captures response times for requests made by all Burp tools. It could be useful in uncovering potential timing attacks."
* ...
</div><div>

To install some plugins, you may have to install some adapters as not every plugin was written in Java.

* [Jython](https://github.com/jython/jython) (Python)
* [JRuby](https://github.com/jruby/jruby) (Ruby)
* ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `Proxy>Options>Match and Replace` for automatic injection
* Burp Scanner (paid, see HTB notes)
* Show response in browser
* Scan insertion points

```py
def queueRequests(target, wordlists):
    engine = RequestEngine(endpoint=target.endpoint,
                           concurrentConnections=1,
                           requestsPerConnection=100,
                           pipeline=False
                           )

    for word in open('/usr/share/dict/authpwd'):
        engine.queue(target.req, ["carlos", word.rstrip()], label='carlos')
        engine.queue(target.req, ["wiener", "peter"])

def handleResponse(req, interesting):
    if req.status == 302 and req.label == 'carlos':
        table.add(req)
```
</div><div>

```py
def queueRequests(target, wordlists):
    engine = RequestEngine(endpoint=target.endpoint,
                           concurrentConnections=1,
                           engine=Engine.BURP2
                           )

	# 1: %s for username
	# 2: %s for password
    for word in []:
        engine.queue(target.req, ["username", word.rstrip()], gate='race1')
    engine.openGate('race1')

def handleResponse(req, interesting):
    table.add(req)
```
```text!
=> record a macro, edit item and add parameter "gift-card"
=> then tell request 5 to use previous request for parameter "gift-card"
=> add session rule to trigger to macro and run intruder

=> ParamMiner > Run (extension>output to see the progress) Then Go to Target>Sitemap>ThereUGo
=> load an image on our domain to get the user-agent and other headers
=> proc as usual

Headers are ignored in most cache key computations.
=> ParamMiner => Guess Headers => Issues
=> +add a cache buster
```
</div></div>