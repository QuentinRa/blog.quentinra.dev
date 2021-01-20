================
Événements
================

Il est possible d'exécuter du code pour réagir à un événement tels que la fermeture de la fenêtre
ou le clic sur un bouton.

Les événements sont empilés et gérer dans le Thread des événements.

On appelle observateur (listener), la type de classe qui contient le code qui sera exécuté lors
qu'un événement est déclenché. Il faut ajouter/sensibiliser les composants aux événements en leur
associant un (ou plusieurs) observateurs.

EventListener est la classe parent de toutes les classes Listener. Elle a été hérité pour chaque type
d'observateur, en voici quelques s'uns ainsi que leurs méthodes de gestion de l'événement

.. code:: java

		//ActionListener
		//
		//il s'agit d'un listener ne pouvant être ajouté que sur un bouton
		public class ObservateurAction implements ActionListener {
		 @Override
		 public void actionPerformed(ActionEvent e){
			//appelée lors d'un clic
			Object source = e.getSource();//l'object cliqué
			//vous pouvez le convertir via un cast
			JButton button = (JButton) source;

			//le texte de l'élément cliqué
			//par exemple pour un bouton, il s'agit de son texte
			String texte = e.getActionCommand();
		 }
		}

		//MouseListener
		//
		//Il s'agit d'un observateur pour tous les composants, qui surveille les actions de la souris
		public class ObservateurSouris implements MouseListener {

		 @Override //clic
		 public void mouseClicked(MouseEvent e){}

		 @Override //survol (dedans)
		 public void mouseEntered(MouseEvent e){}

		 @Override //survol (sortie)
		 public void mouseExited(MouseEvent e){}

		 @Override //appui
		 public void mousePressed(MouseEvent e){}

		 @Override //relâche l'appui
		 public void mouseReleased(MouseEvent e){}

		}

		//WindowListener
		//
		//Un observateur de la fenêtre
		public class ObservateurFenetre implements WindowListener {

		 @Override //après la fermeture de la fenêtre, non appelé pour autant que je sâche
		 public void windowClosed(WindowEvent e){}

		 @Override //avant la fermeture de la fenêtre
		 public void windowClosing(WindowEvent e){}

		 @Override //deviens la fenêtre active
		 public void windowActivated(WindowEvent e){}

		 @Override //cesse d'être la fenêtre active
		 public void windowDeactivated(WindowEvent e){}

		 @Override //iconifiée
		 public void windowIconified(WindowEvent e){}

		 @Override //de-iconifiée
		 public void windowDeiconified(WindowEvent e){}

		 @Override //pour autant que je sache, jamais appelé
		 public void windowOpened(WindowEvent e){}

		}

		//observateur du drag and drop
		MouseMotionListener

		//observateur du scroll
		MouseWheelListener

Pour ajouter un Listener (sensibiliser) à un composant, il y a
généralement une méthode :code:`add...Listener`.

.. code:: java

	JButton b;
	...
	b.addActionListener(new ClasseImplementsActionListener());

Notes

	* actionListener : ne marche que pour les boutons
	* windowListener : JFrame, ...
	* mouseListener : tout le monde

.. hint::

	Ce sont toutes des interfaces mais elles ont aussi une version héritable (Adapter)
	avec toutes les méthodes vides. (MouseAdapter pour MouseListener, etc...)

Création Alternative : a éviter
=========================================

Ceci est expliqué ailleurs, voilà uniquement les alternatives pour éviter
de créer un fichier .java pour chaque listener mais attention : vous êtes potentiellement un mauvais développeur.

La logique est la même pour tout type de listeners.

Version 1 : Classe anonyme (donc pas de documentation)

.. code:: java

	JButton b;
	...
	b.addActionListener(new ActionListener(){
	 @Override
	 public void actionPerformed(ActionEvent e){
		// code ici
	 }
	});

Version 2 : Lambda expression (donc pas de documentation + portée/environnement inconnu)

.. code:: java

	JButton b;
	...
	b.addActionListener(e -> {
	 // code ici
	});

Version 3 : Classes avec (multi-)implements (pas de séparation donc moins lisible, paradigme iceberg
car les méthodes sont publiques!!!)

.. code:: java

	public class Programme implements ActionListener {
	 // on met le code ici mais ce n'est pas important
	 public void create(){
	  JButton b;
		...
		b.addActionListener(this);
	 }

	 @Override
	 public void actionPerformed(ActionEvent e){
		// code ici
	 }
	}

Version 4 : classes statiques (ok si classe interne est private)

.. code:: java

	public class Programme {
	 // on met le code ici mais ce n'est pas important
	 public void create(){
	  JButton b;
		...
		b.addActionListener(new MonListener());
	 }

	 private static final class MonListener implements ActionListener {
	  @Override
	  public void actionPerformed(ActionEvent e){
	   // code ici
	  }
	 }
	}