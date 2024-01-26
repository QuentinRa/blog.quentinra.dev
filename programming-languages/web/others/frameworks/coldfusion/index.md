# ColdFusion

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[Adobe ColdFusion](https://coldfusion.adobe.com) is a proprietary web application development platform based on Java using the proprietary ColdFusion Markup Language (CFML) for its webpages.

It easily integrates with various database management systems such as MySQL, Oracle, and Microsoft SQL Server.

It was designed to enable quick and efficient development of web applications <small>(RAD=Rapid Application Development)</small>.
</div><div>

**Ports** 🐲:

* 80/443 <small>(HTTP/HTTPS)</small> on IIS
* 8500/8501 <small>(HTTP/HTTPS)</small> on Apache?
* 1935 <small>(TCP/RPC?)</small>
* 5500 <small>(TCP/RPC?)</small>

Extensions are `.cfm` and `.cfc`. Example: `index.cfm`.
</div></div>

<hr class="sep-both">

## ColdFusion Pentester Notes ☠️

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

#### Enumeration

* You can identify ColdFusion from the headers, the error messages, the extensions, or if `CFIDE/administrator/index.cfm` exists.

</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

From [HTB Module: Attacking Common Applications](https://academy.hackthebox.com/module/113/section/2134), a sample code:

```xml!
<cfquery name="myQuery" datasource="myDataSource">
  SELECT *
  FROM myTable
</cfquery>
<cfloop query="myQuery">
  <p>#myQuery.attr1# #myQuery.attr2#</p>
</cfloop>
```
</div><div>

* `<cf_root>/lib/password.properties` with passwords
</div></div>