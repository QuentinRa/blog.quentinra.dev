.. _lwjgl:

================================
LightWeight Java Game Library
================================

| :math:`\color{grey}{Version \ inconnue}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/04/2019}`

Il s'agit d'un cours très très vieux, que j'ai essayé de faire lorsque
je commençais la programmation donc ce n'est pas trop une bonne idée
de le lire... Je le mets sur ce site, car il servira peut-être de base
à un meilleur cours.

1. Introduction
===================================

Lightweight Java Game Library (LWJGL), est une bibliothèque graphique java,
opensource, permettant la réalisation de jeux vidéos (2D et 3D).

Elle permet l'utilisation de manettes, d'OPENAL (son), d'OPENGL (rendu graphique - GPU),
OPENCL (performances)...

.. toctree::
	 :maxdepth: 1

			Installer lwjgl (sans IDE) <files/install>
			Utiliser la lwjgl          <files/use>

2. Démarrage
==============

.. toctree::
	 :maxdepth: 1

			Initialisation du moteur graphique <files/graph>
			Création de fenêtre                <files/window>
			Notion de CallBack                 <files/cb>
			Squelette d'une appli              <files/show>
			Les contextes graphiques           <files/cont>
			Dessiner                           <files/draw>

4. Autres
==============

Gestion du temps
	La méthode :code:`double glfwGetTime();` renvoi le temps écoulé (en secondes) sous la forme d'un double
	depuis glfwInit(). La méthode :code:`double System.nanoTime();` renvoi le temps en nanosecondes.

	Suite ici : https://github.com/SilverTiger/lwjgl3-tutorial/wiki/Timing



-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.lwjgl.org/customize
	* https://gamedevelopment.tutsplus.com/articles/how-to-build-a-jrpg-a-primer-for-game-developers--gamedev-6676
	* https://github.com/SilverTiger/lwjgl3-tutorial/wiki/Game-loops
	* https://alexandre-laurent.developpez.com/tutoriels/programmation-jeux/boucle-de-jeu/
	* https://www.glfw.org/docs/latest/context_guide.html