# Introduction

This is not a course, simply a gathering of
notes about unity be someone still learning it.

Unity is a game engine that you can download
[here](https://store.unity.com/fr#plans-individual),
you may use the student plan (if you are a student)
and you should also apply to
[github student pack](https://education.github.com/pack).
You will then download

* **unity hub**: a software to manage unity versions
and projects
* **unity**: downloaded through unity hub, usually peoples
are using LTS (Long term support) versions of unity
  because unity will still be maintained (bugs only)
  for 2 years.
  
Then what I did after that was playing with the samples
and following tutorials like 
[RPG in 1 hour](https://learn.unity.com/project/creator-kit-rpg?uv=2020.3)

<hr class="sr">

## Github in Unity

Unity project are made of a lot of files, and big files
too so you can't git them. Github allows you using LFS
to transfer big files and you got a plugin making things
simple in unity.

* [Follow this tutorial](https://medium.com/@j0hnm4r5/git-with-unity-92ca7854ea3d) (external)
* [Github for unity](https://unity.github.com/)
* [Github for unity (Git)](https://github.com/github-for-unity/Unity/blob/master/docs/using/quick-guide.md)

<hr class="sl">

## Starting in unity

When you are opening a project, by default you got
4 menus.

* **hierarchy window** (left): list of all **GameObjects**
* **scene window** (middle): a scene is like a screen of your
game (by default you are in the sample scene)
  * you can click on the game tab to play your game
    (you can set the resolution here too)
  * and go back to the scene tab to edit it
* **inspector window** (right): you can edit the properties
of the selected **GameObject**
* **project window** (bottom): all of your project files

The project files seems to be split by many like this

* **Art**: ...
* **Audio**: your audio files
* **Cutscene**: ...
* **Editor**: ...
* **Materials**: ...
* **Plugins**: your project plugins
* **Prefabs**: your prefabs, they are preconfigured objects
  like a player with a configuration
* **Scenes**: ...
* **Scripts**: ...
* **Shaders**: ...

Some shortcuts

* ``F``: focus a GameObject

<hr class="sl">

## Tilemap

A tilemap is a map of tiles, and a tile is an image. 
You can have a Rectangular or a Isometric tilemap. This
is a convenient way of creating 2D maps since

* you create a palette
* you create tiles layers (ground, ...)
* and you move your tiles (grass, ...) to your map,
  in the right layer
  
Creating layer allows you to put things on top of another.
In Unity, you will have a grid and each tilemap is a layer.
If you want something to be bellow / on top of the player,
then play with ``Order in Layer`` property.

<hr class="sr">

## To check list

Pathways

* <https://learn.unity.com/pathway/unity-essentials?language=en>
* <https://learn.unity.com/pathway/junior-programmer?language=en>
* <https://learn.unity.com/search?k=%5B%22ind%3A5816ce9a32b30600171bef5a%22%2C%22sl%3Abeginner%22%2C%22sl%3Aintermediate%22%5D&ob=starts>

Youtube channels

* [NoSlot](https://www.youtube.com/channel/UCgK_vbcG3YxzAMB4GOffb7w)


<hr class="sl">

## Resources visited

TileMaps

* [Generate 2.5d map](https://hexiledgames.itch.io/25d-tilemaps-and-voxel-terrain-generator)