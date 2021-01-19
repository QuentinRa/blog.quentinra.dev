=============
Javadoc
=============

Le base c'est de commenter son code. La javadoc permet d'écrire
de la documentation qui donne quelque chose comme ça :
https://docs.oracle.com/javase/7/docs/api/overview-summary.html.

Par contre faire de la bonne javadoc, c'est super relou.

	* Pour une classe

		* on peut expliquer ce qu'elle fait
		* donner ses auteurs
		* sa version
		* et des classes liées (par exemple à aller voir ensuite)

	* Pour une méthode

		* on peut la décrire
		* expliquer les paramètres
		* le type de retour
		* les exceptions levées s'il y en a
		* des méthodes liées s'il y en a
		* la version depuis quand cette méthode est présente

On peut également indiquer qu'une méthode ne doit plus être utilisée avec :code::`@Deprecated`.

.. code:: java

		/**
		* description de la classe
		*
		* @author auteur
		* @author ....
		* @version 0.1 09 novembre 2019
		* @see NomClasseAConsulterEgalement
		* @see NomClasseAConsulterEgalement#nomMethode
		*/
		public class Classe{

		  /**
		  * Description de la méthode
		  *
		  * @param a description du paramètre
		  * @param b description du paramètre
		  *
		  * @return description de ce qu'elle retourne
		  *
		  * @throws NomException description de l'exception levée
		  * @see #nomMethodeConsulterEgalement
		  *
		  * @since depuis quelle version il y a cette méthode
		  */
		  public TypeRetour nomMethode(int a, int b){
		    // ici du code
		  }

		  @Deprecated
		  public void uneMethodeMorte(){ ... }

		}