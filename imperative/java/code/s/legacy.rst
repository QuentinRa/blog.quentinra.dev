====================================
Héritage et Substitution de liskov
====================================

Java propose un mécanisme d'héritage. Vous pouvez créer une classe qui hérite des propriété
d'une autre classe. Si vous voulez, vous pouvez réécrire (overrides)
le code de certaines méthodes.

Attention toute fois

	* vous ne pouvez héritez que d'une classe
	* une classe finale (:code:`final class NOM { ... }`) ne peut pas être héritée
	* vous ne pouvez pas Overrides une méthode static

La classe enfant va hériter des méthodes public et protected du parent,
static ou non ainsi que de ses attributs public ou protected.

Par défaut, toutes les classes héritent de Objet et possède donc des méthodes vues
en Introduction.

Déclaration
=========================

On déclare une classe héritant d'une autre
avec :code:`public class Enfant extends Parent { ... }`.

.. code:: java

	public class Parent {
		private int attribut1; // le fils ne pourra pas y toucher
		protected int attribut2; // le fils pourra toucher a cet attribut

		// constructeur protected donc seulement les enfants peuvent créer cette classe
		protected Parent(int attribut1){
 		 this.attribut1 = attribut1;
 		 this.attribut2 = 2*attribut1;
 		}
	}

	public class Enfant extends Parent {
		protected Enfant(){
 		 super(5); // appel du constructeur parent avec attribut1=5
 		}

		public int getAttribut2(){ return this.attribut2; } // marche car protected
	}

Le mot clef super
===========================

Le fils et le père ayant les mêmes méthodes, le mot clef this ne suffit pas pour référer
les méthodes du père. On utilise le mot clef :code:`super()` pour référencer
un constructeur parent (comme le this()) et on utilise :code:`super.methode()`
pour référencer la méthode du père (comme le this.methode()).

Réécriture (overrides)
==============================

Démonstration par l'exemple

.. code:: java

	public class Parent {
		public int retourneNombre(){ return 5; }
	}

	public class Enfant extends Parent {

		// la méthode ne retourne maintenant plus 5 mais 7.
		@Overrides
		public int retourneNombre(){ return 7; }
	}

L'annotation @Overrides est facultative mais recommandée pour montrer
que vous avez intentionnellement réécrit la méthode.

Vous ne pouvez pas baisser le droit d'accès (public (père) vers privé (fils)) mais
vous pouvez l'augmenter (protected (père) vers public (fils)).

Substitution de liskov
===============================

Le principe de la substitution de liskov est que si une classe enfant hérite d'une classe Parent,
alors comme l'enfant possède au moins les méthodes du parent, il peut être utilisé là ou on a besoin du parent.

On peut donc faire passer un enfant pour son parent.

1. Un exemple

Une méthode qui demande un object de la classe JComponent par exemple, va prendre en argument un
JComponent et n'importe quelle classe qui hérite de JComponent.

.. code:: java

		// la méthode en question
		public void draw(JComponent c){}

		//On peut passer toutes les classes qui héritent de JComponent
		draw(new JFrame()); // ici JFrame extends JComponent donc ça marche
		draw(new JTextField()); // pareil
		draw(new JPanel()); // pareil

2. Un autre exemple

.. code:: java

		public class A {}
		public class B extends A {}
		public class C extends A {}

		A a = new A(); // marche (logique)
		A a = new B(); // marche aussi (car B extends A)
		A a = new C(); // marche aussi (car C extends A)

.. important::

	Attention, un fils peut remplacer son père, mais le père ne peut pas remplacer un fils. Le fils
	hérite du père donc il a ses méthodes mais le père n'hérite pas du fils et n'a donc pas des méthodes
	que vous auriez rajouté.