=======================
Création d'une classe
=======================

La déclaration est la suivante.

.. code:: java

	public class IciLeNomDeLaClasse {
	 // ici le code de la classe
	}

Notes

	* 1 fichier java = 1 classe du même nom
	* vous pouvez mettre plusieurs classes dans 1 fichier, si elles ne sont pas publiques. Ne le faites jamais.
	* vous pouvez déclarer une classe dans une autre. Ceci sera abordé ailleurs.

Attributs
----------

Exemple de déclarations

.. code:: java

	public class IciLeNomDeLaClasse {
	 // exemples de déclaration d'attributs, généralement au début
	 public static final type CONSTANTE = valeur; // constante
	 private type attribut; // attribut privé
	 protected type attribut; // attribut protected (privé + hérité)

	 // ...

	}

Constructeur
--------------

C'est normalement dans le constructeur (et uniquement dedans) que vous initialisez
vos attributs, que vous préparez votre objet.

Il existe un constructeur par défaut, sans argument qui met les valeurs à null/0
mais si vous ajoutez un constructeur alors il est supprimé (donc faut le réécrire en brut
si besoin). Les constructeurs avec des arguments sont dits "valués".

Un constructeur est une méthode sans type de retour, du même nom que la classe, généralement
public.

.. code:: java

	public class NomClasse {
	 private int unEntier;
	 private String uneString;

	 // constructeur valué
	 public NomClasse(int unEntier){
	  this.unEntier = unEntier; // on met "this" pour dire qu'on parle de notre attribut
	  this.uneString = "";
	 }

	 // réécrit le constructeur sans arguments, qui appelle l'autre constructeur
	 public NomClasse(){
		this(0); // appelle NomClasse(0)
	 }
	}

Méthode
-----------

L'ordre des méthodes, ... n'est pas important (sauf pour la javadoc qui mets la documentation
dans le même ordre).

.. code:: java

	public class NomClasse {
	 private int unEntier;
	 private String uneString;

	 public NomClasse(int unEntier){
	  this.unEntier = unEntier;
	  this.uneString = "";
	 }

	 // ici un getter retourne la valeur de l'entier
	 public int getMonEntier(){
	  return this.unEntier;
	 }

	 // un setter change la valeur de l'entier
	 public void setMonEntier(int entier){
	  this.unEntier = entier;
	 }

	}

Création d'un objet
-------------------------

Vous donnez le type de l'objet (donc sa classe)
et vous utiliser :code:`new` suivit du nom de la classe pour appeler le constructeur.

.. code:: java

	// on considère la classe NomClasse juste au dessus
	NomClasse variable;
	variable = new NomClasse(45); // on appelle le constructeur avec un entier

	// autre
	NomClasse variable = new NomClasse(45);

Vous ne pouvez pas détruire un objet. Le garbage collector regarde
en permanence les variables inutilisées et les libèrent pour faire de la place.