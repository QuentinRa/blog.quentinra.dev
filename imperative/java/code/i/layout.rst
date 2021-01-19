===========================
Mise en page (Layout)
===========================

Les layout permettent de gérer la disposition des composants, vous pouvez

	* le donner au constructeur (généralement il y a un constructeur)
	* utiliser la méthode : :code:`JComponent#setLayout(LayoutManager layout);`

Par défaut, les composants ont un :code:`FlowLayout`.

BorderLayout
--------------------

Il s'agit d'un layout dans lequel le composent découpe son espace en 5 : NORD, SUD, EST, OUEST et CENTRE.

.. image:: /assets/imperative/java/borderLayout.png
	 :width: 50%

.. code:: java

		jcomponent.setLayout(new BorderLayout());
		//il ne peux avoir qu'une seule view/jcomponent par emplacement.
		//NORTH et SOUTH prennent toute la largeur mais ne sont pas prioritaires sur la répartition de la hauteur
		//EAST et WEST prennent un maximum de hauteur et la largeur minimale +
		//celle disponible après que le centre ait été dessiné avec le minimum d'espace
		//centre prends la largeur et hauteur restante.
		jcomponent.add(view1, BorderLayout.NORTH);
		jcomponent.add(view2, BorderLayout.SOUTH);
		jcomponent.add(view3, BorderLayout.CENTER);//jcomponent.add(view3) ajoute automatiquement au centre
		jcomponent.add(view4, BorderLayout.EAST);
		jcomponent.add(view5, BorderLayout.WEST);

FlowLayout
---------------------

Le layout par défaut, place les composants à la suite en leur donnant leur taille préférée (voulue).

.. code:: java

		// composants alignés
		FlowLayout right = new FlowLayout(FlowLayout.RIGHT);//à droite
		FlowLayout left = new FlowLayout(FlowLayout.LEFT);//à gauche
		FlowLayout center = new FlowLayout(FlowLayout.CENTER);//centre, par défaut
		center = new FlowLayout();//centre, par défaut

		jcomponent.setLayout(center);
		jcomponent.add(view);

GridLayout
===============

Il s'agit d'une table, toutes les lignes ont la même hauteur, toutes les colonnes la même largeur.
Placement automatique dans le tableau.

.. code:: java

		jcomponent.setLayout(new GridLayout(row, col));
		jcomponent.add(view1);
		jcomponent.add(view2);
		jcomponent.add(view3);
		jcomponent.add(view4);

CardLayout
--------------

Il s'agit d'un layout qui permet de charger plusieurs écran dans des cartes de changer d'écran facilement
sans avoir a re-créer les écrans. Il peut également être utilisé pour changer uniquement une partie d'un écran.

.. code:: java

		CardLayout cardLayout = new CardLayout();
		jcomponent.setLayout(cardLayout);
		//ajout des composants
		//on passe une clef par exemple "vue01" et le composant (view) à afficher lorsque cette vue est choisie
		jcomponent.add(key, view);
		//afficher une view depuis une key
		cardLayout.show(jcomponent, key);//passe le jcomponent soit le parent du CardLayout
		//affiche le premier écran ajouté
		first(Container parent);
		//affiche l'écran suivant dans l'ordre d'ajout
		next(Container parent);
		previous(Container parent);

GridBagLayout
=================

Il s'agit d'un layout ultra-flexible permettant de placer les composants comme avec du css et donc
responsivement. Il s'agit d'une répartition sous la forme d'une grille.

.. code:: java

		jcomponent.setLayout(new GridBagLayout());

		//on place les composants en donnant des valeurs à un objet gridbagConstraint
		GridBagConstraints c = new GridBagConstraints();
		c.gridx = int; //position x dans la grille depuis 0
		c.gridy = int; //position y dans la grille depuis 0
		c.gridwidth = int; //nombre de colonnes prises
		c.gridheight = int; //nombre de lignes prises
		//équivalent d'une expand, les composant ayant une weight différente de 0 vont se partager
		//l'espace restant avec avoir donné leur taille aux autres composants
		c.weightx = double;
		c.weighty = double;
		//aligne les composants si possible à un endroit
		c.anchor = {NORTH, EAST, ..., SOUTHEAST, SOUTHWEST};
		//marche avec weight, détermine le comportement du composant selon l'espace en plus
		c.fill = {BOTH, NONE, HORIZONTAL, VERTICAL}
		//padding
		c.insets = new Inset(top, left, bottom, right);

		//ajout
		jcomponent.add(un_composant_ici, c);// donne la contrainte en ajoutant le composant