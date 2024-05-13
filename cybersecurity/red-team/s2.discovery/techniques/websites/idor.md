# Insecure Direct Object References (IDOR)

[![web_attacks](../../../../_badges/htb/web_attacks.svg)](https://academy.hackthebox.com/course/preview/web-attacks)
[![modern_web_exploitation_techniques](../../../../_badges/htb/modern_web_exploitation_techniques.svg)](https://academy.hackthebox.com/course/preview/modern-web-exploitation-techniques)
[![idor](../../../../_badges/thm/idor.svg)](https://tryhackme.com/room/idor)
[![introwebapplicationsecurity](../../../../_badges/thm/introwebapplicationsecurity.svg)](https://tryhackme.com/room/introwebapplicationsecurity)
[![owasptop10](../../../../_badges/thm/owasptop10.svg)](https://tryhackme.com/room/owasptop10)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day4.svg)](https://tryhackme.com/room/adventofcyber2)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day16.svg)](https://tryhackme.com/room/adventofcyber2)
[![adventofcyber4](../../../../_badges/thm/adventofcyber4/day14.svg)](https://tryhackme.com/room/adventofcyber4)
[![neighbour](../../../../_badges/thm-p/neighbour.svg)](https://tryhackme.com/room/neighbour)
[![corridor](../../../../_badges/thm-p/corridor.svg)](https://tryhackme.com/room/corridor)
[![cap](../../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)
[![api_broken_access](../../../../_badges/rootme/web_server/api_broken_access.svg)](https://www.root-me.org/en/Challenges/Web-Server/API-Broken-Access)

<div class="row row-cols-lg-2"><div>

An IDOR vulnerability is when a user can change a value, such as a number in a URL, and access someone else file/page/content.

* a form with predictable values: `?id=10` <math xmlns="http://www.w3.org/1998/Math/MathML"><mo accent="false" stretchy="false">&#x2192;</mo></math> `?id=11`
* a folder with predictable filenames: `/user1.png` <math xmlns="http://www.w3.org/1998/Math/MathML"><mo accent="false" stretchy="false">&#x2192;</mo></math> `/user2.png`
* a cookie

The best way to test for IDOR is to create two accounts, and see if from one, you can access the content of the other. If you can't, try to find the difference between them in the requests.
</div><div>

**What's next?** 🔥

* You can use [Fuzzing](fuzzing.md) to try to discover more content

* It may be possible to reset someone's else password

* It may be possible to modify someone's else account information such as a profile item to perform a [XSS](/cybersecurity/red-team/s3.exploitation/vulns/web/xss.md) attack

* Try not to follow redirects to see if you can exploit something.
</div></div>