=================================
Vocabulaire
=================================

Afin d'aider à la compréhension de toutes ces
notions théorétiques, nous allons utiliser
le code théorique (donc il ne compilera pas) suivant comme référence.

.. code:: java

	public class Personne {
	 public static final int MAJORITÉ = 18;
	 private static int nombre = 0;
	 private int age;
	 private final String nom;
	 private final String prénom;

	 public Personne(String nom, String prénom){
	  this.nom = nom;
	  this.prénom = prénom;
	  this.age = 0;
	  Personne.nombre++;
	 }

	 // setter
	 public void setAge(int age){ this.age = age; }

	 // getters
	 public int getAge(){ return this.age; }
	 public int getNom(){ return this.nom; }
	 public int getPrénom(){ return this.prénom; }

	 public int calculAnnéeNaissance(){ return ...; }

	 public static int nombreDePersonnes(){ return nombre; }
	}

	Personne jean = new Personne("Dupont", "Jean");
	jean.setAge(23);
	jean.getAnnéeNaissance(); // retourne par exemple 2021-23=1998
	Personne.nombreDePersonnes(); // retourne par exemple 421 888 315

Présentation du vocabulaire
-------------------------------

Classe
	Une classe est un concept abstrait,
	il s'agit d'une représentation de l'idée qu'on se fait de quelque chose.

	:code:`Ici` : la classe est "Personne".

Objet ou Instance
	Lorsqu'on donne des valeurs aux propriétés d'une classe alors on obtient un objet.

	:code:`Ici` : Jean Dupont, 23 ans est un objet de la classe personne.

Attributs
	On appelle attributs les propriétés d'une classe.
	Ils ont un type (String, int, ...).

	:code:`Ici` : les attributs sont age, nom, prénom.

	Attributs statiques/Attributs de classe
		Il se peut que vous vouliez créer un attribut qui ait la même valeurs dans toutes les classes,
		par exemple un entier qui augmente de 1 à chaque fois qu'une instance est crée.

		:code:`Ici` : attribut nombre.

	Constantes
		Une constante est un attribut dont la valeur ne peut être modifiée.

Méthodes
	Il s'agit d'un bout de code faisant une action (équivalent d'une fonction).

	:code:`Ici` : calculAnnéeNaissance.

	Accesseurs
		On distingue des méthodes particulières appelés accesseurs qui modifient
		(setters) ou retournent (getters) les valeurs des attributs. Les setters
		commencent par set et le getters par get.

		:code:`Ici` : getAge, getNom, getPrénom, setAge.

	this
		Dans une méthode, il se peut que vous vouliez référencer l'objet actuel
		donc celui qui appelle la méthode (par exemple pour changer un attribut etc.).

		Le mot clef :code:`this` contient l'objet actuel.

		:code:`Ici` : On peut faire this.prénom, ... ou this.méthode(), ... dans les méthodes.

	Méthodes statiques = fonction
		Il se peut que vous vouliez faire une méthode donc le code ne dépends pas des attributs
		de l'objet qui l'appelle (donc pas de this.). Cette méthode est appelée depuis le nom de la
		classe.

		:code:`Ici` : nombreDePersonnes.

Présentation des bonnes pratiques
----------------------------------------

Classe

	* Commence par une majuscule
	* On utilise la notation CamelCase (ex: LePrix par le_prix ou Le Prix)
	* Le nom doit être parlant

Attributs

	* pas de caractères bizarres (accents, ...) donc pas de "prénom"
	* Le nom doit être parlant
	* une constante est toujours écrite en majuscules

Méthodes

	* une méthode à une seule sémantique
	* idéalement, une méthode fait 10 lignes
	* chaque méthode doit être simple, atomique (rejoint 1 et 2)
	* Le nom doit être parlant, pas d'accents (ou autres), CamelCase, ...
	* éviter les fonctions (donc les méthodes statiques)


