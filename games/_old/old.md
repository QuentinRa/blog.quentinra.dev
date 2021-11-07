<hr class="sr">

## Game Objects in Scripts

After you attached a script to an entity, you can get other components in a script with `GetComponent<TypeOfComponent>`

![Inspector: Box collider](images/get_component.png)

```cs
// In Example.cs, I can get the BoxCollider with
BoxCollider collider = GetComponent<BoxCollider>();
```

You can also access some objects such as Transform or the tag with attributes

```cs
// associated gameObject
GameObject o = gameObject; // <=> this.gameObject
```

<hr class="sr">

Unity is providing generic support for your games, sometimes you may want more. You can add **plugins** for that. For instance, the [TopDownEngine](https://assetstore.unity.com/packages/templates/systems/topdown-engine-89636) (a **paid** asset) is providing a lot of help to create 2D/3D TopDownGames <small>(check "templates" on the unity store to see what you could expect from game templates, as you may save a lot of time with them)</small>.

## Tilemap

A tilemap is a map of tiles, and a tile is an image. You can have a Rectangular or an Isometric tilemap. This is a convenient way of creating 2D maps since

* you create a palette
* you create tiles layers (ground, ...)
* and you move your tiles (grass, ...) to your map, in the right layer

Creating a layer allows you to put things on top of another. In Unity, you will have a grid and each tilemap is a layer. If you want something to be above or below the player, then play with the property `Order in Layer`.

<hr class="sr">

## Properties

The ``2D Collider`` is handling the collision for you, with any other GameObjects having this component.

The ``RigidComponent`` is something that you may use to add things like gravity and make your player fall... If you don't want your "player to fall" but you want a Rigid body, then some are setting gravity to 0.

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