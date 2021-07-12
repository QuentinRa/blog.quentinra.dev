# TopDown Engine

This is an engine inside unity helping handling
2D stuffs in TopDown games. You can purchase it
in the unity store. Then install it
with [this](https://topdown-engine-docs.moremountains.com/install.html)
tutorial.

You can also buy [Feel](https://feel-docs.moremountains.com/index.html)
if you are feeling like this would improve your game.

<hr class="sr">

## Agent

An agent is a name for character (Player, NPC, ...). The
best way to make one is

* creating a model
* maybe an animator too
* then create an empty game object
* add a player controller, put inside the model
  and link everything
* then you may add other components like
    usual

You can drag and drop it to a folder to create a prefab,
then in level you can change the main player with this new
prefab.