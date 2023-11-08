# Unity Editor

<div class="row row-cols-lg-2"><div>

* [Unity Download Page](https://unity.com/pricing#plans-student-and-hobbyist)
* It will trigger the download of [Unity Hub](https://unity.com/unity-hub)
* With it, you can select which version(s) of Unity you want to install

➡️ It's recommended to pick a LTS version of the Unity Editor, as they are stable versions. They will still receive patches for 2 years.
</div><div>

...
</div></div>

As there is a lot of content about Unity, this course will only provide knowledge about the **editor itself** such as the **interface**, the **project structure**, **along with everything that is not 2D/3D-specific** such as handling **scenes**, **input**, etc.

> The previous course was about **general knowledge** related to [Unity](../unity/index.md)<br>
> You can dig more into **2D** with [Unity 2D](../unity-2d/index.md)<br>
> You can dig more into **3D** with [Unity 3D](../unity-3d/index.md)

Most of the time, you will have to go back and forth between your code and [the official documentation](https://docs.unity3d.com/Manual/index.html) or your search engine (there is a search bar in the documentation too). You may also check [the scripting reference](https://docs.unity3d.com/ScriptReference/).

> **Pro tip**: there are many ways to do something in unity.
> * First, you may use a button/... in a window 👍 (most used)
> * Second, you may use a shortcut 🚀 (best)
> * Third, you may use a toolbar menu. You can find shortcuts here if you forgot one 🧐

<hr class="sl">

## Game object

Everything in Unity is a **game object**. **Players**, **enemies**, **items**, **camera**, **sounds**, **UI elements**, **lights**, and so on, are **game objects**. It means that they got the following properties

<details class="details-s">
<summary>A <b>name</b> ✨: for you to know what's this game object</summary>

```cs
string myName = name; // or this.name or this.gameObject.name
```
</details>

<details class="details-s">
<summary>A <b>tag</b> 🏷: Quite useful. You can add a tag "enemy" <small>(you can create tags)</small> and check the tag of a game object to know if this is an "enemy". You can also find game objects by tag name.</summary>

```cs
string myTag = tag; // or this.tag or this.gameObject.tag
GameObject g = GameObject.FindWithTag("tag"); // null if not found
GameObject obj = GameObject.FindGameObjectWithTag("tag"); // FindWithTag is an alias of this one
GameObject[] objects = GameObject.FindGameObjectsWithTag("tag");
```
</details>

<details class="details-s">
<summary>A state "<b>enabled</b>" 🤚. You can enable/disable your game object. If a game object is disabled, it won't be updated anymore.</summary>

```cs
bool isEnabled = enabled;
```

> **Pros**: they are disabling game objects that are far from the camera, and enabling game objects near the camera. Some game objects may be visible even if the camera is far, you may handle that too.
</details>

<details class="details-s">
<summary><b>Transform</b> ⚙: a <b>component</b> handling the position, rotation, and scale of a Game object.</summary>

```cs
Transform myTransform = transform; // transform.position, ...
myTransform.LookAt(target);
myTransform.Rotate(axis, angle);
myTransform.Rotate(axis, Time.deltaTime * angle, Space.World); // or Space.Self
```
</details>

> **Pro tip**: avoid changing the scale, it can cause performances issues, and this will be tiring to manage later.<br>
> **Note**: you will learn more about "**components**" in another section.<br>
> **Note**: you will learn about methods available for game objects in another section.

<hr class="sr">

## Scenes

**Scenes are screens of your games**. For instance, you may have StartMenuScene, LoadingScene, GameScene, GameOverScene, InventoryScene, etc. Of course, you are free, you may split our GameScene in more scenes <small>(ex: one per level?)</small>, or you may merge scenes <small>(ex: GameScene with InventoryScene)</small>. By default, Unity is opening a new project in the "SampleScene".

In Unity, creating a scene will not be enough to make it a part of your game. You need to

* Open the new scene
* File > Build Settings
  * Click on "add opened scenes in build" <small>(you may take note of the build index)</small>
  * Or drag and drop scenes from the project window to the list

Now, you will be able later to switch scenes using this sample of code

```cs
SceneManager.LoadScene(buildIndex);
SceneManager.LoadScene("SceneName");
```

If you got things that you don't want to lose between scenes

* you may create `static variables`. Instances are destroyed, but static variables aren't reset.
* you may create a singleton, if you don't want to instance an object twice (check [DontDestroyOnLoad](https://docs.unity3d.com/ScriptReference/Object.DontDestroyOnLoad.html), or [Unity Singleton](https://blog.mzikmund.com/2019/01/a-modern-singleton-in-unity/), or [DontDestroyOnLoad+Singleton](https://gist.github.com/mstevenson/4325117))

> **Pro tip?**: it seems that scenes are removed from the build after updating Unity. If you sorted your scenes and used indexes in your code, it may break. Make sure to keep a copy of your scenes indexes.<br>
> **Pro tip**: saving a scene do no means saving the project. You can use save to save your scene or save project to [...]. It will save settings, or things that were not saved. Closing the project will trigger that too.
> **Pro tip**: you can open multiples scenes in the hierarchy. You can use "Set active"

<hr class="sl">

## Interface

When you are opening a project, by default you got 4 windows.

* **hierarchy window** 📚 (left): list of all **GameObjects** of your scene
* **scene window** 🛠 (middle)
	* **scene tab**: edit your scene
	* **game tab**: run your scene
		* press play to run
		* press play again to stop
		* press pause to pause the simulation

When **running** your game, you can go edit things <small>(either by going back to the scene, or by clicking on a game object in the game/hierarchy)</small>, to test things. **Note that everything will be reverted once you stopped playing**. Some are changing the color of the editor in play mode <small>(Edit > Preferences > Colors > Playmode tint)</small>.

* **inspector window** ⚙ (right): you can edit the properties of the selected **GameObject**
* **project window** 🗄 (bottom): all of your project files

<hr class="sr">

## Hierarchy window

**This is the list of the game objects that are populating your scene**. The order does not really matter in 3D, but in 2D, this is important.

<details class="details-e">
<summary>Create game objects</summary>

Simply right-click in the hierarchy window, and select what you want to create.

![Hierarchy - Create game objects](_images/create.png)
</details>

<details class="details-e">
<summary>Group game objects</summary>

**You can group game objects**, which is making nested game objects rendered at a position relative to their parent. This is useful when you want to make sure that a gun is always rendered at a fixed position to a player <small>(or, mostly, when you want something to be rendered relative to something else)</small>.

To create a group, create a new game object inside another one (right-click on the parent > create). You can also drag and drop an existing object inside another game object.

![Hierarchy - groups](_images/groups.png)

> **Tip 1**: Sometimes, we are using an "Empty game object" as the parent to sort things.<br>
> **Tip 2**: If you are hiding the parent, its children are also hidden. This is useful, but if this is not what you want, you can simply prevent the parent from being rendered by disabling its rendered rather than disabling the parent itself.
</details>

> **Pro tips**
> * <kbd>Double-click</kbd> on a item in the hierarchy to focus it in the scene view
> * <kbd>F2</kbd> to rename the selected item
> * <kbd>CTRL+D</kbd> to duplicate the selected item
> * <kbd>ALT+expand or hide</kbd> to expand/hide all children of a group
> * you can use the search bar to look for a game object by name, or for game objects having a component <small>(you must write the full name of the component)</small>

Note: in complex games, you may define "selections". It means that pressing a shortcut (or toggling a menu item) will automatically select a game object. Click on a game object, then edit, then selection, and save it. Then use the shortcut, or use edit > selection > load, to load your selected game object.

<hr class="sl">

## Scene window

Select in this list of icons (or using their shortcut) a tool. You can move, rotate, and scale game objects in the scene. You will be able to do that using the **inspector window** too <small>(ex: with the move tool, two arrows will be available on the selected game object, click on one, and try moving it)</small>.

![Scene window - icons](_images/scene_icons.png)

You can also change your point of view by clicking on one axis here. Click back on the square to go back to Perspective.

![Unity Point of View Axis](_images/axis_pov.png)

> **Pro tips**
> * <kbd>F</kbd> to focus a game object
> * <kbd>Mouse Wheel</kbd> to zoom/de-zoom
> * <kbd>Left-Click/Middle-click</kbd> to move your point of view (not the camera)
> * <kbd>CTRL</kbd> when moving something, while make the position change by 0.25. It's called **snapping**, and you can change the unit in edit > Grid and Snap settings.
> 
> You can select and edit multiple game objects in one go, by pressing <kbd>SHIFT</kbd> and clicking on 2 game objects (=select every game object between these two). You can use <kbd>CTRL</kbd> and pick them one by one.

<hr class="sr">

## Inspector window

In the inspector, **you can edit the properties of the selected game object**, even if this game object isn't inside the hierarchy window <small>(ex: files in the project window)</small>.

<div class="row row-cols-md-2 mx-0"><div>

![Unity inspector](_images/inspector.png)
</div><div class="align-self-center">

1. Enable/Disable
2. Name
3. Tag
4. Transform (set the position, rotation, scale)
5. Add new components (explained later)
</div></div>

<div class="row mx-0"><div class="col-md-4">

![Unity inspector - remove component](_images/inspector_remove.png)
</div><div class="align-self-center col-md-8">

Later, you may have to remove a component. You can do it by clicking on the 3 small dots, then "remove components".

You may also use "Copy component" and "Paste component as new" or "Paste component values".

> **Pro tip**: you need to reduce the number of components as possible<br>
> **Pro tip**: as per the previous statement, in a group of game objects, try to merge some components (ex: the colliders, etc.)
</div></div>

> **Pro tip**: in the container in which you got "inspector", on the same line, you got three small dots too. You can switch from "normal" to "debug" mode here, which will show you way more fields in the inspector.<br>
> **Pro tip**: some are giving icons to game objects. This is done by clicking on the "cube" next to (1). These icons are only visible in the scene view.

<hr class="sl">

## Project window

The project window is, as a wise man said, a warehouse. This is a file explorer allowing you to explore your scenes, your assets <small>(images, textures, materials, sounds, etc.)</small> and works on them. **The project files should be split into folders**, such as

* **Animations**, **Audio**, **Cutscene**
* **Images**, **Materials**
* **Plugins**, **Prefabs**, **Scenes**
* **Scripts**: your C# scripts (.cs)
* **Settings**, **Shaders**

That's not the only thing you can do here! This is not a simple explorer.

<details class="details-e">
<summary>Create new scenes/materials/script/... 🚀</summary>

You can create a folder with <code>Right-click > Create > Folder</code>. Once you did, double-click to move inside your new folder, and you can

* Create a **new scene** with <code>Right-click > Create > Scene</code>
* Create a **new material** with <code>Right-click > Create > Material</code>
* Create a **new script** with <code>Right-click > Create > C# Script</code>
</details>

<details class="details-e">
<summary>Create Prefabs 📚✨</summary>

You may want to create a "**template**" for your Game Objects. For instance, every bullet is the same. You could duplicate the Game Object. But what if you want to change something? Will you manually edit everything? No way! You should create a **Prefab** (Prefabricated game object).

**Create a prefab**

* Simply **drag and drop** an existing game object, **from** the **hierarchy** window, **to** the **project window**, inside a folder "Prefabs"

**Instances of a prefab**

* **Drag and drop a prefab**, either **inside the scene**, or inside the **hierarchy**
* Every instance of this Prefab is now blue inside the hierarchy window

**Edit the prefab**

* Simply 
  * **double-click** on the **prefab** inside the **project window**
  * Or click on the arrow on the line of the prefab instance in the hierarchy
* It will open a prefab inside the scene window, with its hierarchy window
* **It will update the values for every instance** (aside from transform, or properties modified by the instance)

**Edit one instance**

* You can edit prefabs instances as you always did, it won't alter the prefab
* **If the prefab and the instance got different values in a field**, then
  * the **line** with a different value will have a **blue left border**
  * the different **value** will be in **bold**
* You can **revert/update the prefab** a value with a **right-click on the name of the field**
* **You can see every overridden property by clicking on "override"**, right below "layer" in the inspector.
</details>

<details class="details-e">
<summary>Console 📺</summary>

The console is a tab of the **Project window**. You can clear the console with "clear". In the console, you got different kinds of logs such as

* Normal Logs (Debug)

```cs
Debug.Log("message");
```

* Warnings

```cs
Debug.LogWarning("warning");
```

* Errors

```cs
Debug.LogError("error");
```
</details>

> **Pro tip**: please remember the word "assets". Everything that you are creating in the project explorer (scripts/materials/...) are called **assets**.

<hr class="sr">

## Components

You may refine your game object with what we call **components**. They are extensions such as collision, physics, etc. that you can add to your game objects. You can do that in the inspector (as we saw before), or by dropping a component on a game object in the hierarchy. You can write scripts that are also components to add things such as movement, etc.

> **Add a component**:
> * you can click on Add component in the inspector
> * you can drag and drop a component from the project window to a game object
>	* in the inspector
>	* in the scene <small>(not used often as you may add it on the wrong game object)</small>
>	* in the hierarchy

You can use these methods to get a component, either applied on our game object, its children, or its parent. **Note that these methods are called on a game object, here it's the attribute "gameObject" in `MonoBehaviour`**, but it's implicit.

```cs
// the component is Rigidbody
Rigidbody r = GetComponent<Rigidbody>(); // same as gameObject.GetComponent<Rigidbody>() ...
r = GetComponentInChildren<Rigidbody>();
r = GetComponentInParent<Rigidbody>();
r = FindObjectOfType<Rigidbody>();

// disable a component (ex: the renderer to "hide" something)
// assert that we got a Renderer first!
GetComponent<Renderer>().enabled = true;
```

<details class="details-e">
<summary>Rigidbody (Physics 🐱‍🏍)</summary>

First, Rigidbody is for 3D games, and you have Rigidbody2D for 2D games. A game object with a rigid body **is subject to gravity** and **colliders**. If you ever add this to a game object, **you can't use transform to move your game object**, as you need to apply forces to move it. **If you are not planning to use force, be sure to toggle " is kinematic" on your Rigidbody component**.

1. `is kinematics: true`: no forces (including gravity) applied on this game object (ex: a wall).
2. `use gravity: false`: still apply forces, but no gravity.
3. **Notes**
   * lower mass = pushed back by others
   * increasing drag = slow down the velocity (speed)
4. **Constraints**
   * you can freeze the Rotation (ex: x, y, z = no rotation)
   * you can freeze the position (ex: z in 2D)
5. **Interpolate**: turn it on for the player's character ([source](https://docs.unity3d.com/ScriptReference/Rigidbody-interpolation.html)), it makes collision smoother <small>(but a collision between two interpolated objects may produce the reverse result)</small>
6. **Settings** (Edit > Project Settings > Physics)
   * You can change the gravity
   * You got a Layer Collision Matrix, explained in Collider
7. **Some code**

**Pro tip**: updating physics must be done in the method `FixedUpdate` <small>(running at 50 FPS, even if the game is running at 20 FPS)</small> instead of `Update`. In `Update`, you will process input (calls to Input.Something), and in `FixedUpdate`, you will ONLY update the force, you won't call Input.Something (use attributes to remember what key/... were pressed).

```cs
// if up then Jump, etc.
rb.AddForce(Vector3.left); // move to the left
rb.AddForce(Vector3.left * speed);
rb.AddForce(Vector3.left * speed, ForceMode.A_MODE_HERE);
rb.MovePosition(position);
rb.AddExplosionForce(power, explosionPos, radius, 3.0F);
```
</details>

<details class="details-e">
<summary>Colliders</summary>

Colliders are used to check if our game object is colliding with another object. You will define a collider covering your game object (up to you, whether only touching the bust is considered as colliding=more efficient, etc.). Once you created your collider, **it will be triggered each time a game object having a Rigidbody is entering your collider**.

1. **Create**: by default, the collider will fit your object, more or less according to the kind of collider you picked. You can click on edit collider. If you are zooming a lot, you will see small green dots. Click on them to edit your collider in one direction. **Pro tip**: use rectangular colliders for better performances <small>(ex: not a good example but, you can make one covering the bust rather than the whole player)</small>.
2. **is trigger**
   1. if **false**, this object is solid, trigger the method `OnCollisionEnter(Collision)`.
   2. if **true**, objects are passing through each other, trigger the method `OnTriggerEnter(Collider)`.
3. **Layers**
   * by default, objects may collide even if there are not on the same layer.
   * You can change this behavior by tweaking the collision matrix at the end of Edit > Project Settings > Physics 
4. **Physical material**
    * it's an asset "create > Physic Material" in the project explorer
    * you can set every friction to 0, and set combine to "minimum" to disable friction.
    * then you can add it to a collider
5. **Some Code** (3 ways that I used)

```cs
// 1. return every collider inside this sphere
Physics.OverlapsSphere(position, radius)
// only layers in mask (ex: mask = LayerMask.GetMask("Default", "Water"))
Physics.OverlapsSphere(position, radius, mask)
// 2. you can use Vector3.Distance (or Vector2)
// 3. you can use Bounds.Intersects
GetComponent<Collider>().bounds.Intersects(anotherBounds);
GetComponent<Renderer>().bounds.Intersects(anotherBounds);
```

| | Collider | Collider (isTrigger) | Collider+Rigidbody | Collider+Rigidbody (kinematic) |
| --- | --- | --- | --- | --- |
| Collider | x | x | OnCollisionEnter | x |
| Collider (isTrigger) | x  | x | OnTriggerEnter | OnTriggerEnter |
| Collider+Rigidbody | OnCollisionEnter | OnTriggerEnter | OnCollisionEnter | OnCollisionEnter |
| Collider+Rigidbody (kinematic) | x | OnTriggerEnter | OnCollisionEnter | x |

> **Pro tip**: this may not be the best way to do it, but methods such as `OnCollisionEnter` are filled with the game object we are colliding with. You may use tags, and check the tag of the game object.
</details>

> **Pro tip**: on the same line that you use to remove a component, you got a question mark inside a circle. Click on it to open the documentation of a component.

<hr class="sl">

## Scripts

Scripts are in **C#**, an old version of C#. From [this page about the C# compiler](https://docs.unity3d.com/2020.3/Documentation/Manual/CSharpCompiler.html), Unity 2020.3 (LTS) is using **C# 8.0**. In **2021.2+**, they are using **C# 9.0**. You should also note that even if they are using versions 8.0 or 9.0, **every feature of C# is not available** (check on the page above, for "Unsupported features").

Right-click inside the **project window**, create a new Folder "Scripts" and a new script (ex: "Example.cs").

* the name of the class must be the name of the file
* the name must start with an uppercase, following the UpperCamelCase format

<details class="details-e">
<summary>Basic Empty Script</summary>

<div class="row row-cols-md-2 mx-0"><div>

```cs
using UnityEngine;

public class Example : MonoBehaviour // Example.cs
{
    // Awake is called when the script instance is being loaded
    private void Awake() { }

    // Start is called before the first frame update
    private void Start() { }

    // Update is called once per frame
    private void Update() { }
}
```
</div><div>

* **using**

The `using` keyword is importing a namespace, meaning a collection of classes, enums, ... This allows us to use `MonoBehaviour` instead of prefixing classes (`UnityEngine.MonoBehaviour`).

* **MonoBehaviour**

A MonoBehaviour is the base class for a Script. It got a lot of methods, that are called automatically (Awake, Start, Update, Event-related functions, ...) in which you can write some code.

> A script is a component, so you can add it to a game object as usual. You can also drag and drop a script on a game object in the hierarchy.

* **More**

You can write new methods, add new attributes, ... See the [C# documentation](https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/). If you are familiar with Java, it's easy to sail in C#.
</div></div>
</details>

<details class="details-e">
<summary>Game object</summary>

**You attached your script to a Game object**. We already saw in the section

* "Game objects" how to get the name, tag, ...
* "Components" how to get a component attached on the same game object (its children or its parent)

> **Pro tip**: If needed, you got the attribute `gameObject` (resp. `this.gameObject`).

There is another problem. Let's say you want to **reference another game object** in another script. There are multiple ways to do this

* use tags, and find object with tag
* use SerializedFields (see [Unity Script++](../unity-ufs/index.md#serialize-field))
* use the approach explained in the UI section, way better for UI elements
</details>

<details class="details-e">
<summary>Usual methods</summary>

<table class="table table-bordered table-striped border-dark mt-3">
<tr><th>Method</th><th>Description</th><th>Calls</th></tr>

<tr><th colspan="3" class="text-center text-my-blue">Unranked 👀</th></tr>

<tr>
<th>Instantiate</th>
<td>clone an object</td>
<td>

```cs
var _obj = Instantiate(obj);
var _obj = Instantiate(obj, pos, rot);
var _obj = Instantiate(obj, pos, Quaternion.identity);
```
</td>
</tr>

<tr>
<th>Destroy</th>
<td>destroy an object</td>
<td>

```cs
Destroy(obj);
Destroy(obj, time_before_death);
```
</td>
</tr>

<tr>
<th>Messages</th>
<td>call a method on every script on this game object.</td>
<td>

```cs
SendMessage("methodName");
// and on its ancestors
SendMessageUpwards("methodName");
```
</td>
</tr>

<tr><th colspan="3" class="text-center text-my-blueI">Position 🗺</th></tr>

<tr>
<th>Vector2<br>Vector3</th>
<td>A class used to represent a position (x,y) or (x,y,z).
Note that I'm using Vector3 a lot, but a lot of functions are in Vector2 too.</td>
<td>

```cs
// shortcuts to create vectors
Vector3.back, Vector3.down, Vector3.up, ...
someVector.normalized; // magnitude=1, just a direction
Vector3.MoveTowards(current, target, maxDistancePerStep);
Vector3.Reflex(inDirection, inNormal) // sort of mirror, bounce
if (Vector3.Distance(a, b) <= 0.0001f) {} // a near b?
```
</td>
</tr>

</table>
</details>

> **Pro tip**: [we are explaining a lot of things about scripts here](../unity-ufs/index.md).<br> 
> **Fun fact**: a long time ago, it was possible to use JavaScript too.

<hr class="sep-both">

## General knowledge

> ⚠️ A wise one would regularly save its work, and use a version-control tool too ⚠️

<hr class="sl">

## Unity Settings

Go to **Edit, Then Preferences**.

* **General > Disable editor analytics**: up to you, [more info here](https://docs.unity3d.com/Manual/EditorAnalytics.html)
* **General > Editor Theme**: Light/Dark

<hr class="sr">

## Asset Store

This is one of the places that you may use to look for assets. The [Asset Store](https://assetstore.unity.com/) needs you to log in to your unity account to import an asset in the editor. Fortunately, if Unity is open, you can do **Window > Asset store**, which will open the asset store in your browser and log you.

Once you added an asset to your list of assets, in Unity, you can find your assets in **Window > Package manager**. **Right next to the "+", you can set packages to**

* **My assets** (you can download and import your assets here)
* **Unity Registry** (verified plugins)
* **In Project** (you can update/remove your packages here)

<hr class="sl">

## Build game

It's release time 🚀? When you picked your unity version, you picked the platforms that you can target. If you didn't, you can go inside the unity hub, then "install", right-click on your unity, and add modules.

Inside Unity, before building something, let's first configure our game. Go to `Edit > Project Settings > Player`. You could also find the menu in `File > Build`, the bottom-left button "Player settings...".

* [**Should**] Set the company name, the product name, the version
* [**Could**] You may set the icon 🚀 (and multiple icons for each resolution)
* [**Could**] You can define the initial configuration
* [**Should**] In Splash image
    * you may remove the unity logo (up to you, or you can move it)
    * add a splash screen with your own logo
        * First, exit and add your logo in the project files
        * Click on your logo, in **texture type**, set **sprite 2D**, and apply your changes
        * Go back to the splash screen
        * Click on "+" and drag and drop your logo inside the field
        * You may set the duration
* [**Should**] You may set the background too

> **Pro tip**: it's sometimes advised to check `Edit > Project Settings > Quality`, because you may be able to reduce your build size quite a lot, mostly by decreasing the number of levels.

Then, you simply have to go to `File > Build` or `File > Build and Run`.