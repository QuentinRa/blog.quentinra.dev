# Mesh

A mesh is something that we will send to the graphic card, containing information about what the graphic card will have to render. This is ways more complicated than this, it's well [explained here](https://ahbejarano.gitbook.io/lwjglgamedev/chapter4) if you want. **At this point, what's a mesh is not important 🧐**, but every 3D game object will have two components

* a **Mesh filter**: tell which mesh should be rendered (ex: cube, cylinder, or your custom mesh/3D models from Blender 😎)
* a **Mesh renderer**: tell how to render a mesh
    * Apply a material (see the next section)
    * Lightning
    * ...