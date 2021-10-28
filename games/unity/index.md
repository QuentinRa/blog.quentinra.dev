# General knowledge

Unity is a **game engine** providing support for multiples platforms <small>(Windows, Linux, Mac, Web, Android, iOS)</small>. The editor is written in **C++**, but the scripts (=your code) will be in **C#**. You can [download Unity here](https://store.unity.com/#plans-individual).

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

Version-control is quite easy to setup. This is a way of **keeping backups** of your work on a server, so that you don't loose everything if you lost your local version. It may also be used if you are planning to **code with a team**, but unless you are editing different files, this will be hard to use.

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

<hr class="sl">

## Unity Settings

Go to **Edit Then Preferences**.

* **General > Disable editor analytics**: up to you, [more info here](https://docs.unity3d.com/Manual/EditorAnalytics.html)
* **General > Editor Theme**: Light/Dark