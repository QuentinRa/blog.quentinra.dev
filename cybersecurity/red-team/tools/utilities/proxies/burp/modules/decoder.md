# Burp Decoder

[![burpsuiteom](../../../../../../_badges/thmp/burpsuiteom.svg)](https://tryhackme.com/room/burpsuiteom)

<div class="row row-cols-lg-2"><div>

This is like the Burp Suite version of the well-known CyberChef. You can enter something, and ask Burp Suite to encode/decode it. You can chain encoding/decoding, and you can also hash your input.

There is a button "smart decode", which is like CyberChief magik, which tries to find the encoding, and decode it.

Texts are **highlighted**/**colored** with the color of the transformation applied to them to generate the text below.

For instance, `"Hello, World"` is in yellow, which means that I used "encode | base64" to generate `SGVsbG8sIFdvcmxk`, while the latter is highlighted in yellow to indicate that I used "decode | base64" to generate the `"Hello, World"` below.

➡️ Highlight = decode, colored = encode, color = algorithm.
</div><div>

![burp_suite_decoder](../../_images/burp_suite_decoder.png)
</div></div>