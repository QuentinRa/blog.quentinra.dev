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

Now, any request will be opened inside BurpSuite, in the tab target. Click on **Forward** to process request that you don't want to work on.

**Note**: if you try loading some webpage, but it takes a lot of time, that's because the request is pending in BurpSuite.
</details>

<details class="details-e">
<summary>Edit a payload</summary>

A payload is the form data that is stored in the request. For instance, when submitting a login form, you will most likely have: `username=toto&password=otot`. Once you intercepted such a request, instead of clicking on "forward", right-click on it, and select "sent to intruder". Then go to intruder tab.

* **Positions**: can be used to select attack mode, and injectable data
  * **Attack mode**: select cluster bomb
  * **Add "$"** before and after any injectable data. These blocks of "$something$" will be later referred with "$1" for the first block, "$2" for the second block...
* **Payload**: here you can select how to fill each of the injectable fields.

Start the attack. If a response is different than others, then it's most likely that the injected data was "correct".

</details>

<hr class="sr">

## Bruteforce

The [SecLists GitHub Repository](https://github.com/danielmiessler/SecLists/) contains useful lists of usernames/passwords, payloads, urls, ...