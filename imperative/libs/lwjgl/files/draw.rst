==========
Dessiner
==========

Nettoyage de l'écran
-----------------------

.. code:: java

	import static org.lwjgl.opengl.GL11.*;

La méthode :code:`void glClear(int mask);` permet de nettoyer mask qui est :
COLOR_BUFFER_BIT et/ou DEPTH_BUFFER_BIT et/ou STENCIL_BUFFER_BIT. S'il y a plusieurs arguments,
on les séparera par | .

Ex : :code:`glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)`;

Notes

	* GL_COLOR_BUFFER_BIT renvoi au buffer utilisé pour écrire/dessiner.
	* On nettoiera donc toujours le buffer (appel à glClear(GL_COLOR_BUFFER_BIT)) avant de dessiner (render).
	* GL_DEPTH_BUFFER_BIT correspond à la profondeur du clear, elle est de 1 de base. (+ d'infos ici (http://docs.gl/gl4/glClear)).
	*
		On peut choisir un couleur de clean (de base tous les pixels sont remis à noir) avec la méthode

		.. code:: java

			glClearColor(float red,float green,float blue,float alpha);

Création de formes
-----------------------

.. code:: java

	import static org.lwjgl.opengl.GL11.*;

1. On commence par préciser quel type de figure on va faire :code:`void glBegin(int mode);`
avec mode, le type de figure parmi (http://ninjacave.com/lwjglbasics3) :

	*	:code:`GL_POINTS` : trace des points (un vertex = un point (pixel)). N vecteur = N points
	*	:code:`GL_LINES` : Trace une ligne entre le 1er et le 2e vertex n fois où n représente le nombre de paires de vertex. N vecteurs = N/2 lignes
	*	:code:`GL_LINE_STRIP` :	Chaque point est connecté (par une ligne) à son suivant sauf le dernier et le premier. N vecteurs = N-1 lignes
	*	:code:`GL_LINE_LOOP` :	Tous les points sont connectés (par une ligne) entre eux. N vecteurs = N lignes
	*	:code:`GL_TRIANGLES` :	Trace un triangle tous les 3 vecteurs.(les vecteurs en plus sont ignorés.) 3N vecteur = 1 triangles
	*	:code:`GL_POLYGON` : Trace une figure avec tous les vecteurs N vecteurs = 1 polygon
	*	:code:`GL_QUADS` : Dessine un quadrilatère (une figure a 4 côtés). 4 vecteur = 1 quad
	* plus de figures sur : http://docs.gl/gl3/glBegin


2. On vient d'ouvrir un bloc dans lequel on va déclarer des vecteurs à 2,3 ou 4 dimensions.

.. code:: java

	glVertex2f(float x, float y); //vecteur à deux dimensions
	glVertex3f(float x, float y, float z); //vecteur à trois dimensions
	glVertex4f(float x, float y, float z, float w); //vecteur à 4 dimensions

On note que les fonctions finissent par un f car c'est la version float, mais il existe une version int (i),
double (d), une version short (s). On peut également rajouter un v pour passer un tableau uniquement plutôt
que de passer 2,3 ou 4 coordonnées.

On note que par exemple pour un carré, les points sont dans l'ordre

	* sommet haut gauche
	* sommet haut droit
	* bas droit
	* bas gauche

(soit dans le sens des aiguilles d'une montre).

3. On ferme le bloc avec la méthode :code:`GL11.glEnd();`

Exemple, nous allons créer un quadrilatère (rectangle).

.. code:: java

		GL11.glBegin(GL11.GL_QUADS);
		 GL11.glVertex2f(0f,100f); // sommet haut gauche
		 GL11.glVertex2f(100f,100f); // sommet haut droit
		 GL11.glVertex2f(100f,0f); // bas droit
		 GL11.glVertex2f(0f,0f); // bas gauche
		GL11.glEnd();

Préciser GL11 (utiliser la classe en objet d'appel) devant glBegin, glVertex... est optionnel,
mais il vaut le mettre.

Pour aller plus loin, on peut voir que tracer un quadrilatère n'utilise que deux variables,
je peut donc créer un méthode qui va tracer le quadrilatère (static) ce qui augmentera les performances.

Dans un autre fichier (pas obligatoire) Figures.java

.. code:: java

		import static org.lwjgl.opengl.GL11.*;

		public class Figures {

		 public static renderQuads(float x,float y){
			GL11.glVertex2f(x,y); // sommet haut gauche
			GL11.glVertex2f(y,y); // sommet haut droit
			GL11.glVertex2f(y,x); // bas droit
			GL11.glVertex2f(x,x); // bas gauche
		 }

		 public static drawQuads(float x,float y){
			GL11.glBegin(GL11.GL_QUADS);
			 renderQuads(x,y);
			GL11.glEnd();
		 }
		}

Puis dans notre main

.. code:: java

		...
		Figures.drawQuads(0f,100f);
		...