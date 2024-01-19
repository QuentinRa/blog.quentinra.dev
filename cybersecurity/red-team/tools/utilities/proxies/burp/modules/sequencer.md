# Burp Sequencer

[![burpsuiteom](../../../../../../_badges/thmp/burpsuiteom.svg)](https://tryhackme.com/room/burpsuiteom)

<div class="row row-cols-lg-2"><div>

This tab can be used to send a lot of requests, and compare the entropy/randomness of a token inside a request. 

You can either pass it a request to a page that generates the token: **Live capture**, or pass a list of captured tokens: **Manual load**.
</div><div>

**Live capture**

Once the request is loaded inside the sequencer, you will be able to select the location of the token within the response: **a cookie, a field inside a form...**. Then, start the capture.

Once you generated a sufficient number of tokens (ex: 10k), pause the capture, and analyze it. If there aren't enough samples, you can unpause the capture and continue.

You can check "auto analyze" to do automatic analysis once every XXX requests. It will becomes more accurate as the sample size increase.
</div></div>