# Introduction

**I'm still learning Unity**, so this is only made by a beginner for beginners. Unity is a **game engine** that you can [download here](https://store.unity.com/#plans-individual).

* **unity hub**: software to manage unity versions and projects
* **unity**: downloaded through unity hub, **usually peoples are using LTS** <small>(Long-term support)</small> **versions** of unity because they will still receive patches (fix bugs, no new features) for 2 years, **so they are stable versions**.

<details class="details-e">
<summary>You may use the student plan (if you are a student)</summary>

* go to [Unity Student Plan](https://unity.com/products/unity-student)
* click on High school students
* Log in/Register
* Fill the form, powered by SheerID
* Send a pic of your student ID
* Done, wait a bit, you should receive a mail telling you **welcome** and **how to get started**
</details>

<hr class="sl">

## What's a Game engine?

<div class="row">
<div class="col-md-4">

![Game engine](images/architecture.png)
</div>
<div class="col-md-6">

I found this picture a while back on [envato-tuts+](https://gamedevelopment.tutsplus.com/). This is quite easy to understand that a **game engine** will deal for you about a lot of things related to the tech/hardware <small>(sound, io, graphics)</small> and let you focus on your game <small>(quests, inventory, levels, ...)</small>.

Unity is focused on providing support for multiples platforms <small>(Windows, Linux, Mac, Web, Android, iOS)</small>, so it's quite convenient.

The editor is written in **C++**, but the scripts (=your code) will be in **C#**.

Unity is providing generic support for your games, sometimes you may want more. You can add **plugins** for that. For instance, the [TopDownEngine](https://assetstore.unity.com/packages/templates/systems/topdown-engine-89636) (a **paid** asset) is providing a lot of help to create 2D/3D TopDownGames <small>(check "templates" on the unity store to see what you could expect from game templates, as you may save a lot of time with them)</small>.
</div>
</div>

In **Unity** everything, I mean everything (entities, light, images, etc.) is a **Game object**. I think that this is their own way of implementing  **architectural pattern** called **Entity-component-system** (ECS), but I'm unsure of it.

<hr class="sl">

## Version-control in Unity

If you are **unfamiliar** with Github/Git, you may read the [GIT course](../git/index.md). Unfortunately, for a non-programmer, this may be complex, my advice is to [create a repository](https://docs.github.com/en/get-started/quickstart/create-a-repo) (ex: on GitHub) and skip everything else.

Unity projects are **made of a lot of files**, including **big files too**, so you can't commit (~=save) them. Fortunately, you to use Git LFS to transfer big files, and you got a plugin making things easy in unity.

* [GitHub for unity (tool/download)](https://unity.github.com/)
* [GitHub for unity (quick-guide)](https://github.com/github-for-unity/Unity/blob/master/docs/using/quick-guide.md)

<details class="details-e">
<summary>My tutorial</summary>

* download GitHub for unity (1st link)
* you got a ".package"
* open your project, and drag and drop it inside the **project window** (the file explorer, the bottom left panel)
* then click on "import" on the panel that opened
* then you can show the "Git tab" using <kbd>Window > GitHub</kbd>
* *you may have to install [GitHub LFS](https://git-lfs.github.com/)*
* *you may have to install [Git](https://git-scm.com/downloads)* (👀)
</details>

<hr class="sr">

## Interface

When you are opening a project, by default you got 4 windows.

* **hierarchy window** (left): list of all **GameObjects**
* **scene window** (middle): a scene is like a screen of your game (by default you are in the sample scene)
    * **Press run, to run your game**, you can make changes while the game is running, but they will be lost when the game is closed
    * you can click on the "game tab" to see your game running <small>(you can set the resolution here too)</small>
    * and go back to the "scene tab" to edit it (**don't forget to stop it**)
* **inspector window** (right): you can edit the properties of the selected **GameObject**
* **project window** (bottom): all of your project files

> Some shortcuts
> 
> * <kbd>F</kbd> in the hierarchy window, to focus a GameObject in the scene window

<hr class="sl">

## Be good, use folders!

The project files are usually split into folders, using these folders names

* **Animations**, **Audio**, **Cutscene**
* **Editor**, **Images**, **Materials**
* **Plugins**
* **Prefabs**: your prefabs, they are preconfigured objects like a player with a configuration. You can create one by dragging and dropping a GameObject in the project window
* **Scenes**: your scenes (unity scene files, a screen of your game)
* **Scripts**: your C# scripts (.cs)
* **Settings**, **Shaders**