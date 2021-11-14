# Unity notes

This is a gathering of notes that I took for different kinds of games, such as things to keep in mind.

<hr class="sl">

## Platformers

> A platformer is a game such as Super Mario Bros, in which a player is jumping/climbing between platforms, to reach a goal.

We are considering that you are in Unity 3D, without the Z-axis.

* 📘: Add a RigidBody to the player
  * 📘: To move the player, use forces (up=jump, left/right=move)
  * 📕: Fix the rotation (X, Y, Z) => prevent unexpected rotation
    * if you can't freeze the rotation, you can create an empty game object. Using a script, update the empty game object to match the player transform. Then, simply place the camera in the empty game object.
  * 📕: Fix the position (Z) => won't fall
  * 📕: Remove frictions => otherwise, the player can stay in the air, by clamping a block
* 📘: you may nest the camera inside the player, to make the camera follow the player. You can tweak the Z-axis to move the camera near or far from the player.
* 📘: to check if the player is on the ground, you can check if the player is colliding with the ground
  * 📕: if you are using OnColliderEnter/OnTriggerEnter, beware of a bug when you are both exiting and entering a new block

<hr class="sl">

## Breakout

> This game is called `casse-briques` in French. "In Breakout, a layer of bricks lines the top third of the screen, and the goal is to destroy them all by repeatedly bouncing a ball off a paddle into them." (Wikipedia)

We are considering that you are in Unity 3D, without the Z-axis.

* 📘: Create 3 walls (left, up, right) with a collider
* 📘: Create a paddle (ex: flat cube) with a collider and a rigid body
  * 📕: freeze Z-axis
  * 📕: freeze rotation (X, Y, Z)
  * 📘: move the platform by checking the position X of the mouse
    * 🗒: you may use Camera.ScreenToWorldPoint
* 📘: Create a ball (ex: sphere) with a collider and a rigid body
  * 🗒: make the ball interpolate (smooth collision)
  * 📕: freeze Z-axis
  * 📘: make the ball bounce when colliding
    * 🗒: using Vector3.Reflect
  * 📘: destroy the ball when lost
    * 🗒: check if renderer is visible
* 🗒: Set the camera mode to orthographic
* 📘: Create a brick (ex: flat cube) with a collider
  * 📘: the brick should be destroyed after X hits
  * 🗒: change color when hit, revert back after X seconds
  * 🗒: add indestructible bricks
* 📘: Create a level using bricks
* 🗒: Game Manager
  * 🗒: handle points
  * 🗒: handle lives
  * 🗒: handle levels
  * 🗒: create the ball and the paddle
* 🗒: add menus
  * 🗒: state machine (Play, GameOver, LevelCompleted, etc.)
  * 🗒: update the UI in the setter of points/lives/levels