# Unity Physics & Collision 🧊

<hr class="sep-both">

## Rigidbody Component

<div class="row row-cols-lg-2"><div>

Unity Physics is applied on components having the [Rigidbody component](https://docs.unity3d.com/ScriptReference/Rigidbody.html). There is a version for 2D games: Rigidbody2D.

* Game Object will be subject to gravity
* Game Object will be colliding with other physical objects

⚠️ To move a character under physical constraints, we mustn't update its transform, but apply "forces" to it. Similarly, we use `FixedUpdate` instead of `Update` to update physics <small>(running at a fixed 50 FPS)</small>.

<details class="details-n">
<summary>RigidBody Update Example Script</summary>


```cs
using UnityEngine;

[RequireComponent(typeof(Rigidbody))] // or Rigidbody2D
public class RigidBodyExample : MonoBehaviour
{
    [SerializeField] private float speed = 5f;
    private Rigidbody _rb;
    private float _horizontalInput;
    private float _verticalInput;

    private void Start()
    {
        _rb = GetComponent<Rigidbody>();
    }

    private void Update()
    {
        // Save input for use in Fixed Update
        _horizontalInput = Input.GetAxis("Horizontal");
    }

    private void FixedUpdate()
    {
        // Use attributes to calculate positions/velocity/...
        // Example of methods:
        _rb.AddForce(Vector3.left); // move to the left
        _rb.AddForce(Vector3.left * speed);
        _rb.AddForce(Vector3.left * speed, ForceMode.A_MODE_HERE);
        _rb.MovePosition(position);
        _rb.AddExplosionForce(power, explosionPos, radius, 3.0F);
    }
}
```
</details>
</div><div>

A few notes:

* `is kinematics: true`: no forces, including gravity
* `use gravity: false`: still apply forces but no gravity.
* Game objects with a lower mass can be pushed back by others.
* Increase "drag" will slow down the velocity (speed)
* You can freeze an axis, such as the Rotation `z`

We [turn on Interpolate for the player character](https://docs.unity3d.com/ScriptReference/Rigidbody-interpolation.html) to make collisions smoother <small>(⚠️ two interpolated objects colliding may not be smooth at all)</small>.

📚 Use `Edit > Project Settings > Physics` to change the gravity.
</div></div>

<hr class="sep-both">

## Colliders

<div class="row row-cols-lg-2"><div>

A collider is an invisible component that will detect when a rigidbody enters a pre-defined space around the game object.

Simple colliders, e.g., with as few edges/vertices as possible, are more performant. According to what kind of games you are doing, try using the simplest collider as possible, even if there is some loss.

Click on a collider to edit it. You'll see some green dots to resize it.

#### Trigger Colliders

By toggling "is trigger," the collider will path through the other collider instead of colliding with it.

#### Layers and Colliders

By default, objects may collide even if there are not on the same layer. This is determined by the Layer Collision Matrix.

Use `Edit > Project Settings > Physics` to configure it.
</div><div>

#### Physical material

It's an asset that you may create "Create > Physic Material". You can set every friction to 0 and set combine to "minimum" to disable it.

#### Scripts

You can use these methods to find if game objects are colliding:

```cs
// 1. return every collider inside this sphere
Physics.OverlapsSphere(position, radius)
// only layers in mask (ex: mask = LayerMask.GetMask("Default", "Water"))
Physics.OverlapsSphere(position, radius, mask)
// 2. you can use Vector3.Distance (or Vector2)
// 3. you can use Bounds.Intersects
GetComponent<Collider>().bounds.Intersects(anotherBounds);
GetComponent<Renderer>().bounds.Intersects(anotherBounds);
```

Each Game Object has the methods `OnTrigger*` and `OnCollision*` that will be called according to what kind of game objects are colliding:
</div></div>

| | Collider | Collider (isTrigger) | Collider+Rigidbody | Collider+Rigidbody (kinematic) |
| --- | --- | --- | --- | --- |
| Collider | x | x | OnCollisionEnter | x |
| Collider (isTrigger) | x  | x | OnTriggerEnter | OnTriggerEnter |
| Collider+Rigidbody | OnCollisionEnter | OnTriggerEnter | OnCollisionEnter | OnCollisionEnter |
| Collider+Rigidbody (kinematic) | x | OnTriggerEnter | OnCollisionEnter | x |