========
Tiled
========

Juste au cas ou, Tiled est un logiciel permettant de créer des Maps 2D. Le fichier
créé est un fichier .tmx.

Lors de la création d'une map TMX, vous pouvez créer des rectangles et leur donner des propriétés.
Cela peut permettre d'identifier un objet qui est sous la forme de tiles.

	*	un message pour un panneau
	*	un nom pour l'objet

**Ouverture**

La classe TmxMapLoader charge une map Tiled.
Vous pouvez alternativement utiliser un AssetsManager.

.. code:: java

		TiledMap tiledMap;
		int tileWidth, tileHeight, numTilesHorizontal, numTilesVertical, mapWidth, mapHeight;

		//chargement de la map
		tiledMap = new TmxMapLoader().load(filename);
		//sauvegarde des propriétés
		tileWidth          = (int)tiledMap.getProperties().get("tilewidth");
		tileHeight         = (int)tiledMap.getProperties().get("tileheight");
		numTilesHorizontal = (int)tiledMap.getProperties().get("width");
		numTilesVertical   = (int)tiledMap.getProperties().get("height");
		mapWidth  = tileWidth  * numTilesHorizontal;
		mapHeight = tileHeight * numTilesVertical;

**Dessin**

.. code:: java

		OrthoCachedTiledMapRenderer tiledMapRenderer; //cached à une capacité limité (donc petites map)
		OrthogonalTiledMapRenderer tiledMapRenderer;

		tiledMapRenderer = new OrthoCachedTiledMapRenderer(tiledMap);
		tiledMapRenderer.setBlending(true);

		//ou

		tiledMapRenderer = new OrthogonalTiledMapRenderer(tiledMap, scale);

**Parcours des calques**

.. code:: none

		// MapLayer : implémentation d'un niveau

		// TiledMapImageLayer : niveau d'image
		TiledMapImageLayer#getTextureRegion() //retourne la Texture du niveau

		// TiledMapTileLayer : niveau de tiles
		TiledMapTileLayer#getCell(int x, int y)
		TiledMapTileLayer#getHeight() // hauteur du niveau, utilisé pour trouver toutes les cellules
		TiledMapTileLayer#getWidth() // largeur du niveau, utilisé pour trouver toutes les cellules
		TiledMapTileLayer#setCell(int x, int y, TiledMapTileLayer.Cell cell) //utilisé par exemple pour changer une tile

		//une cellule (tile) du niveau
		TiledMapTileLayer.Cell#getTile() //le numéro du tile dans les tileSheets
		TiledMapTileLayer.Cell#setTile(TiledMapTile tile) //le numéro du tile dans les tileSheets

**Propriétés d'une map**

.. code:: java

		MapProperties //contient les propriétés d'une map
				.containsKey(key) //contient la clef
				.get(key) //renvoi la valeur contenu à la clef