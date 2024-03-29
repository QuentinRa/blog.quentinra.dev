# Burp Intruder

[![fileuploadattacks](../../../../../../_badges/htb/fileuploadattacks.svg)](https://academy.hackthebox.com/course/preview/file-upload-attacks)
[![usingwebproxies](../../../../../../_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/using-web-proxies)
[![adventofcyber2](../../../../../../_badges/thm/adventofcyber2/day3.svg)](https://tryhackme.com/room/adventofcyber2)
[![burpsuiteintruder](../../../../../../_badges/thmp/burpsuiteintruder.svg)](https://tryhackme.com/room/burpsuiteintruder)

<div class="row row-cols-lg-2"><div>

The intruder module is most probably the most complex module; yet it's also the one that community users will use the least, as it's **heavily rate-limited** (1/s) in the community version.

It's a module to do [Web fuzzing](/cybersecurity/red-team/s2.discovery/techniques/websites/fuzzing.md). Once you caught a request, send it to the intruder. You can use <kbd>CTRL+I</kbd>.

**Parameters**

Burp will automatically detect the parameters that will be injected, and wrap them between two **silcrows** (§). The first parameter since the start will be later referred to as '1', the second as '2', and so on.

**Payload sets** ([wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md)...)

Burp Suite is using the term **payload set** to refer to the values that will be used in the attack. It could be a list, a sequence of numbers... You will have to go to the tab **???** to set the payload.

📚 For large wordlist, use 'Runtime file' instead of 'File'.
</div><div>

**Rules**

Burp allow us to do transformations on an item from the payload set, such as capitalizing/prefixing/... them.

**Results**

Once the attack is finished, or while in progress, you can sort results by size/... to find the ones that stand out.

**Macros**

There are cases when you want to brute force a form in which some values are changing inside the request. For instance, the server is sending a unique token in every request to avoid simple brute force attacks. You can bypass such primitive checks using a macro.

* Project Options | Sessions | Macros | New | Add a macro and select the request you want to brute force
* Project Options | Sessions | Session Handling Rules | Create a new rule. Set the scope to "intruder" and the URL scope to "suite scope". In the Run Action, pick "Run a macro", and update the sections "update only xxx" according to your needs.
* Done 😥

</div></div>

<hr class="sep-both">

## Attack mode

<div class="row row-cols-lg-2"><div>

Consider the following variables:

* $n$: the number of items inside your payload sets. If there are more than one payload set, all values are multiplied and $n$ is the result.

* $m$: the number of parameters

#### Sniper: $n * m$ requests

*the sniper will only attack one parameter at a time*

You provide only one payload set. The attack will test every entry in the payload set for the first parameter and the other will be unchanged, then it will do the same for every other parameter.

<br>

#### Battering Ram: $n$ requests

You provide only one payload set. The attack will test the first word for every parameter at the same time, then the second word...
</div><div>

#### Pitchfork: $n$ requests

You provide one payload set per parameter <small>(max 20)</small>. The first word of every payload set is tested in their associated argument, then the second... For instance, take a case when you have a list of `username:password`, and you want to find if there is a couple `(username,password)` that is working.

<br>

#### Cluster bomb: $n * m$ requests

You provide one payload set per parameter <small>(max 20)</small>. This is the usual dictionary attack in which every combination is tested.
</div></div>