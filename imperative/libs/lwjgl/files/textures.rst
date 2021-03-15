==========
Textures
==========

Une texture est une image qui peut être affichée à l'écran avec OPENGL. Il existe une méthode longue et compliquée
qui ne marche pas sur macOs mais qui est souvent utilisée et une méthode courte et simple. Les deux méthodes
nécessitent (extrêmement recommandé) la création d'une classe à part.

Chargement texture
--------------------

On va commencer par récupérer l'image, ici avec la méthode :

.. code:: java

	ByteBuffer stbi_load( String filename, IntBuffer x, IntBuffer y, IntBuffer channels_in_file, int desired_channels );

Elle prend :

	* le nom (chemin) de l'image
	* 3 tableaux pour ou elle mettre respectivement la taille, la hauteur et le nombre de composantes (<=> nombre de pixels*desired_channels)
	* et le nombre de composantes par pixel parmi

		* 0 (nombre composants image)
		* 1 (noir)
		* 2 (noir et blanc)
		* 3 (rouge, vert, bleu)
		* 4 (rouge, vert, bleu, alpha)

et renvoi null s'il y a eu une erreur de lecture.

On libèrera à la fin notre image avec la méthode :code:`void stbi_image_free(ByteBuffer image);`.

Autres
-----------

On utilise un nom/identifiant qui sert à la bibliothèque graphique pour identifier nos texture et servira
notamment pour dire quelle image on veut afficher. La méthode
:code:`int glGenTextures();` genère un nom/identifiant parmi sa liste d'identifiants libre et le retire
de sa liste. (Il est important de le conserver, dans un attribut par exemple).

La méthode suivant permet d'afficher et est indispensable pour régler des paramètres liées à notre texture.
:code:`void glBindTexture(int target, int texture);`

Texture représente l'id de notre structure, target représente la dimension de notre texture soit une valeur parmi

	* GL_TEXTURE_1D
	* GL_TEXTURE_2D
	* GL_TEXTURE_3D
	* https://javadoc.lwjgl.org/org/lwjgl/opengl/GL11.html#glBindTexture(int,int)

Création
---------

On fini par donner notre texture à OPENGL avec la méthode

.. code:: java

	void glTexImage2D(int target, int level, int internalFormat, int width, int height,int border, int format, int type, IntBuffer pixels);

On lui donne
	*	target : target (dimension)
	*	level : le niveau de reproduction de détails (vaut 0 de base)
	*	internalFormat : le format interne (RGBA, RGB, RGBA8, RGB8, ...)
	*	width/height : la largeur et la hauteur de la texture
	*	border : la taille de la bordure
	*	format : format de pixels (RGB, RGBA, ...)
	*	type : le type du buffer (GL_UNSIGNED_BYTE pour avoir toutes les couleurs d'un ByteBuffer) etc...
	*	pixels : la texture.

Voici mon code d'exemple

.. code:: java

		import java.nio.*;
		import org.lwjgl.BufferUtils;

		import static org.lwjgl.opengl.GL11.*;
		import static org.lwjgl.stb.STBImage.*;

		public class Texture {

		 // on donne un id(=nom) pour identifier nos textures (OPENGL s'en chargera)
		 private int id;
		 // largeur et hauteur
		 private int largeur;
		 private int hauteur;

		 public Texture(String cheminImage){

			IntBuffer largeur = BufferUtils.createIntBuffer(1);
			IntBuffer hauteur = BufferUtils.createIntBuffer(1);
			IntBuffer composantes = BufferUtils.createIntBuffer(1); (// RGBA

			// charge image
			ByteBuffer image = stbi_load(cheminImage,largeur,hauteur,composantes,4); // 4 RGBA
			// chargement image échoué
			if (image == null) {
			 throw new RuntimeException("load texture failed");
			}

			// mise a jour des infos
			this.id = glGenTextures(); // récupération d'un id (nom)
			this.largeur = largeur.get();
			this.hauteur = hauteur.get();

			// fais de notre texture une texture 2D
			// on fait un lien en GL11 (objet d'appel) et la texture
			glBindTexture(GL_TEXTURE_2D,this.id);

			// met le valeur GL_TEXTURE_MIN/MAG de GL_TEXTURE_2D avec celle de GL_NEAREST
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

			// donne image a OPENGL
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, this.largeur, this.hauteur, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);

			// libération de l'image
			stbi_image_free(image);
		 }

		 //Méthodes pour accéder aux attributs
		 public int getId(){
			return this.id;
		 }
		 public int getLargeur(){
			return this.largeur;
		 }
		 public int getHauteur(){
			return this.hauteur;
		 }
		}

Dessiner notre texture s'avère plus compliqué, on va dessiner une forme qui aura pour fond notre texture,
cependant la texture vit dans le repère suivant ou 0,0 est le coin supérieur gauche de sa forme et 1,0 le
coin inférieur gauche... On peut modifier cela en modifiant notre texture.

On commence par activer les textures

.. code:: java

	void glEnable(int target);

avec target la dimension. Pour afficher une image dans un carré 1280*720 à la position 0,0 on fait :

.. code:: java

		GL11.glBegin(GL11.GL_QUADS);
		 glTexCoord2f(0,0);
		 GL11.glVertex2f(0,720);
		 glTexCoord2f(1,0);
		 GL11.glVertex2f(1080,720);
		 glTexCoord2f(1,1);
		 GL11.glVertex2f(1080,0);
		 glTexCoord2f(0,1);
		 GL11.glVertex2f(0,0);
		GL11.glEnd();

Notez que le repère pour tracer des formes et le même que celui en math soit avec l'origine (0,0) EN BAS A GAUCHE.
