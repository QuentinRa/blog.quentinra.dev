## Tilemap

A tilemap is a map of tiles, and a tile is an image. You can have a Rectangular or an Isometric tilemap. This is a convenient way of creating 2D maps since

* you create a palette
* you create tiles layers (ground, ...)
* and you move your tiles (grass, ...) to your map, in the right layer
  
Creating a layer allows you to put things on top of another. In Unity, you will have a grid and each tilemap is a layer. If you want something to be above or below the player, then play with the property `Order in Layer`.

<hr class="sl">

## Code

I'm using Rider to edit my C# files. I'm gone to `edit > preferences > external tools` and selected Rider as External tools' editor.

You can declare fields `SerializeField` so that you can modify this property inside Unity

```cs
// same as public
[SerializeField] private bool test;
// make a class available in "folder/.../name" in the
// component selector
[AddComponentMenu("folder/class")]
// adding tooltips
[Tooltip("blah blah blah")]
// The following attributes will be inside this header
[Header("a header")]
// ...
// Spacing
[Space(value)]
```

Let's say you attached a C# script (add script, mono behavior, on a GameObject) to a GameObject, then you can get other properties (like the collider, ...) using

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

The ``2D Collider`` is handling the collision for you, with any other GameObjects having this component.

The ``RigidComponent`` is something that you may use to add things like gravity and make your player fall... If you don't want your "player to fall" but you want a Rigid body, then some are setting gravity to 0.

When you are moving a GameObject using your handwritten script, don't forget to use this `pos * Time.deltaTime * speed` (=use the deltaTime). It will make things smoother since your character will move at an almost constant speed.

<hr class="sl">

## Sprites

A sprite is an image, and a sprite sheet is a big image having a lot of sprites. In unity, click on a sprite sheet then in property, set `Sprite mode` to `Multiple` to tell unity that this image is composed of multiples images. Then in sprite editor, slide the image (either using automatic or grid) and apply your changes. You should now see only one frame/sprite when dragging your sprite inside the scene.

You may (or not)

* change filter mode (to point)
* disable compression
* change the pixel by unit

<hr class="sr">

## Animations

"Animations" are made of an animator (handling the animations/states) and animations. An animation would be idle, running, jumping, ... while the animator would define what makes you move from idle to running.

Create and add an animator controller to a GameObject. Then create animations (you need to select the time and the image loaded at this time). Then in the animator, you must add the transitions.

* select a parameter
  * in animator, create a parameter
  * in the transition, add a condition on the parameter
  * in the code, change the parameter
  
```cs
// let's say that at some point you did
Animator anim = GetComponent<Animator>();
// then you can write in Update
// (you should not use a string but an ID, stored in a static 
// const using Animator.StringToHash("name"))
anim.SetBool("name", false);;
anim.SetFloat("name", 0);;
anim.SetInteger("name", 0);;
anim.SetTrigger("name");;

// some are also using this
// instead of parameters and so on (so you are
// manually asking for an animation)
anim.Play("anim_name");
```

* you may uncheck ``Has exit time`` so you don't have a delay when changing state
* ``Any state`` means that if the condition is true, then from any state you can move to another state

This is a summary of this [great video](https://www.youtube.com/watch?v=Gf8LOFNnils&ab_channel=PandemoniumGames) if you can watch it, that's better.

<hr class="sl">

## UserInterface

**In 2021, you might look at the UI Builder**, to create user interfaces (UI), like in [this video](https://www.youtube.com/watch?v=NQYHIH0BJbs&ab_channel=CocoCode).

Otherwise, first, create a canvas (ui > canvas) for your UI. Then you can

* load a background
  * create a new ui > image
  * anchor presets: alt + stretch x/y (bottom right corner)
  * then drag and drop an image into the slot
  * you may have to transform your image into a sprite
  * [video here](https://www.youtube.com/watch?v=RsgiYqLID-U&ab_channel=CocoCode)
  * to make a **blur** background (like your game behind the UI) it's complicated 
* you create buttons with ui > buttons, then set the text, you may set an image as a background (you may look into [9patch](https://www.construct.net/en/make-games/manuals/construct-3/plugin-reference/9-patch), explained in the video too)
* you create labels with ui > text, then set the text
* you can use layouts (like in Java) but using anchors may be enough for a simple UI ([video here](https://www.youtube.com/watch?v=HwdweCX5aMI&ab_channel=GameDevGuide))
* if you want some resizing (and you are not using anchors) then 
  * add a "canvas scaler" to your canvas
  * set scale mode to "scale with the screen size"
  * and give it a size

You can make your hierarchy looks better using this [plugin](https://github.com/febucci/unitypackage-custom-hierarchy) following this [video](https://www.youtube.com/watch?v=Gma7IXPj4wI&ab_channel=CocoCode)

You may create advanced buttons like in this [video](https://www.youtube.com/watch?v=cW-E4WEogzE&ab_channel=CocoCode)
  * create a button add a text and an image
  * add a horizontal layout component to the button
  * set the spacing, ...
  * then on the image, you can add a layout element to resize the image
  * you can add a "content size fitter" to make the button resize itself (set fit to preferred size)

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

Youtube channels

* [GameDevGuide](https://www.youtube.com/c/GameDevGuide/videos) (great tutorials about UI and general stuffs)