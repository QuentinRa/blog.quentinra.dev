=======================================
Classes particulières
=======================================

Il existe des classes "particulières" ou plutôt des façons
particulières de déclarer une classe.

Classes internes/imbriquées
---------------------------

Vous pouvez mettre une classe dans une autre. Généralement la classe est
static et private. Si elle est publique c'est probablement que vous devriez
faire un fichier à part. Elle peut être final aussi (interdire l'héritage).

Si la classe est static (classe imbriquée) si on y accède : :code:`UneClasse.ClasseInterne`
ou encore :code:`new UneClasse.ClasseInterne()`. Sinon vous pouvez en
faire un attribut d'instance (classe interne).

.. code:: java

	public class UneClasse {

	 private static class ClasseInterne {

	 }
	}

Les cas pratiques sont les Listeners qui sont utilisés uniquement par une classe
et dans le cas ou ne pouvez pas mettre tous ça dans un package.

Classes anonymes (dite locale)
-------------------------------

Un bon programmeur ne fait jamais de classes anonymes car il ne peut pas leur associer
de la documentation. Il s'agit d'une classe qui est créée comme une variable.

.. code:: java

	JButton b;
	...
	// personne ne connait ce listener que j'ajoute
	b.addActionListener(new ActionListener(){
	 // ...
	});

	// vous pouvez la stocker dans une variable aussi
	// je trouve ça pratique pour faire un test rapide
	ActionListener a = new ActionListener(){
	 // ...
	};

1 fichier et plein de classes
-------------------------------

Ne faites pas ça.

.. code:: java

	public class Main {
		// ...
	}

	class UneAutreClasse {
	}

	class EncoreUneAutre {
	}

Note : le nom du fichier est celui de l'unique classe publique.