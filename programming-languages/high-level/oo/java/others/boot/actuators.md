# Spring Boot Actuators

[![cozyhosting](../../../../../../cybersecurity/_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![spring-actuators](../../../../../../cybersecurity/_badges/hacktricks/spring-actuators.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/spring-actuators)

<div class="row row-cols-lg-2"><div>

[Spring Boot Actuators](https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html) are a Spring Boot module to monitor and manage applications. Sprint Boot applications can be deployed to multiple servers such as [Apache Tomcat](/operating-systems/cloud/webservers/others/tomcat/index.md).

It's commonly exposed at the `/actuator` endpoint. Querying this endpoint will return a list all available endpoints.

Most endpoints are returning censored data.

* `/actuator/mappings`: can be used to find URI
* `/actuator/env`: censored configuration data
* ...
</div><div>

The `/actuator/sessions` is returning existing sessions. We can use it to steal another user session.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `jar xf xxx.jar`
* `cat BOOT-INF/classes/application.properties | grep datasource`
</div><div>
</div></div>