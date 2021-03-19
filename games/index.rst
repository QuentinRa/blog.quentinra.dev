.. _c_game:

================================
Initiation au dev.
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/03/2021}`

Ce cours est censé vous aider à planifier un jeu vidéo, sachant que
80% des projets finissent abandonnés, c'est généralement bon à suivre.

Dans un second temps, les mécaniques, la structure, ... traditionnelle des jeux
vidéos sera abordée.

1. Introduction
=========================

Un jeu vidéo est un projet donc également découpé en phases qui sont

	* phase de planning
	* phase de développement
	* phase de mise en production

Le SUPER CONSEILS sont

	* toujours avoir une version jouable du jeu, peu importe le stade du développement
	* faire le minimum de code pour obtenir une première version qui marche
	* ne pas hésiter à publier son jeu même s'il y a des bugs mineurs, car il y en aura presque toujours !

2. Phase 1 : planning
============================

Alors certains diront "blah blah blah, on va encore passer plus de temps à planifier notre truc
qu'à le coder", en fait c'est assez vrai, mais avec de l'expérience vous pourrez optimiser tout ça. Il
faut aussi prendre en compte qu'un jeu vidéo fait intervenir plein d'équipes donc
généralement certains trucs sont déjà fait...

Le planning ne vous fera pas forcément gagner du temps, surtout s'il n'est pas fait correctement
(ce qui n'est pas facile). Personnellement, cela m'est déjà arrivé malgré un bon (à priori, en tout cas il était long)
planning : nous utilisions une bibliothèque graphique simple car nous ne voulions par apprendre
une nouvelle librairie spécialisée mais à force de voir que notre logiciel manquait
de fonctionnalités qu'ont tous les logiciels, nous avons rapidement vu que nous étions obligé de réinventer
la roue pour continuer avec cette librairie et avons dû changer de librairie et refaire le code...

La première étape du planning c'est la plus "compliquée" : déterminer ce que vous voulez faire. En gros, si vous
voulez faire un jeu, on se demande

	* quelle est l'histoire ?
	* qui sont les personnages ?
	* ...

Tout cela est vu et synthétisé dans un document appelé le **Game design document** (GDD). Cependant, maintenant
que vous savez ce que vous voulez faire, il faut approfondir le comment. Ceci est souvent bâclé mais en fait
c'est probablement le plus important, je vais parler de **Smart programming**.

**Attention** : ne passez pas trop de temps sur le Game Design document mais s'il est très important
pour vous donner la forme de votre projet !

.. toctree::
	 :name: exercices
	 :maxdepth: 1

			Game design document <files/gdd>
			Smart programming    <files/sp>

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune