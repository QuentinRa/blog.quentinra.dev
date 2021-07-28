# Toolbox

...

<hr class="sr">

## Terms of use and privacy policy

When creating a website, it's mandatory to provide
these documents for your users. Europeans users
should at least be able to refuse cookies and so on
because of the GDPR policy.

You can generate these for free like with

* [termshub](https://termshub.io/) (readable and simple, free)
* [termly](https://termly.io/) (big unreadable facebook-like tos, free with termly logo+credits)

Also, you may check this website,
if you are curious about the content of some famous
tos

* [Terms of Service Didn't Read](https://tosdr.org/)

<hr class="sl">

## CodeSigning certificate

For Windows Users, you may want your application
to be verified instead of the "Publisher: Unknown"
warning.

What you need for this is to buy a "Code signing
certificate". You can buy the EV certificate if you
want to earn a lot of trust or the normal certificate.

Since I was a regular person and not a company, here
was my process to buy a certificate

* [I purchased an individual code signing](https://comodosslstore.com/code-signing/comodo-individual-code-signing-certificate)
* Once you get an email with your link, complete the form
* For the CSR code, do not use your server, use your local computer
* Once they are good, they will send a link to <https://secure.trust-provider.com/products/> (Sectigo)
* Send the documented asked (ID Card and a photo of yourself)
* once the process is done, you will get a link to create your certificate
* note that you have to use internet explorer for that
* you will get a .pfx file
* considering that ``signtool.exe`` is in the PATH, you have to run
* ``signtool.exe sign /a /t http://timestamp.digicert.com/ /f ".\your_file.pfx" /p "your_password" /v ".\file.exe"``
* you have a 
  [copy of signtool here](
  https://github.com/memorize-code/memorize-references/raw/main/special/business/signtool.exe
  ) but try installing it by yourself. If signtool is
  not in the PATH, either add it or use the
  relative/absolute path.