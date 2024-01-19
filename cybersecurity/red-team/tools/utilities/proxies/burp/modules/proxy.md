# Burp Proxy

[![burpsuitebasics](../../../../../../_badges/thm/burpsuitebasics.svg)](https://tryhackme.com/room/burpsuitebasics)

<div class="row row-cols-lg-2"><div>

This is Burp **core** module. It's used to intercept requests <small>(and responses if enabled)</small>. Once intercepted, then can be sent to other modules, such as the intruder, or the repeater. 

First, you must configure your browser to send requests to Burp.

* **Solution 1**: Use burp preconfigured chromium web browser
* **Solution 2** ✅: Add the [FoxyProxy](/cybersecurity/red-team/tools/utilities/proxies/foxyproxy.md) extension to your browser and configure it to use `127.0.0.1:8080`
* **Solution 3**: change any settings such as your browser settings to redirect your browser requests `127.0.0.1:8080`
</div><div>

When not using the first solution, you need to [configure](https://portswigger.net/burp/documentation/desktop/external-browser-config/certificate) **SSL** ⚠️! 

* Intercept must be 'on' in Burp Suite
* Navigate to `http://burpsuite/` or `http://burp/cert`
* Download the certificate 'CA'
* Add it to your browser, as explained in the documentation
  * Navigate to settings OR search 'certificate'
  * Click on 'view' certificates
  * Import the downloaded certificate
  * Toggle "Trust this CA to identify websites"
  * Done
</div></div>

<hr class="sep-both">

## Proxy tab

<div class="row row-cols-lg-2"><div>

![burp_suite_proxy_tab](../../_images/burp_suite_proxy_tab.png)

Click on **intercept is on** to intercept requests. The web page will keep loading until you unblock the request ⚠️.

<br>

* **You may manually edit the request**

If you do that, note that the URL is **URL-encoded**, meaning that some characters that cannot be used in a URL are encoded so that they don't break the URL.

You can select your payload, and use `CTRL+U` to URL-encode it. Use `CTRL+SHIFT+U` to decode it.
</div><div>

* **Right-click on the request to send it to another module**

You can send it to the intruder, repeater... You can also specifically ask Burp suite to catch the response for this request, with "Do intercept > Response to this request".

<br>

* **Forward (CTRL+F) the request, modified, or not, to the server**

<br>

* **Drop the request** 
</div></div>

<hr class="sep-both">

## Scoping

<div class="row row-cols-lg-2"><div>

We **commonly** define a scope to avoid intercepting uninteresting traffic. Only requests/responses within the scope are intercepted.

* ➡️ Go to the "Proxy" tab
* 🐟 Intercept a request from your target and click on "Forward"
* ➡️ Go to the "Target" tab
* 🎣 Right-click on the target to add to the scope, and add it
* 🫧 Answer "yes" when prompted to disable out-of-scope logs.
* ➡️ Go back to the "Proxy" tab
* ➡️ Click on the subtab "Options"
* 🕸️ Enable "AND URL is in target scope"

You can also enable **responses** in the same way, but you have to first select "Intercept responses based on [...]".

<details class="details-n">
<summary>Proxy: Intercept JavaScript</summary>

You may want to intercept a JavaScript file to edit the code before sending it to the browser. They are not caught by default.

* In Intercept Client Requests, edit and remove `^js$` from the list of filtered extensions.
* Clear your browser cache
* Do the request loading the JavaScript you want to intercept again
</details>
</div><div>

![burp_suite_proxy_scope_options](../../_images/burp_suite_proxy_scope_options.png)
</div></div>