# Unity Editor

As there is a lot of content about Unity, this course will only provide knowledge about the **editor itself** such as the **interface**, the **project structure**, **along with everything that is not 2D/3D-specific** such as handling **scenes**, **input**, etc.

> The previous course was about **general knowledge** related to [Unity](../unity/index.md)<br>
> You can dig more into **2D** with [Unity 2D](../unity-2d/index.md)<br>
> You can dig more into **3D** with [Unity 3D](../unity-3d/index.md)

<hr class="sl">

## Game object

Everything in Unity is a **game object**. **Players**, **enemies**, **items**, **camera**, **sounds**, **UI elements**, **lights**, and so on, are **game objects**. it means that they got the following properties

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
<summary>A state "<b>enabled</b>" 🤚. You can enabled/disable your game object. If a game object is disabled, it won't be updated anymore.</summary>

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

Now, you will be able later to switch scenes using this sample of code

```cs
SceneManager.LoadScene(buildIndex);
SceneManager.LoadScene("SceneName");
```

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

When **running** your game, you can go edit things <small>(either by going back to scene, or by clicking on a game object in the game/hierarchy)</small>, to test things. **Note that everything will be reverted back once you stopped playing**.

* **inspector window** ⚙ (right): you can edit the properties of the selected **GameObject**
* **project window** 🗄 (bottom): all of your project files

<hr class="sr">

## Hierarchy window

**This is the list of the game objects that are populating your scene**. The order do not really matter in 3D, but in 2D, this is important.

<details class="details-e">
<summary>Create game objects</summary>

Simply right-click in the hierarchy window, and select what you want to create.

![Hierarchy - Create game objects](images/create.png)
</details>

<details class="details-e">
<summary>Group game objects</summary>

**You can group game objects**, which is making nested game object rendered at a position relative to their parent. This is useful when you want to make sure that a gun is always rendered at a fixed position to a player <small>(or generally, when you want something to be rendered relatively to something else)</small>.

To create a group, create a new game object inside another one (right-click on the parent > create). You can also drag and drop an existing object inside another game object.

![Hierarchy - groups](images/groups.png)

> **Tip 1**: Sometimes, we are using an "Empty game object" as the parent to sort things.<br>
> **Tip 2**: If you are hiding the parent, its children are also hidden. This is useful, but if this is not what you want, you can simply prevent the parent from being rendered by disabling its rendered rather than disabling the parent itself.
</details>

> **Pro tips**
> * <kbd>Double-click</kbd> on a item in the hierarchy to focus it in the scene view
> * <kbd>F2</kbd> to rename the selected item
> * <kbd>CTRL+D</kbd> to duplicate the selected item
> * <kbd>ALT+expand or hide</kbd> to expand/hide all children of a group

<hr class="sl">

## Scene window

Select in this list of icons (or using their shortcut) a tool. You can move, rotate, and scale game objects in the scene. You will be able to do that using the **inspector window** too <small>(ex: with the move tool, two arrows will be available on the selected game object, click on one, and try moving it)</small>.

![Scene window - icons](images/scene_icons.png)

> **Pro tips**
> * <kbd>F</kbd> to focus a game object
> * <kbd>Mouse Wheel</kbd> to zoom/de-zoom
> * <kbd>Left-Click/Middle-click</kbd> to move your point of view (not the camera)
> * <kbd>CTRL</kbd> when moving something, while make the position change by 0.25.

<hr class="sl">

## Inspector window

In the inspector, **you can edit the properties of the selected game object**, even if this game object isn't inside the hierarchy window <small>(ex: files in the project window)</small>.

<div class="row row-cols-md-2 mx-0"><div>

![Unity inspector](images/inspector.png)
</div><div class="align-self-center">

1. Enable/Disable
2. Name
3. Tag
4. Transform (set the position, rotation, scale)
5. Add new components (explained later)
</div></div>

<div class="row mx-0"><div class="col-md-4">

![Unity inspector - remove component](images/inspector_remove.png)
</div><div class="align-self-center col-md-8">

Later, you may have to remove a component. You can do it by clicking on the 3 smalls dots, then "remove components".

You may also use "Copy component" and "Paste component as new" or "Paste component values".

> **Pro tip**: you need to reduce the number of components as you as possible<br>
> **Pro tip**: as per the previous statement, in a group of game objects, try to merge some components (ex: the colliders, etc.)
</div></div>

> **Pro tip**: in the container in which you got "inspector", on the same line, you got three small dots too. You can switch from "normal" to "debug" mode here, which will show you way more fields in the inspector.