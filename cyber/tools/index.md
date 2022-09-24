# Security tools

...

<hr class="sl">

## BurpSuite

BurpSuite can be used to intercept a form, and apply some changes to it. You could automate this process. For instance, given a list of username, you can use BurpSuite to lunch a bruteforce attack.

<details class="details-e">
<summary>Intercept a form</summary>

Start a new project in BurpSuite and **start listening** (Proxy > Intercept > On). Then, open the page with the form in your browser.

You need to configure, and **enable, your browser proxy to redirect any requests to localhost** (127.0.0.1).

* Check your browser settings
* Or, use BurpSuite extension

**Now**, any request will be opened inside BurpSuite. You will have to go to BurpSuite and click on **forward** to process request (if you try loading some webpage, but it takes a lot of time, that's because the request is pending in BurpSuite).
</details>

<hr class="sr">

## Bruteforce

The [SecLists GitHub Repository](https://github.com/danielmiessler/SecLists/) contains useful lists of usernames/passwords, payloads, urls, ...