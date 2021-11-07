# Unity notes

This is a gathering of notes that I took for different kinds of games, such as things to keep in mind.

<hr class="sl">

## Platformers

> A platformer is a game such as Super Mario Bros, which a player jumping/climbing between platforms, to reach a goal.

* 📘: You may do it in 3D, without the Z-axis
* 📘: Add a RigidBody to the player
  * 📘: To move the player, use forces (up=jump, left/right=move)
  * 📕: Fix the rotation (X, Y, Z) => prevent unexpected rotation
  * 📕: Fix the position (Z) => won't fall
  * 📕: Remove frictions => otherwise, the player can stay in the air, by clamping a block
* 📘: you may nest the camera inside the player, to make the camera follow the player. You can tweak the Z-axis to move the camera near or far from the player.
* 📘: to check if the player is on the ground, you can check if the player is colliding with the ground
  * 📕: if you are using OnColliderEnter/OnTriggerEnter, beware of a bug when you are both exiting and entering a new block