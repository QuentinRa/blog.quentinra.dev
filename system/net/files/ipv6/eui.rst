=================================
EUI-64 et SLAAC
=================================

Mapper des adresses physiques

	#. \
		Une façon est celle des adresses IEEE 802 MAC (Ethernet...)
		qui codent l’adresse physique sur 48bits dont :

			*	24bits pour le oui (identifiant du constructeur de la carte)
			*	24bits pour le device_identifier (identifie la machine, codé par le constructeur de la carte)

	#. \
		La forme EUI-64 : 64bits extended unique identifier, définie pour affecter les adresses ipv6
		des interfaces par IEEE.

			*	24bits pour le oui
			*	40bits pour le device_identifier

	#. \
		Une forme de l’EUI-64 généralement appelée « Modified EUI-64 » pour les adresses IPV6 :

			*	Écris type de réseau (fe80::)
			*	24bits pour le oui en inversant le 7e bit (0->1 ou 1->0)
			*	FFFE
			*	reste du MAC (device_id)

	#. \
		Il s’agît d’une méthode par laquelle un nœud (=machine) s’auto-attribue une adresse ipv6.

		Les étapes sont les suivantes :

			*	\
				Le nœud génère l’adresse LLU (link local unicast) à partir de sa MAC
			* \
				Le nœud utilise une nœud-sollicitation pour voir si l’adresse est utilisée avec comme source
				l’adresse type unspecified. Si réponse, on change de méthode sinon test unicité réussi.
			* \
				On continue notre création, en passant du local au global avec une routeur-sollicitation reçoit le préfix
				du routeur que l’on concatène avec l’interface_id généré ce qui nous donne notre ipv6.