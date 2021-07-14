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

Some tips I'm gathering are [here](tips.md)
and [here](tde.md) are my notes about the
TopDownEngine (paid asset).

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

* **Animations**: ...
* **Audio**: ...
* **Cutscene**: ...
* **Editor**: ...
* **Images**: store backgrounds
* **Materials**: ...
* **Plugins**: your project plugins
* **Prefabs**: your prefabs, they are preconfigured objects
  like a player with a configuration
* **Scenes**: your scenes (unity scene files)
* **Scripts**: your C# scripts (.cs)
* **Settings**: ...
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

<hr class="sl">

## Code

I'm using Rider to edit my C# files. I'm gone to
``edit > preferences > external tools`` and selected
Rider as External tools editor.

Sample empty class

```cs
using UnityEngine;

public class Test : MonoBehaviour
{
    // Start is called before the first frame update
    private void Start() {}
    // Awake is called when the script instance is being loaded.
    private void Awake() {}
    // Update is called once per frame
    private void Update() {}
}
```

You can declare fields ``SerializeField`` so that you can
modify this property inside unity

```cs
// you can also make it public
[SerializeField] private bool test;
// make a class available in "folder/.../name" in the
// component selector
[AddComponentMenu("folder/class")]
// adding tooltips
[Tooltip("blah blah blah")]
// The following attributes will be in this header
[Header("a header")]
// ...
// Spacing
[Space(value)]
```

Let's says you attached this csharp script to an
entity, then you can get other properties (like
the collider, ...) using

```cs
// example, get Rigidbody2D
Rigidbody2D component = GetComponent<Rigidbody2D>();
```

Input

```cs
// -1 (left) 0 or 1 (right)
// "Vertical" too
float axis = Input.GetAxis("Horizontal");
bool pressed = Input.GetKey(KeyCode.KeypadEnter);
```

Properties

```cs
// set scale, ...
Transform _transform = this.transform;
// associated gameObject
GameObject o = this.gameObject;
string tag = this.gameObject.tag;
```

<hr class="sr">

## Properties

The ``2D Collider`` is handling the collision for you
with any other GameObjects having this component.

The ``RigidComponent`` is something that you may use
to add things like gravity and make your player fall...
If you don't want your "player to fall" but you want a Rigid
body, then some are setting gravity to 0.

When you are moving a gameObject using your handwritten
script, don't forget to use this 
``pos * Time.deltaTime * speed`` (so use the
deltaTime). It will make things smoothies since your
character will move at an almost constant speed.

<hr class="sl">

## Sprites

A sprite is a character and a spritesheet is a big
having having a lot of sprites. In unity, click
on a sprite sheet then in property, set ``Sprite mode``
to ``Multiple`` to tell unity that this image is composed
of multiples images. Then in sprite editor, slide
the image (either using automatic or grid) and apply
your changes. You should now see only one frame/sprite
when dragging your sprite inside the scene.

You may (or not)

* change filter mode (to point)
* disable compression
* change the pixel by unit

<hr class="sr">

## Animations

An animation seems to be made of an animator (handling
the animations/states) and animations. An animation would
be idle, running, jumping, ... while the animator would
defines what make you move from idle to running.

Create and add an animator controller to a GameObject.
Then create animations (you need to select the time
and the image loaded at this time). Then in the animator
you must add transition 

* select a parameter
  * in animator create a parameter
  * in the transition, add a condition on the parameter
  * in the code, change the parameter
  
```cs
// let's says that at some point you did
Animator anim = GetComponent<Animator>();
// then you can write in Update
// (you should not use a string but an id, stored in a static 
// const using Animator.StringToHash("name"))
anim.SetBool("name", false);;
anim.SetFloat("name", 0);;
anim.SetInteger("name", 0);;
anim.SetTrigger("name");;

// some are also using
// instead of params and so on (so you are
// manually asking for an animation)
anim.Play("anim_name");
```

* you may uncheck ``Has exit time`` so you don't have
  delay when changing state
* ``Any state`` means that if the condition is true, then from any state
  you can move to another state

This is a summary of this 
[great video](https://www.youtube.com/watch?v=Gf8LOFNnils&ab_channel=PandemoniumGames) 
if you can watch it that's better.

<hr class="sl">

## UserInterface

**In 2021, you might look at the UI Builder**, to
create UserInterfaces (UI), like in this 
[video](https://www.youtube.com/watch?v=NQYHIH0BJbs&ab_channel=CocoCode).

Otherwise, first create a canvas (ui > canvas) for your UI. Then
you can

* load a background
  * create a new ui > image
  * anchor presets: alt + stretch x/y (bottom right corner)
  * then drag and drop an image into the slot
  * you may have to transform your image into a sprite
  * video [here](https://www.youtube.com/watch?v=RsgiYqLID-U&ab_channel=CocoCode)
  * to make a **blur** background (like your game
    behind the UI) it's complicated 
* you create buttons with ui > buttons then set the text,
  you may set an image as a background (you may
  look into [9patch](https://www.construct.net/en/make-games/manuals/construct-3/plugin-reference/9-patch),
  explained in the video too)
* you create labels with ui > text then set the text
* you can use layouts (like in Java) but using
  anchors may be enough for a simple UI
  ([video here](https://www.youtube.com/watch?v=HwdweCX5aMI&ab_channel=GameDevGuide))
* if you want some resizing (and you are not using
  anchors) then 
  * add a canvas scaler to your canvas
  * set scale mode to "scale with screen size"
  * and give it a size

You can make your hierarchy looks better using 
this [plugin](https://github.com/febucci/unitypackage-custom-hierarchy)
following this [video](https://www.youtube.com/watch?v=Gma7IXPj4wI&ab_channel=CocoCode)

You may create advanced buttons using this
[video](https://www.youtube.com/watch?v=cW-E4WEogzE&ab_channel=CocoCode)
  * create a button add a text and an image
  * add a horizontal layout component to the button
  * set the spacing, ...
  * then on the image, you can add a layout element
  to resize the image
  * you can add a "content size fitter" to make the button
  resize itself (set fit to preferred size)

<hr class="sr">

## Resources visited

TileMaps

* [TileMap](https://www.raywenderlich.com/23-introduction-to-the-new-unity-2d-tilemap-system#toc-anchor-006)
* [Generate 2.5d map](https://hexiledgames.itch.io/25d-tilemaps-and-voxel-terrain-generator)
* [3D Map editor](https://fertile-soil-productions.itch.io/mast)

Assets

* [szadiart (great / paid)](https://szadiart.itch.io/)
* [Clean GUI](https://assetstore.unity.com/packages/2d/gui/flat-clean-gui-over-200-png-files-110987)
* [MMORPG engine (not tested)](https://assetstore.unity.com/packages/templates/systems/ummorpg-2d-remastered-mmorpg-engine-102632)
* [Networking library](https://github.com/vis2k/Mirror)

UI

* [MainMenu UI](https://www.youtube.com/watch?v=RsgiYqLID-U&ab_channel=CocoCode)
* [Simple UI](https://www.youtube.com/watch?v=xmR07iBW7zk&ab_channel=CocoCode)