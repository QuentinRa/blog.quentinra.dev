=============
Composite
=============

La patron composite exploite la substitution de Liskov.

Si une classe enfant E extends (hérite) d'une classe Parent P, alors
la classe E possède les méthodes de P (et ses méthodes). On peut donc
appeler une méthode :code:`add(P argument)` par exemple en donnant un objet de type E
(même si la méthode demande un truc de type P car E n'est qu'une P avec de nouvelles méthodes).

On va donc créer une classe abstraite/interface généralement qui sera
le composant. Ensuite on aura une classe Fichier et une classe Dossier qui héritent de Composant.

L'idée générale est qu'un dossier, contient des feuilles ou d'autres dossiers.
Alors qu'une fichier ne contient rien. Si on veut compter le nombre de fichier, on
va mettre dans composant une méthode count()

	* dans un dossier, on va demander à tous les composants (feuilles/dossiers) leur count()
	* dans un fichier, on va retourner 1

Donc vous le voyez sûrement, mais on va pouvoir facilement compter le nombre de fichiers
en exploitant la généricité.

Dans l'exemple plus haut, le composite est la classe Dossier.

More

	* :code:`➡️` : par exemple pour dossiers/fichiers, arbre/feuilles, classes graphiques ...
	* :code:`✅` : facile d'ajouter des composants/comportements génériques et c'est flexible
	* :code:`🚫` : aucun ?

.. code:: java

		public interface Component {
		 // nombre de fichiers
		 int getFileCount();
		}

		public class File implements Component {
		 @Override
		 public int getFileCount() { return 1; }
		}

		public class Folder implements Component {
		 // all files
		 private final ArrayList<Component> content;

		 // creates
		 public Folder(Component ... content) {
			this.content = new ArrayList<>();
			this.content.addAll(Arrays.asList(content));
		 }

		 @Override
		 public int getFileCount() {
			int count = 0; // ask for each component, getFileCount
			for (Component c:this.content) {
			 count += c.getFileCount();
			}
			return count + 1; //folder count as one, why not x)
		 }
		}

		public class Test {
		 public static void main(String[] args) {
			int c = new Folder(
				new File(),
				new Folder(
					new File(),
					new Folder(),
					new Folder(),
					new Folder(),
					new File()
				),
				new File()
			).getFileCount();
			System.out.println("Count:"+c);
		 }
		}