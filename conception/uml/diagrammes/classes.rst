.. _dc:

================================
Diagramme de classes (DC)
================================

| :math:`\color{grey}{Version \ 1.0.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/11/2020}`

.. note::

	Vous avez à votre disposition un cours avancé sur
	les diagrammes de classes ici : :ref:`dc_advanced`

1. Classe et objet
==============================

.. uml::

	Personne : + age() : int
	Personne : + age : int
	Personne : - prenom : varchar
	Personne : - nom : varchar

	object "<u>personne1" as p1

	p1 : prenom = "Numphy"
	p1 : nom = "Gamma"
	p1 : age = "25"

:code:`Personne` est une **classe**, c'est à dire une représentation abstraite de quelque chose (ici une personne).
Elle contient des champs appelés **attributs** dans lequel on mettera des valeurs (age, prenom, nom). Elle
contient également des fonctions appelées **operations** qui sont les opérations que je peut appliquer
sur ma classe (ici l'opération age retourne un int : entier qui indiquera l'age de la personne).

:code:`personne1` est un **objet** de la classe personne, c'est à dire que l'on a donné des valeurs
aux attributs.

.. note::

	On souligne généralement les objets. Les classes commencent généralement par une majuscule.

2. Attributs, opérations et types
====================================

Un attribut ressemble à ça :code:`/ v nom : type = valeur`
mais en retirant les éléments facultatifs, vous verrez plus :code:`nom : type`.

	* :code:`/` : facultatif, indique un attribut dérivée cad obtenu avec les valeurs de d'autres attributs
	* :code:`v` : facultatif, la visibilité de l'attribut (publique par défaut notée +, privé -, package ~ et hérité #).
	* :code:`nom` : nom de l'attribut
	* :code:`type` : type de l'attribut, si l'attribut est multivalué on le note type[min..max].
	* :code:`valeur` : facultatif, valeur par défaut (peut être un ensemble).

Les types généralement utilisés sont

=============================== ========================================================================================
Type                            Description
=============================== ========================================================================================
varchar(n)                      chaine de caractères de taille maximum n
int/number ou int(n)            un entier (si n alors n chiffres, 11 par défaut, int(0) = booléen)
text                            chaine de caractères de taille infinie
float ou real                   un réel
string                          n'existe généralement pas mais souvent utilisé pour une chaine de caractères
boolean                         n'existe généralement pas mais souvent utilisé pour les booléens
decimal(n,p)                    chiffre de taille n dont p chiffres après la virgule
date                            contient une date
=============================== ========================================================================================

Remarque : certains attributs ont pour type une autre classe, on parle d'attribut composé.
Certains plutôt que de les mettre dans la classe, préfère les mettre sur les associations.

Opérations

Une opération est de la forme :code:`v nom(args: type, ...) : r`.

	* :code:`v` : facultatif, la visibilité de l'attribut (publique par défaut notée +, privé -, package ~ et hérité #).
	* :code:`args:type` : facultatifs, pour chaque argument de l'opération, on met :code:`args` : le nom et :code:`type`: le type de l'argument
	* :code:`r` : facultatif, si votre fonction retourne quelque chose, alors le type de ce qui est retourné

.. note::

	Il existe des fonctions qui ont pour but de créer des objects. On les appellent :code:`Constructeurs`.
	Ils ont généralement le même nom que la classe et n'ont pas de type de retour. On ajoute généralement
	« constructor » devant le nom, juste après la visibilité.

.. warning::

	Un attribut/opération souligné est un attribut/opération de classe (static), donc la valeur
	de cette attribut est la même dans tous les objets de la classe !

	Les constantes sont généralement statiques.

3. Associations et multiplicité
====================================

.. uml::

		ClasseA "n" -- "m" ClasseB : nom

Si deux classes (donc leurs objets) interagissent avec d'autres classes (donc des objets d'autres classes),
alors on représente cette interaction par un train appelé association. Les association ont généralement
un nom, aucun sens, et une multiplicité.

**Multiplicité**

La multiplicité représente combien d’objets d’une classe sont en relation
avec combien d’autres d’une autre classe. On note :

		* n : exactement n éléments
		* :math:`*` : entre 0 et inf
		* n..m : entre n et m, par exemple 0..1

On lit la multiplicité comme suit : La classe A est en relation avec m instances de B, et la classe
B est en relation avec n instance de A.

.. note::

	Une association entre deux objets est appelée un lien.

**Classes d'associations**

Une classe d'association est un moyen de faire porter plus d'information
à une association qu'uniquement son nom.

.. uml::

		class Student {
			Name
		}
		Student "0..*" - "1..*" Course
		(Student, Course) .. Enrollment

		class Enrollment {
			drop()
			cancel()
		}

.. note::

	Une association d'une classe vers elle même est appelée **association réflexive**.

	Il est possible d'y avoir plusieurs associations entre deux classes.

4. Généralisation ou spécialisation
=======================================

La généralisation est aussi appelé **héritage** par abus de langage (héritage
est une notion concrète donc une implémentation de la généralisation
qui est le concept abstrait).

Si des classes ont un/des éléments (attributs/opérations)
en commun alors on peut les regrouper dans une superclasse/classe parent.

La généralisation sert majoritairement à grouper des propriétés identiques
dans une seule classe.

Les classes appelés enfants, généralisent alors de la classe parent.

.. uml::

	Parent <|-- Enfant
	SuperClasse <|-- Classe

Il est préférable d'éviter une généralisation multiple, c'est à dire
qu'une classe devrait généraliser 0 ou 1 parents mais pas plus.

.. note::

	On parle d'héritage ou de généralisation exclusive lorsque les classes filles sont soumises
	à une contrainte d'association exclusive (voir :ref:`contraintes_association`).

	On parle d'héritage sans spécificité lorsque les classes filles n'ont pas de propriétés
	additionnelles (attributs, opérations, ...) et qu'aucune classe n'a d'association avec une classe fille.

5. Plus d'informations
====================================

.. toctree::

	Diagramme de classes (DC) - avancé <classes_advanced>

-----

**Crédits**
	* Florent Madelaine (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc Dartois (enseignant à l'IUT de Sénart-Fontainebleau)
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune