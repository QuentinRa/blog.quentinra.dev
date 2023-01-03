# FORM (GET, POST) and URLs

[Go back](../../../programming/web/_general/_old/general/index.md#security)

It shouldn't be new that you shouldn't use GET for the login form, as 1. this is again what you learned (GET = fetch something) and 2. you are showing credential information in the URL (🤨🙄).

But sometimes, even without showing something private in the URL, you may have been introducing a security breach. A lot of websites are using URLs such as

```bash
https://mywebsite.com/users/5
https://mywebsite.com/users/6
https://mywebsite.com/users/7
https://mywebsite.com/users/{some_id_here}
```

And, some may forget to check that some users should not be able to take advantage of this. This is **still** something that some people forget, so I'm putting a note just in case <small>(maybe by replacing users by "invoices" and "{some_id}" by a sort of randomly generated string, it looks less straightforward?)</small>.