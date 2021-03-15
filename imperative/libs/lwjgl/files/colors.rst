===========
Couleurs
===========

Dans la section Dessin, nous avons vu comment dessiner des formes. Ici nous allons voir comment les colorier.

La méthode :code:`glColor4f(float red, float green, float blue, float alpha);`
fait que les prochains éléments dessinés, le seront de cette couleur jusqu'au prochain éventuel changement de couleur.

On note qu'il existe une version 3f pour rgb et 4f pour rgba.

A quoi sert le alpha ? Bonne question, je ne sais pas et il ne modifie rien a priori (la transparence ne change pas).

On peut noter également que comme pour les fonction glVertex2f, la dernière lettre est le type des arguments :
f pour float, i pour int, d pour double et s pour short. On peut également rajouter un v après le type pour
passer un tableau du type de la lettre précédente plutôt que de passer 3 ou 4 composantes.

.. code:: java

		private void render(){
		 // colorie en jaune
		 GL11.glColor4f(255f,255f,0f,255f);

		 // dessine notre quad - (méthode crée dans la partie dessin)
		 Figures.drawQuad(50f,100f);
		}

On peut colorier chaque vertex séparément (on va modifier notre méthode drawQuad)

.. code:: java

		import org.lwjgl.opengl.*;

		public class Figures {
		 public static void renderQuad(float x,float y,float[][] colors){
			GL11.glColor4f(colors[0][0],colors[0][1],colors[0][2],colors[0][3]);
			GL11.glVertex2f(x,y); // sommet haut gauche

			GL11.glColor4f(colors[1][0],colors[1][1],colors[1][2],colors[1][3]);
			GL11.glVertex2f(y,y); // sommet haut droit

			GL11.glColor4f(colors[2][0],colors[2][1],colors[2][2],colors[2][3]);
			GL11.glVertex2f(y,x); // bas droit

			GL11.glColor4f(colors[3][0],colors[3][1],colors[3][2],colors[3][3]);
			GL11.glVertex2f(x,x); // bas gauche
		 }

		 public static void drawQuad(float x,float y,float[][] colors){
			GL11.glBegin(GL11.GL_QUADS);
			 renderQuad(x,y,colors);
			GL11.glEnd();
		 }
		}

Et dans le main

.. code:: java

		// set the color of the quad (R,G,B,A)
		GL11.glColor4f(1f,1f,0f,1f);

		float[][] colors;		// 4 composantes
		colors = new float[][]{ {255f,0f,0f,0f},	//rouge	/*4 vecteur*/
		 {255f,255f,0f,0},  	// jaune
		 {0f,255f,0f,0f},  	// vert
		 {0f,0f,255f,0f} };	// bleu

		// draw quad
		Figures.drawQuad(50f,100f,colors);