================================================================
3. Bilan comptable et compte de résultat - Compte de résultat
================================================================

On crée un tableau débit/crédit
et on met en face de chaque débit/crédit, le débit/crédit correspond ce qui comprends

	* type d'opération (banque, caisse, virement, achat/vente produit finis, ...)
	* le code de l'opération (`Table des comptes <table.html>`_)
	* le montant de la transaction (en euros € mais on met pas de €)

Le compte de résultat est imaginé comme une photo de l'activité de l'entreprise
à un instant t. Il fait l'inventaire des dépenses et recettes de l'entreprise.

====================== ======================== ================ ================== ================= ===================
\                      Date du jour
**n° de compte débit** **n° de compte crédit**  **compte débit** **compte crédit**  **Montant débit** **Montant crédit**
...                    ...                      ...              ...                ...               ...
\                      Libellé de l'opération   (facture n° ...)
====================== ======================== ================ ================== ================= ===================

Explications

	* n° de compte = le numéro dans la table (ex: 512)
	* compte = le libellé associé au n° (ex: Banque), en toutes lettres
	* montant en €
	* On ajoute la facture associée à la transaction en libellé