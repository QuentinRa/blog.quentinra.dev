===========
Dessins
===========

Il est possible de dessiner vos propres composants.

Tous les composants (swing) héritent de la classe JComponent
et possèdent donc sa méthode :code:`paintComponent` utilisée pour se dessiner. Si vous voulez dessiner un composant,
alors il faut la réécrire.

Note: remplacer les méthodes draw... par fill... pour un composant rempli.

.. code:: java

		public class Demo extends JComponent {

		  @Override
		  protected void paintComponent(Graphics g) {
			 Graphics copy = g.create();//copie du pinceau

			 // dessin du fond si opaque (vous pouvez faire aussi super.paintComponent(g); )
			 if (this.isOpaque()) {
			  copy.setColor(this.getBackground());
			  copy.fillRect(0, 0, this.getWidth(), this.getHeight());
			 }

			 // activer/désactiver des options de dessin
			 RenderingHints rh = new RenderingHints( // améliore la qualité du dessin
			  RenderingHints.KEY_ANTIALIASING,
			  RenderingHints.VALUE_ANTIALIAS_OFF);
			 copy.setRenderingHints(rh);

			 // Exemples
			 copy.setColor(Color color);
			 copy.setFont(Font font);

			 // formes
			 copy.drawLine(int x1, int y1, int x2, int y2);
			 copy.drawPolygon(int[] xPoints, int[] yPoints, int nPoints);
			 copy.drawRect(int x, int y, int width, int height);
			 ...

			 // image
			 // (vous pouvez récupérer une image avec Toolkit.getDefaultToolkit().getImage(path) )
			 copy.drawImage(Image img, int x, int y, ImageObserver observer)
		 }
		}