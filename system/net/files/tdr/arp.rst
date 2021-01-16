================================
ARP
================================

Une machine va (sûrement) vouloir contacter une machine auquel elle n’est pas directement reliée.
Le protocole ARP (adresse resolution protocole) est un protocole permettant de rechercher une
machine connaissant son IP (mais pas son adresse MAC).

Tout d’abord, il faut savoir qu’il existe un cache ARP c’est-à-dire que chaque fois que le
protocole de recherche est exécuté, le chemin pour retrouver la machine est enregistré dans la cache
ARP pour éviter de recommencer la recherche. Ce cache est la première chose regardée lorsque l’on
cherche une machine.

La recherche se déroule de la façon suivante

	*	Le protocole envoi à toutes les adresses mac (broadcast), une requête contenant l’adresse IP recherchée
	*	La machine concernée répond en envoyant sa MAC
	*	L’adresse mac est enregistrée dans le cache ARP

On peut tester ce comportement avec la commande tcpdump lancée
puis en faisant UN ping sur une machine inconnue.

.. image:: /assets/system/net/cours/arp.png

.. code:: none

	... request who-has <ip_MAC_recherchée> tell <mon_ip> ...
	... reply <ip_MAC_recherchée> is-at <MAC_recherchée> ...