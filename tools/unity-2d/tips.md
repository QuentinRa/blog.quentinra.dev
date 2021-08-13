# Tips

[Go back](index.md)

## Optimization

The image size must be a power of two, so you can compress it.
You can compress sounds too (50% seems good).

Activate and deactivate objects if the camera
is close or far from them.

<hr class="sr">

## Logic

Use ``Debug.log("")`` to add logs of your game.

You can and should group variables. You can use
``[Header("name")]`` / `[Space(value)]`
before your variables declarations.

Group objects into groups using a GameObject (you may
use "create empty game object").

In RigidBodyComponent, use ``Interpolate`` in
interpolate (make it smoother, ...).

<hr class="sl">

## Graphics

Enable ``post-processing`` in rendering.