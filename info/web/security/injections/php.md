# PHP injections

[Go back](../../index.md#security)

The name "PHP injections" is not very famous, at least it didn't head of it, because this is made of multiples well-known breaches (sessions, file upload, post/get).

<hr class="sl">

## Sessions and Cookies

Even an encrypted cookie is no good, you should use **session** whenever you need to keep something in memory.

Note that sessions are stored server-side, and in the browser, only the `session_id` is stored. Each time the client makes a request, he is sending it with the request. On the server, a session is a file in a folder that you picked <small>(or PHP if you didn't)</small>.

The user can modify the `session_id` (as this is in his browser) and if he finds the `session_id` of an admin, then he can log in and **bypass the 2 factors authentication** (he won't call "login", he is simply using the admin account as if the admin himself logged in) and **use the administrator account**.

It does look nearly impossible right? Well, my favorite website to read mangas Mangadex got hacked because a hacker found an old session_id of an admin that got leaked during a hack in v1 (we were in v4). This is why **session tokens** are highly valuated by hackers.

**Solution proposed**: You should make an IP check, as a lot of frameworks are doing, to check that the IP used to create the session, is the same as the one using it. And, you should destroy sessions server-side (the files).