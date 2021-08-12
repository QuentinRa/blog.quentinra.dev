# Code signing certificate

[Go back](..)

For Windows Users, you may want your application
to be verified instead of the "Publisher: Unknown"
warning.
What you need for this is to buy a "Code signing
certificate". You can buy the EV certificate if you
want to earn a lot of trust, or you can buy a normal certificate.

<hr class="sl">

## Individual code signing

Since I was a regular person and not a company, here
was my process to buy a certificate

* [I purchased an individual code signing](https://comodosslstore.com/code-signing/comodo-individual-code-signing-certificate)
* Once you get an email with your link, complete the form
* For the CSR code, do not use your server, use your local computer
* Once they are good, they will send a link to <https://secure.trust-provider.com/products/> (Sectigo)
* Send the documented asked (ID Card and a photo of yourself)
* once the process is done, you will get a link to create your certificate
* note that you have to use Internet Explorer for that
* you will get a .pfx file
* considering that ``signtool.exe`` is in the PATH, you have to run
* ``signtool.exe sign /a /t http://timestamp.digicert.com/ /f ".\your_file.pfx" /p "your_password" /v ".\file.exe"``
* you have a
  [copy of sign tool here](
  https://github.com/memorize-code/memorize-references/raw/main/special/business/signtool.exe
  ) but try installing it by yourself. If signtool.exe is
  not in the PATH, either add it or use the
  relative/absolute path.