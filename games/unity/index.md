# General knowledge

Unity is a **game engine** providing support for multiple platforms <small>(Windows, Linux, Mac, Web, Android, iOS)</small>. The editor is written in **C++**, but the scripts (=your code) will be in **C#**. You can [download Unity here](https://store.unity.com/#plans-individual).

* **unity hub**: software to manage unity versions and projects
* **unity**: downloaded through unity hub

> ⚠️ A wise one would regularly save its work, and use a version-control tool too ⚠️

<hr class="sl">

## Pick Unity version 🚀

Usually **you should use LTS** <small>(Long-term support)</small> **versions** of Unity, **because** they will still receive patches (bugs), while no new features will be added, for 2 years, so **they are stable versions**.

<hr class="sr">

## Student plan

You may <b>apply for a student plan 📚</b> <small>(if you are a student)</small>.

* go to [Unity Student Plan](https://unity.com/products/unity-student)
* click on High school students
* Log in/Register
* Fill the form, powered by SheerID
* Send a pic of your student ID
* Done, wait a bit, you should receive a mail telling you **welcome** and **how to get started**
* [**Claim your rewards**](https://assetstore.unity.com/browse/student-plan-pack) **for 1$** with the code sent by mail (optional)

<hr class="sl">

## Version-control in Unity

Version-control is quite easy to set up. This is a way of **keeping backups** of your work on a server, so that you don't lose everything if you lost your local version. It may also be used if you are planning to **code with a team**, but unless you are editing different files, this will be hard to use.

First, [create an **empty** repository](https://docs.github.com/en/get-started/quickstart/create-a-repo) (no README/...).

Unity projects are **made of a lot of files**, including **big files too**, so you can't commit (~=save) them. Fortunately, you can use Git LFS to transfer big files, and you got a plugin making things easy in unity.

* [GitHub for unity (tool/download)](https://unity.github.com/)
* [GitHub for unity (quick-guide)](https://github.com/github-for-unity/Unity/blob/master/docs/using/quick-guide.md) (or [this one](https://github.com/github-for-unity/Unity/blob/master/docs/using/how-to-install-and-update.md))

<details class="details-e">
<summary>My tutorial</summary>

* *you may have to install [Git](https://git-scm.com/downloads)* (👀)
* *you may have to install [GitHub LFS](https://git-lfs.github.com/)*
* [download GitHub for unity](https://unity.github.com/)
* you got a ".package"
* open your project, and drag and drop it inside the **project window** (the file explorer, the bottom left panel)
* then click on "import" on the panel that opened
* then you can show the "Git tab" using <kbd>Window > GitHub</kbd>
</details>

Once the installation is complete, you need to add+commit your files (=save). You can push your saves on the server (=push), or pull the saves on the server (=pull). Check the GIT course if needed.

<details class="details-e">
<summary>Things that may be worth remembering</summary>

* you do not need to commit `Library`, `Temp`, `Logs`, and `Packages` (that's why they are in your gitignore)
* do not call a folder `Resources` (that's for dynamic resources)
* do not commit PSD, blend, 3ds, etc. files (sources). Artists are usually using another tool (ex: Dropbox)
* reduce the resolution of your textures (relatively to their size in-game)
* compress images
</details>

> **Pro tip**: Teams should use [Unity Teams](https://unity.com/products/unity-teams).

<hr class="sr">

## Pick your IDE

By default, the IDE used by Unity when editing scripts is **VSCode**. But, you may change this by going in

* edit > preferences > external tools
* pick your IDE / Browse it

Personally, I'm using [**Rider**](https://www.jetbrains.com/rider/) ([features](https://www.jetbrains.com/rider/features/) 🚀, paid, free for students). If Rider is not detected

* Search Rider in Windows Search bar
* Right-click > Shown in explorer
* Right-click again > Shown in explorer
* Double-click on the path > copy the path
* Then in Unity, select browser, and paste the path
* Then select "rider64" and you are good to go

> **Sources**: [Rider in Unity](https://blog.jetbrains.com/dotnet/2017/08/30/getting-started-rider-unity/) (2017)<br>
> **Sources**: [Rider in Unity](https://blog.jetbrains.com/dotnet/2018/10/03/integrating-rider-2018-2-unity-editor/) (2018)

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