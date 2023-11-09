# Unity Models & Sprites 🩻

<hr class="sep-both">

## Sprites

<div class="row row-cols-lg-2"><div>

Unity sprites are 2D flat images that can be moved, rotated, and scaled within the game environment. They can represent characters, objects, backgrounds, and other elements in a game.

Given a [texture](../materials/index.md#textures), set the "Texture Type" to "Sprite" to create a sprite.

📚 You may modify the pixel by unit value too, if the sprite is too large for your game scale.
</div><div>

#### SpriteSheet

A sprite sheet is a big image with a lot of sprites in it. It's a common practice to optimize multiple operations using textures.

* Set "Sprite Mode" to "Multiple"
* Open the sprite editor
* Slide the image (automatic vs grid)
* Apply changes
</div></div>

<hr class="sep-both">

## Unity Meshes

<div class="row row-cols-lg-2"><div>

A mesh is a "skeleton" that the graphic card will use to render an object. It's not commonly used in 2D games, only 3D games.

Every game object that uses a mesh will have two components.

The **Mesh filter** tells which mesh should be rendered. It could be a cube, a cylinder, or your custom mesh/3D models from Blender 😎.
</div><div>

The **Mesh renderer** is used to configure how to render the mesh.

* Apply a [material](../materials/index.md)
* Lightning
* ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Import FBX in unity

* Animation type => humanoid
* Configure avatar definition => match our character
* Animation => loop => bake into pose???
* Click on materials => extract => fix now
</div><div>
</div></div>