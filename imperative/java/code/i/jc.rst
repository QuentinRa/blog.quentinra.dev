====================================
JComponent et Composants graphiques
====================================

Pour les composants graphiques, vous avez deux packages :

	* :code:`java.awt` : le premier version
	* :code:`javax.swing` : la seconde (censée être plus performante), les nouvelles classes commencent par J...

Je classerais les classes comme suit

	* les classes qui servent à l'affichage (JFrame, JLabel ...)
	* les classes qui servent à décrire ce qui est affiché (Dimension, Point, Color, ...)
	* les événements graphiques (ActionListener, MouseListener, ...)
	* les classes pour la mise en page (GridLayout, BorderLayout, ...)

1. Les classes de dessin
==================================

| Note : Souvent les classes awt sont les mêmes mais sans le J.
| A#B : notation pour dire la méthode B de la classe A

Voici un topo de pas mal de classes. Généralement vous allez créer une fenêtre
puis ajouter des composants dedans. Certains composants peuvent en contenir d'autres
donc parfois pour obtenir un certain agencement, vous allez regrouper des composants dans
des panneaux (JPanel) puis positionner le JPanel.

.. code:: none

		//-------- fenêtre -------- \
		JFrame
		JFrame#setLocation // position dans l'écran
		JFrame#setSize // taille de la fenêtre
		JFrame#setDefaultCloseOperation // que faire lors du clic sur la croix pr fermer
		JFrame#setVisible // affiche la fenêtre (cachée de base)

		//-------- afficher du texte -------- \
		JLabel
		JLabel#setText
		JLabel#getText
		JLabel#setHorizontalAlignment // alignement du texte

		//-------- bouton -------- \
		JButton
		JButton#setText
		JButton#getText
		JButton#addActionListener // voir partie événements, que faire au clic sur le bouton

		//-------- Saisie -------- \
		JTextArea //zone de texte
		JTextField //champ de texte
		JPassword //mot de passe

		//-------- CheckBox, Radio bouton, ... -------- \
		JCheckBox
		JRadioButton
		JList //liste avoir choix
		JPopupMenu //menu

		//-------- Panel -------- \
		//regroupe un ensemble de composants
		JPanel
		//avec une scroll bar
		JScrollPane

Voici un exemple de code pour faire une JFrame (400,600)
qui se ferme lorsqu'on clique sur la croix (plus de détails en 2.).

.. code:: java

	...
	JFrame frame;
	frame = new JFrame("A basic Frame");
	frame.setSize(400,600);
	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	frame.setVisible(); // affiche
	...

2. JComponent
================

Tous les composants héritent de JComponent, ils ont donc généralement (certains ont
ces méthodes qui ne font rien donc faites attention) les méthodes suivantes.

Les méthodes ultra utiles

	* méthode :code:`add` : permet d'ajouter un composant (par exemple dans une fenêtre)
	* méthode :code:`setVisible` : seulement a utiliser pour une fenêtre, la rends visible
	* méthode :code:`repaint` : redessine un composant (si vous avez changé sa taille ou autre)
	* méthode :code:`setPreferredSize` : la SEULE méthode pour définir la taille (pour presque 99% des composants)
	* méthode :code:`setLayout` : définir le gestionnaire de la mise en page

Liste non complète

.. code:: none

		// ajouter un composant (par exemple dans la fenêtre)
		JComponent#add
		JComponent#remove
		JComponent#removeAll
		JComponent#setVisible

		// gérer les événements de la souris
		JComponent#addMouseListener
		JComponent#removeMouseListener

		// mise en page
		JComponent#setLayout

		// style
		JComponent#setFont
		JComponent#setBackground //fond, uniquement si opaque
		JComponent#setForeground //couleur du texte
		JComponent#setOpaque //le fond d'écran est dessiné

		// dessin
		JComponent#paintComponent //voir dessin
		JComponent#repaint //dessine un composant (si vous avez touché à add/remove, utilisez revalidate)
		JComponent#revalidate //recalcule le contenu du composant puis le redessine

		// taille
		JComponent#setPrefferedSize //taille du composant, ne pas utiliser setSize