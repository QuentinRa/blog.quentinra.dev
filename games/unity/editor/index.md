# Unity Editor 🕹️

<div class="row row-cols-lg-2"><div>

The Unity Editor is where we will build and assemble our games. Unity Editor versions are managed by [Unity Hub](https://unity.com/unity-hub) which can download [here](https://unity.com/pricing#plans-student-and-hobbyist).

It's recommended to pick a LTS version of the Unity Editor, as they are stable versions. They will still receive patches for 2 years.

✍️ Heavily refer to the [Official Documentation](https://docs.unity3d.com/Manual/index.html).

🚀 There are multiple ways to achieve the same goal. Some may use buttons, some may use shortcuts, others may use the toolbar.
</div><div>

This content is further developed in other pages:

* [XXX]() (*some short description*)
* [XXX]() (*some short description*)
* [XXX]() (*some short description*)
* [XXX]() (*some short description*)
* [XXX]() (*some short description*)
* [XXX]() (*some short description*)
</div></div>

<hr class="sep-both">

## Component-based architecture

<div class="row row-cols-lg-2"><div>

#### Game Object

Every entity in the game world is a game object:

* Characters and Items
* Lights and Cameras
* Sounds and Musics
* UI Elements
* ...

A game object can contain other game objects.

📚 Prefabs are preconfigured GameObjects that we can create and reuse throughout our project.
</div><div>

#### Components

Unity uses a component-based architecture, where you attach various components to GameObjects to give them specific functionality.

Every game object has a TransformComponent handling the position, rotation, and scale of a Game object.

We can create our components using [Scripts](/games/unity/scripts/index.md).

#### Scenes

Scenes are individual levels or sections of your game. We often have one scene per screen.
</div></div>

<hr class="sep-both">

## Unity Editor Interface

<div class="row row-cols-lg-2"><div class="mt-3">

![Editor Interface](_images/editor_interface.png)
</div><div>

The editor is divided into four windows:

1. **hierarchy window** 📚: list of all game objects in the scene
2. **scene window** 🛠: show the scene tab by default.
    * **scene tab**: edit your scene 
    * **game tab**: run your scene
3. **inspector window** ⚙: edit the properties of the selected object
4. **project window** 🗄: all of your project files

➡️ When running the game, the scene tab will still be available, but any changes to it will be discarded when the simulation stops.

✍️ Some are using a color tint <small>(Edit > Preferences > Colors > Playmode tint)</small> to visually see when their changes will be discarded.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>