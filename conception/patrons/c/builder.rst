===========
Builder
===========

Un patron génial ! En fait c'est la solution de la vie : lorsque vous avez un problème
complexe, c'est généralement plus simple de le découper en petits bouts et de
traiter chaque bout un par un.

More

	* :code:`➡️` : par exemple c'est probablement mieux de faire le menu, le contenu et le footer dans 3 méthodes pour un site/fenêtre graphique
	* :code:`✅` : code plus clair et modulable (facile de changer le menu/le footer par exemple)
	* :code:`🚫` : aucun ?

.. code:: java

		import javax.swing.*;

		public interface FrameBuilder {
		 // generates header : menus, title, logo, ...
		 JPanel generatesHeader();
		 // generates page view
		 JPanel generatesContent();
		 // generates footer : logo?, tos, legal terms, ...
		 JPanel generatesFooter();
		}

Vous devriez le voir, mais dans toutes vos pages (je part du principe que vous faites
une sorte d'application web en JAVA avec la librairie graphique swing) vous aurez
probablement le même header/footer juste le Content qui change, donc on aurait un truc
du genre

.. code:: java

		// a page of our website
		public abstract class AbstractPage implements FrameBuilder {
		 @Override
		 public JPanel generatesHeader() { /* code ici */ }

		 @Override
		 public JPanel generatesFooter() { /* code ici */ }
		}

		// on surcharge la partie qui change
		public class HomePage extends AbstractPage {
		 @Override
		 public JPanel generatesContent() { /* code ici */ }
		}

		// on surcharge la partie qui change
		public class ContactPage extends AbstractPage {
		 @Override
		 public JPanel generatesContent() { /* code ici */ }
		}