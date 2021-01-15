=================================
Introduction à imunes
=================================

Vous pouvez lancer imunes avec la commande :code:`imunes`. Il s'agit
d'un émulateur de réseau virtuel mais qui demande les permissions root.

	* :code:`# imunes image -l` : voir les identifiants des émulations
	* :code:`# imunes -b -e <id>` : terminer une émulation
	* :code:`# sudo himage machine[@<id>] <commande>` : lancer une <commande> sur une machine virtuelle

Si vous utilisez l'interface graphique

	* :code:`experiment->execute` : lance la simulation
	* :code:`experiment->terminate` : termine la simulation
	* :code:`double clic sur une machine` : ouvre un terminal sur la machine
	* :code:`clic droit sur une machine->configure` : définir les règles

On entends par règles, les règles vues dans :code:`tables de routages`
et dans :code:`arp`.

	* (prérequis) custom startup config : cocher enabled
	* (prérequis) editor -> create -> fill default
	* on écrit nos lignes (tables de routage), on quitte en sauvegardant.