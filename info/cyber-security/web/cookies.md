# Cookies and Sessions

[Go back](..)

Even an encrypted cookie is no good, you should use
session whenever you need to keep in memory something.

Note that sessions stored server-side, and in the browser,
only the ``session_id`` is stored in send each time the
user request a page.

Still the user can modify the ``session_id`` and if he finds
a admin ``session_id`` then he can login and bypass the
2 factors authentication since no log in function will be
called since for the server, the user is already logged in.

That's why ``session_id`` or cookies token are quite
priced by the hackers... So be sure to remove server-side
the files of the sessions that are not used anymore
(this is not done by session_destroy). Some developers
add a ``IP`` check to verify that the same IP is using
the same ``session_id`` but that's not enough.