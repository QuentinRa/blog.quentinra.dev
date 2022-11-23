# robots.txt

[Go back](../index.md#websites-improvements-summary)

This is one of the files that robots are checking when they visit your website. You may **block some robots**, or tell them **what URL then cannot see/index**, or **where is the sitemap**.

Of course, robots may ignore this file, and you should not give critical information (for instance, you are forbidding  access to `/download/`, but you are also telling hackers that you have a folder `/download/`).

You may create a robots.txt as explained [on robots-txt.com](http://robots-txt.com/). You can test your [robots-txt using Google SC](http://robots-txt.com/ressources/robots-txt-tester/). And, you got a lot of examples [on robots-txt](http://robots-txt.com/ressources/). Here is mine

```yaml
# allows everyone
User-agent: *
Disallow:

# link to the sitemap (optional)
Sitemap: https://memorize.be/sitemap.xml
```