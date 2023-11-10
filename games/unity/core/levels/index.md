# Unity Levels & TileMap 🧸

<hr class="sep-both">

## TileMap

<div class="row row-cols-lg-2"><div>

A tilemap is a grid in which each cell is an image called a tile. It's a common way to create 2D Levels. They can be Rectangular or Isometric. TileMaps can be created using external tools such as [Tiled](/games/_knowledge/game-tools/index.md#content-map-generation-tools).

From the editor, you can:

* Create a Palette
* Create Tile Layers (ex: Ground, Props, etc.)
* Place the tiles on the tilemap

Creating Layers allows us to superpose tiles. In Unity, we create a Grid, and each tilemap is a layer.

📚 See also: the property `Order in Layer`.
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* ProBuilder
* ProGrids
* Tilesets
* Snaps
* [Edgar for Unity](https://github.com/OndrejNepozitek/Edgar-Unity)
</div><div>

Lighting

* auto generate: disable if level goes darker
* render Mode => auto/important/not pixel/vertex
* shader
* lightning => Environment => source: color
* cast shadow (mesh rendered) off for walls (wall is not casting shadows on the player)
* shadow type: hard => projected on the wall
* light with the sun transparent (mesh)
</div></div>