============================================
3. Opérations - Manipulation des registres
============================================

Opérations
		* :code:`mov{cond}{s} Rd, Operand2` : 	Déplace une constante/ contenu dans Rd
		* :code:`ldr{cond}{size} Rd, {address}` : Met dans Rd la valeur à address
		* :code:`str{cond}{size} Rd, {address}` : 	Met à l'{address} la valeur contenue dans Rd
		* :code:`b` de branchement est l'équivalent d'un goto en C et permet de se déplacer à un étiquette (donc nom: )

Les termes bizarres
	* les {cond} sont expliqués dans la partie conditions, facultatif
	* les {s} sont expliqués dans la partie conditions, facultatif
	* les {size} correspondent à

		* b pour le premier octet de address
		* h pour les deux premiers octet address
		* rien pour tout

Explications
	* les opérations utilisant des registres, vous allez devoir les remplir

		* avec :code:`mov` vous pouvez placer une constante immédiate dans un registre
		* avec :code:`ldr` vous pouvez lire une valeur à une adresse et la mettre dans un registre

			* on note que vous devez mettre =address pour lire la valeur à une adresse

				* ex: :code:`ldr Rd, =address`

	* l'opération :code:`str` fait l'opération inverse de :code:`ldr`
