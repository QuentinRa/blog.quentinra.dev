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

<div class="row row-cols-lg-2"><div>

📚 Use `Edit > Project Settings > Physics` to change the gravity or edit the Layer Collision Matrix.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>