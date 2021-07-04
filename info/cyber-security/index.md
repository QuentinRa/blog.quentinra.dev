# Introduction

In this course, you will learn about the most known
breaches (``piratages, failles``) and what's the
cyberworld.

The cyber war is scary because

* anyone can take part in it (not reserved to countries
    like before)
* you only need a computer in most cases not a lot
    of costs
* the offensive (the one hacking) has an advantage
since he can choose when (it's a surprise for the defender)

You may hear the word ``APT`` (Advanced persistent threat)
when the hackers are continuously improving their code
in order to stay on the servers and continue stealing
data over a long period of time.

And that's why **cyber-experts** are more than ever
needed by companies.

<hr class="sr">

## Offense / Defense

You can specialize in offense / defense

* **offense**: You will try to hack your company or their
software to look for breaches.
    * web: PHP, JS, HTML
    * network: Bash, Networking, ...
* **defense**: You will have to stop the attack as fast 
  as you can. An incident responder will be with you
  trying to guess what the hackers want and what will
  be the consequences of the attack.
    * a lot of knowledge about malware or breaches
    so that you can respond faster
    * some companies are sharing the malware used
    to attack them to help other defend themselves

<hr class="sl">

## Where can I learn

You can check these websites to improve your skills

* [tryhackme](https://tryhackme.com/)
* [root me](https://www.root-me.org/)
* [Damn Vulnerable Web Application](https://dvwa.co.uk/)

And you may check here if you got hacked

* [have i been pwned?](https://haveibeenpwned.com/)
* [vigilante](https://vigilante.pw/)
* [cybernews check](https://cybernews.com/personal-data-leak-check/)

Also, a lot of website are offering bounties for breaches
to person like you and me. I think it's quite interesting
to look a what kind of breaches got reported like
[here](https://bounty.github.com/) for github.

You may check <https://nvd.nist.gov/general> 
or [nvd search](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&search_type=all)
if you are looking for vulnerabilities. I'm liking
this page a lot [snyk.io/vuln](https://snyk.io/vuln) since
they are sometimes giving quite good explanations and
you examples.

<hr class="sr">

## General vulnerabilities

* Spoofing (`Fraude au président`)

Someone will usurps your CEO identity and will write
a mail asking you to secretly and urgently send him
money. It will spy on your messages with the CEO
and make it like it's really him behind the message
and because it's urgent, some gave in.

* Deceptive security

You will use lures to bait the attacking and earn
more time.

<hr class="sl">

## Web vulnerabilities

Cookies mustn't be used, and you should not trust anything
that's stored in the client browser.

* [Cookies and Sessions](web/cookies.md)

Beware of file upload, someone might send some script
one your server and may be able to run it.

* [FileUpload and ReverseScript](web/upload.md)

When using URLs like``profile/5``, the user will
try to replace ``5`` by another value. You should remember
to check that he can do that for this page. You can
use software to automate this, but this time for forms
like a login one.

* [Login](web/login.md)

<hr class="sl">

## Looking for someone

Some links

* [sherlock](https://sherlock-project.github.io/) and [tutorial](https://www.geeksforgeeks.org/sherlock-hunt-username-on-social-media-kali-linux-tool/)
* [maltego](https://www.maltego.com/) and [help](https://en.kali.tools/?p=24)
* [spiderfoot](https://www.spiderfoot.net/) and [help](https://www.hackingloops.com/spiderfoot/)

<hr class="sr">

## Sources

* <https://tryhackme.com/>
* <https://tryhackme.com/path/outline/beginner>
* <https://www.cybersecurityeducation.org/careers/incident-responder/>
* <https://www.tutorialspoint.com/splunk/index.htm>
* <https://www.hackerone.com/>
* <https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet>
* <https://github.com/payloadbox/sql-injection-payload-list>
* <https://www.youtube.com/watch?v=Trb1c2HqCA4&ab_channel=Capgemini>
* <https://www.youtube.com/watch?v=ih0SC-dN6MU&ab_channel=TechBeacon>* [EDR](https://www.cisco.com/c/en/us/products/security/endpoint-security/what-is-endpoint-detection-response-edr.html)
* [EDR](https://www.mcafee.com/enterprise/en-us/security-awareness/endpoint/what-is-endpoint-detection-and-response.html)