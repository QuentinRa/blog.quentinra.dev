=========================
Captcha
=========================

Vous avez les docs ici pour ReCaptcha

	* V2 : https://developers.google.com/recaptcha/docs/display
	* V3 : https://developers.google.com/recaptcha/docs/v3

L'idée est assez simple. Vous devez copier-coller le code.

Exemple:

.. code:: html

	<div class="g-recaptcha" data-sitekey="your_site_key"></div>

Vous devez remplacer "your_site_key" par une clef générée
via la console google (http://www.google.com/recaptcha/admin,
https://developers.google.com/recaptcha/docs/settings).

Une fois la formulaire validé, vous aurez dans votre formulaire POST
une entrée :code:`g-recaptcha-response`. Il faudra
faire une requête vers l'API google pour vérifier
la réponse (https://developers.google.com/recaptcha/docs/verify)
et le JSON retourné vous indiquera si oui ou non le captcha est valide.