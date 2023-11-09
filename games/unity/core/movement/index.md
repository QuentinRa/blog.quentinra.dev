# Unity Movement 🛣️

<div class="row row-cols-lg-2"><div>

Some old code to move a game object:

```cs
_movement = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
_movement = Vector3.ClampMagnitude(_movement, speed) * Time.deltaTime;
_movement = transform.TransformDirection(_movement);
_rb.Move(_movement);
```

```cs
_movement = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
_movement = transform.position + _movement * speed * Time.deltaTime;
transform.position = newPosition;
```

⚠️ Todo: using input to move a character is not a good practice?
</div><div>

Other handy methods from the transform component:

```cs
// transform.position, ...
transform.LookAt(target);
transform.Rotate(axis, angle);
transform.Rotate(axis, Time.deltaTime * angle, Space.World); // or Space.Self
transform.GetSiblingIndex(...); // (hierarchy)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```cs
 var move = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
 _characterController.Move(move * Time.deltaTime * speed);
```
</div><div>
</div></div>