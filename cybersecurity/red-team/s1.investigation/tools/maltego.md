# Maltego

[Go back](../index.md)

<div class="row row-cols-lg-2"><div>

This is a software/tool allowing someone to gather a lot of past, and present information about a target. It includes information about websites, DNS records, Domains, emails/telephones, and companies... Note that the information generated may not be accurate.

![Maltego](_images/maltego.png)

> Official links: [Maltego documentation](https://docs.maltego.com/support/home), [Maltego blog](https://www.maltego.com/blog/), [Maltego tutorials](https://www.maltego.com/categories/tutorial/), and [Maltego webinars](https://www.maltego.com/webinars/),

</div><div>

```bash
$ sudo apt install maltego # tested on Kali Linux
$ maltego
```

Select "Maltego CE (free)", then once you [created a MaltegoCE account](https://www.maltego.com/ce-registration/), you can get started in your first investigation. Click on "new". You will see a whiteboard. In the left column, you can drag, and drop a starting point. For instance,

1. Search "domain"
2. Drag and drop it on the whiteboard
3. Double-click on it to edit it, enter a domain name, then press "ok"
4. Right-click on it, and now, you can search for something related to this domain name <small>(ex: email addresses...)</small>. If you want to try to look for "everything", then run all transforms

![maltego_run_all_transforms](_images/maltego_run_all_transforms.png)

Wait, and investigate what maltego found for you!
</div></div>