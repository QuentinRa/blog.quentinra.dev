# Lifecycle and game loop

Usually, in any game, you got the following lifecycle (`structure/cycle de vie`). First, the game is **initialized**, then the core of the game is run, called **game loop**

* **input**: check what button/keys were pressed
* **update**: update the game, according to the state and the input
* **render**: redraw the screen

And when the user closes the game, we are **disposing** of everything.

> In a lot of libraries and even inside game engines, you can find references to this with methods called `render` or `update`.

 <hr class="sl">

## Input and FPS

The value called **Frames Per Second** (FPS, `images par second`) is **the number of times in one second the game loop is looping**. Unfortunately, the graphic card may not call the game loop with a constant time <small>(ig: not every 1ms)</small>. This may be because the update was slower, the render was slower, or they were too fast 😎. The side effect is that you may see something teleport, or not moving smoothly. To prevent that from happening, you need to use the **delta time** (=time since when the last call) every time you are moving (or rotating/...) something.

> **TL;DR**: check for something called the "delta time" when you are updating the values of something, to make sure that you are moving something at a **constant** speed, etc.

<hr class="sl">

## Sources

* [Game Development](https://gamedevelopment.tutsplus.com/) for everything related to the Game engine infrastructure and the Game Loop
* Tutorials about the libGDX and the lwjgl3 libraries, such as [LWJGL3 - Timing](https://github.com/SilverTiger/lwjgl3-tutorial/wiki/Timing) to understand the underlay of a Game
* Teachings at the [ENSIIE](https://www.ensiie.fr/)