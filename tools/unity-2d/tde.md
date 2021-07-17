# TopDown Engine (TDE)

This is an engine inside unity helping handling 2D stuff
in TopDown games. You can purchase it
in the unity store. Then install it
with [this](https://topdown-engine-docs.moremountains.com/install.html)
tutorial.

You can also buy [Feel](https://feel-docs.moremountains.com/index.html)
if you are feeling like this would improve your game.

<hr class="sr">

## Player (called "Agent" in TDE)

An agent is a name for a character (Player, NPC, ...). 
The best way to make one is

* creating a model
* maybe an animator too
* then create an empty game object
* add a player controller, put inside the model
  and link everything
* then you may add other components like
    usual

You can drag and drop it into a folder to create a prefab,
then in a level manager you can change the main player with this new
prefab.

<hr class="sl">

## UI

You will use most of the UI features of Unity, but
you can

* easily create a blur screen
* create a custom LoadingScreen
    * create an empty Game object (usually called LevelManager)
    * add a LevelManager component
    * you got what you want in SceneLoading

You may create a button loading another Level by adding

* a SelectionBase component
* a LevelSelector component with your next level

You may trigger your own script by

* adding your script as a new component to
  your button (or whatever)
* adding a MMTouchButton component,
  in binding, pressed first time, add a component
    * runtime only
    * drag and drop the component with your script
    * find the component / method in the dropdown menu