# FileUpload and ReverseScript

[Go back](..)

First, let's take an example. You put a filter so we
only upload ``png`` but you did it wrong so
a ``reverse_script.png.php`` is passing your test.

Then if the upload folder is accessible by the user, then
he can ran some PHP that he wrote himself like opening
a remote bash terminal. That's called **ReverseScripting**.

<hr class="sr">

To prevent **ReverseScripting**, don't make the upload
folder accessible to the users like if they only need
to send a PDF to prove their identity, we should not
be able to write 
``https://domaine.com/upload/reverse_script.pdf.php``.

<hr class="sr">

Also don't use names like

* upload
* media
* resources
* tmp
* images

<hr class="sr">

Finally, your filter won't let something like
``reverse_script.png.php`` pass a `.png` test but
you may also a PNG that is not a real PNG and have
some script inside. You can only try to add more
checks like checking the width / height or check if
what's your are guessing is the MIME-type is the one
that you want.

<hr class="sl">

If you want to try it, then check for reverse-shell scripts

* like this <https://github.com/pentestmonkey/php-reverse-shell>
* <https://github.com/ivan-sincek/php-reverse-shell>
* or this? <https://pentestmonkey.net/tools/web-shells/php-reverse-shell>
