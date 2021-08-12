# public_html

[Go back](..#starting-your-web-project)

If you didn't, create a ``public_html`` in your home.
Don't forget to set the permissions:

* chmod `700`: seems like the minimum for a .php
* chmod `744`: seems like the minimum for a .html
* chmod `711`: seems like the minimum for a folder
* chmod ``711``: on your home (`~`) folder
* chmod ``711``: on ``public_html`` folder

Examples

```bash
# folders
chmod 711 ~
chmod 711 ~/public_html
# on a file
chmod 744 ~/public_html/index.html
```