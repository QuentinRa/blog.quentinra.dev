# Save/Load

You may save the preferences of the player using [PlayerPrefs](https://docs.unity3d.com/ScriptReference/PlayerPrefs.html), which are working like Preferences in Java.

<hr class="sl">

## Particles

You can make an object emit particles by adding to it the "particle system" component. By default, they are purple, but that's because there is no material

* **Renderer > Material**: material for the particles (see Unity3D course)
* **Emission**
    * you can set the number of particles per second
    * you can add bursts of particles
* **Shape**: you can change the shape of the effect
* **Trails**: you can give a trail to your particles
* **Color over lifetime**: you can make your particles change color over time

<hr class="sr">

## Audio

You can make a game object emit sound by adding an Audio Source component to it. You may only hear it in **Game mode** (by pressing play).