===========================
Sécuriser son jar
===========================

Tout d'abord la première étape est d'empêcher une personne
ayant votre .jar/.exe de retrouver votre code source.

	* Offusquer le code : Il s'agit d'une technique qui rends moins lisible le code (utilisant des noms bizarres etc.)

		* :code:`yguard` (gratuit/open-source) : https://www.yworks.com/products/yguard
		* :code:`proguard` (gratuit/open-source) : https://github.com/Guardsquare/proguard

	* Empêcher la décompilation.

		* Ceci est uniquement possible avec protector4j (payant pour plus de 7 jours)
		* vous pouvez demander une réduction si vous êtes étudiants (par mail)
		* https://protector4j.com/
		* si vous testez dans votre IDE de décompiler, vous allez le voir échouer
		* Attention, protector4j réécrit JAVA (en partie) en proposant un nouveau JRE