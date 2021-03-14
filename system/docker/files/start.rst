=========================
Lancer une image, ...
=========================

On utilise :code:`docker run [nom_image]`.

	* :code:`docker run -it image` : lance l'image de façon interactive
	* :code:`docker run -p ps:pm image` : lance l'image, le port ps de docker corresponds au port pm de ma machine
	* :code:`docker ps` : liste les conteneurs (avec leur id)
	* :code:`docker rm id` : terminer un conteneur (l'id est obtenu plus haut/nom de la machine généré à chaque lancement)