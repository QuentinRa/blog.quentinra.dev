===========
Prototype
===========

Si vous avez des objets qui demandent beaucoup d'efforts pour être crées, alors
le patron prototype aide à la mise en place d'un clonage de l'objet pour
éviter de devoir le recréer.

More

	* :code:`➡️` : aucun exemple
	* :code:`✅` : facilement cloner un objet, sans devoir passer par un constructeur compliqué, ...
	* :code:`🚫` : l'objet doit être créé une fois, peut y avoir des problèmes de références

Je n'ai pas d'exemple pertinent, mais en Java vous avez la méthode clone()
qui doit être redéfinie donc voici un exemple bête de clone que vous pourrez utilisez
pour des objets complexes

.. code:: java

		public class CompteBancaire {
		 @Override // donnons des frayeurs aux banquiers x)
		 // on remplace bien protected par public, clone est protected par défaut
		 public Object clone() {
			CompteBancaire compte = null;
			try {
			 Object clone = super.clone();
			 if(clone instanceof CompteBancaire){
				compte = (CompteBancaire) clone;
				// modifiez les attributs
				// ...
			 } else throw new CloneNotSupportedException();
			} catch (CloneNotSupportedException e) {
			 // prévoyez un comportement alternatif
			}
			return compte;
		 }
		}