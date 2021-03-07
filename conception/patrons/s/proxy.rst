========
Proxy
========

Un proxy est une classe dont les méthodes appellent les méthodes
d'un autre objet. On l'a rapidement vu avec décorateur ou a beaucoup
d'endroits mais en gros un proxy P contient une instance disons d'une classe
B qui hérite d'une interface/... I. Le proxy va hériter de I, ajouter
des nouvelles méthodes mais vu qu'il a la flemme de remplir les méthodes de I,
il va utiliser une classe concrète donc B et utiliser l'implémentation de B.

En un mot : c'est un ARNAQUEUR, mais c'est très malin.

Sinon, on peut aussi utiliser un proxy pour mettre en relation un objet
et un objet distant mais bon vous voyez l'idée.

More

	*
		:code:`➡️` : par exemple, si vous avez un groupe de figures et voulez utiliser les
		méthodes de Collection, vous allez implémenter Collection (pour proposer les même fonctions)
		mais avoir une ArrayList de figures comme attribut parce que c'est le plus facile pour faire un groupe.
	* :code:`✅` : temps gagné, évite de devoir refaire des trucs déjà faits, simplifie le code
	* :code:`🚫` : un peu relou si vous avez beaucoup de méthodes dans I à "proxy-ser"

.. code:: java

		import java.util.ArrayList;

		public class Sac {
		 private final ArrayList<Object> objects;

		 public Sac(ArrayList<Object> objects){ this.objects = objects; }

		 // proxy
		 public boolean ajouter(Object o){ return this.objects.add(o); }
		 public boolean remove(Object o){ return this.objects.remove(o); }
		 public boolean contient(Object o){ return this.objects.contains(o); }
		 // ...

		}