# Scripts

Scripts are in **C#**, an old version of C#. From [this page about the C# compiler](https://docs.unity3d.com/2020.3/Documentation/Manual/CSharpCompiler.html), Unity 2020.3 (LTS) is using **C# 8.0**. In **2021.2+**, they are using **C# 9.0**, but of course, we are not using a non-LTS version. You should also note that even if they are using versions 8.0 or 9.0, **every feature of C# is not available** (check on the page above, for "Unsupported features").

Right-click inside the **project window**, create a new Folder "Scripts" and a new script (ex: "Example.cs").

<div class="text-center">

![Unity create script](images/script.png)
</div>

<div class="row">
<div class="col-md-6">

```cs
using UnityEngine;

public class Example : MonoBehaviour
{
    // Awake is called when the script instance is being loaded
    private void Awake() { }

    // Start is called before the first frame update
    private void Start() { }

    // Update is called once per frame
    private void Update() { }
}
```
</div>
<div class="col-md-6">

### Explanations

After removing unused imports, I added the Awake function. This is a sample of the 3 functions you will use.

</div>
</div>

> **Note**: In C#, you can use `var` instead of the type of a variable when creating a variable with a value, to ask the compiler to infer a type. This is a kind of lazy practice 🙄.

<hr class="sl">

<details class="details-border">
<summary>Note that you can easily link components using this</summary>
<br>

```cs
[SerializeField] private GameObject player;
```

Giving you

![Submit player serializable](images/player_s.png)

And you simply have to drag-and-drop a game object (ex: a player) from the **Hierarchy window** to this field. This is useful when you don't want to do tiring things (ex: using tags/...) to get another GameObject.

Note: you can use the small dot too ![Submit player serializable - dot](images/field_dot.png), to see a list of GameComponent this field can take.
</details>

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

<hr class="sl">

> **Beware!** As a script can be added to multiple GameObject, if you are handling events using this (in Update), you will update every GameObject. You have functions for mouse related stuffs in MonoBehaviour that you can override such as
> ```cs
>  private void OnMouseUp() {}
>  private void OnMouseDown() {}
>  private void OnMouseOver() {}
>  private void OnMouseEnter() {}
>  private void OnMouseExit() {}
> ```

<hr class="sr">

## Materials and Sprites

<details class="details-e">
<summary>Materials</summary>

This is a sort of skin, for 3D models.

* In the Project window
* **[Optional]** In a folder Materials
* Right-click > Create > Material
* **[Optional]** you may set the material as Transparent, if you are intending so make it a light source (trick)
* **[Up to you]** you can change the **color** on the line "Albedo"
* **[Up to you]** you can set an **image** (=texture) by clicking on the little circle with a dot inside, right before "Albedo"
* **[Up to you]** you can enable emission and set a color, if you want this color to be emitted from your material (trick)

To apply one,

* Click on a Game object
* Mesh Renderer > Materials
* Drag and drop your Material from the Project window to the input field

</details>

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