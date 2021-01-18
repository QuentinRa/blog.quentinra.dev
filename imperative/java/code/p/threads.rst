==========
Threads
==========

Un thread est un processus léger. Contrairement à un processus,
il est exécuter dans un processus et donc son environnement est celui du processus
(mêmes variables....)

Comme en c, le thread va exécuter une fonction. Cette fonction s'appelle Run.

Vous devez soit implémenter une classe qui extends Thread ou soit une classe qui implémente
l'interface Runnable.

.. code:: java

		public class monThread extends Thread {
		 @Override
		 public void run(){
		  //code
		 }
		}

		//alternativement
		public class monThread implements Runnable { ... }

Méthode
-----------------

.. code:: java

		Thread t = new monThread();
		//ou alors si la classe n'extends pas thread
		Thread t = new Thread(new monThread());

		//démarrer le thread
		t.start();

Méthode sleep (mettre en pause)

.. code:: java

		try {
		 // le thread est mis en pause
		 Thread.sleep(duréeEnMs);
		} catch(InterruptedException e) {
		 ...
		}

Thread-safe
---------------

Certaines méthodes ne sont pas Thread-safe, c'est à dire que leur exécution dans un autre
Thread peut provoquer une erreur. Si une méthode est Thread-safe, c'est indiqué dans la javadoc.

Il est également possible que vous changiez la valeur d'une variable lue dans un autre Thread.
Java peut avoir mis en cache la valeur de la variable donc il n'ira pas voir qu'elle a été changée.
Pour le forcer à aller voir, la variable doit être déclarée volatile.

.. code:: java

	private volatile int attribut;

Concurrence d'accès
---------------------

Il est possible que vous tentiez de modifier une variable et de la lire en même temps.
Il est possible de placer un verrou sur la variable pour éviter des valeurs incohérentes.

.. code:: java

		//Verrou sur la méthode qui modifie l'attribut
		public synchronized void methode() { ... }
		//Verrou sur une partie du code
		//déclaration du verrou (attribut)
		private Object verrou = new Object();

		public void methode() {
		 synchronized(this.verrou){
			...
		 }
		}

Thread d'événements
--------------------

Tous les événements sont gérés dans le thread d'événement, par exemple les clics, etc...
Lorsqu'une suite d'action correspondant à un événement est détecté,
alors l'événement est généré (il y a donc un léger décalage).

Thread graphique
----------------------

C'est dans ce Thread que tous ce qui est relaté aux composants graphique est fait. Vous pouvez éviter
les problèmes de "Thread-Safe" en exécutant les modifications/les méthodes liés aux éléments
graphiques dans ce Thread.

.. code:: java

		// ajoute du code à exécuter sur le thread graphique
		SwingUtilities.invokeLater(Runnable);