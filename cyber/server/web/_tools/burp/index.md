# Burp suite

<div class="row row-cols-md-2"><div>

BurpSuite is a collection of tools that can be used to intercept requests, responses, and inject content in them. This process can be automated, and it's useful both to test websites, and API.

BurpSuite Community is free, and most features are included in 😎, through the intruder is rate-restricted, we can't save our project, and we can't use the automated vulnerability scanner.

*[You can download it, it advised to use a "stable" version](https://portswigger.net/burp/releases#community)*.
</div><div>

There are 6 modules in the suite:

* **Proxy**: intercept, and modify request
* **Repeater**: intercept, modify, and resend multiple times
* **Intruder**: try to bruteforce entrypoint/forms/...
* **Decoder**: decode something, or encode a payload
* **Comparer**: compare data
* **Sequencer**: check algorithm generating tokens/...
</div></div>

<hr class="sl">

## General notes

<div class="row row-cols-md-2"><div>

* Launch the software
* Create a new temporary project

If needed, you can set some project-only options, according to what you will do in the project.

If you want, you can set users-options, such as increasing the font, or using the dark mode.

</div><div>

Some shortcuts

```
Ctrl + Shift + D Switch to the Dashboard
Ctrl + Shift + T Switch to the Target tab
Ctrl + Shift + P Switch to the Proxy tab
Ctrl + Shift + I Switch to the Intruder tab
Ctrl + Shift + R Switch to the Repeater tab
```
</div></div>