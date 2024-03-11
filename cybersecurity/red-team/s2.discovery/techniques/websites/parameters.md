# Hidden Parameters

[![attacking_with_ffuf](../../../../_badges/htb/attacking_with_ffuf.svg)](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day4.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

At some point, most if not all the website public parameters will be properly tested and hopefully secured. There may still be more parameters that were forgotten, for instance, if they are not used by the "front-end" clients anymore.

You can use [Fuzzing](fuzzing.md) to find them, for instance for query parameters, using the URL `https://example.com?FUZZ=value`.

Common wordlists are listed at [wordlists#parameters](/cybersecurity/red-team/_knowledge/topics/wordlists.md#parameters).
</div><div>
</div></div>