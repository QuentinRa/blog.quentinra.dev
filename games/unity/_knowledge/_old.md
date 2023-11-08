# General knowledge

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