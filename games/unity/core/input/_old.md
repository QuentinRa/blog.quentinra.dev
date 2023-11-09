# Input

In Unity, go to **Edit > Project Settings > Input Manager**. Expand Axes. In this menu, you may check, change, add new entries for input.

* **Horizontal**: you can see **left**/**right** to move, while **A** and **D** are working
* **Vertical**: you can see **down**/**up** to move, while **S** and **W** are working
* **Jump**: you can see **space**

Increase the size to add more 🚀. Once you are good, in a script, you can do that. If a value is inside "dead", then it's 0. "negative" means the value that will be negative (-1) in GetAxis (explained later). And "sensitivity" is the response time (low=smooth, great=fast).

<div class="row row-cols-md-2 mx-0"><div>

**Discontinuous input**

```cs
// <0 (left) or 0 (none) or 0> (right)
float axisX = Input.GetAxis("Horizontal");
// <0 (down) or 0 (none) or 0> (up)
float axisY = Input.GetAxis("Vertical");

if (Input.GetButton("Jump")) // if "Jump" triggered
{
    // do action
}
```
</div><div>

**Continuous input**

```cs
if (Input.GetButtonDown("Jump"))
{
    _isJumpPressed = true; // change the state
}
if (Input.GetButtonUp("Jump"))
{
    _isJumpPressed = false; // revert the state
}
```
</div></div>

<details class="details-e">
<summary>Not using the Input Manager</summary>

**For testing purposes**, you may also directly use the key. Once you did check, be a good fellow, and use the input manager 🤓.

```cs
bool pressed = Input.GetKey(KeyCode.Space);
bool down = Input.GetKeyDown(KeyCode.Space);
bool up = Input.GetKeyUp(KeyCode.Space);
```
</details>

<details class="details-e">
<summary>Delta time</summary>

As explained in the game engine course, delta time is important. If you are planning to update the position by 10 m/s, then having variations such as 9 m/s one time, then 11 m/s another time, are not good right 😬?

```cs
// you should (MUST) store 10 in an attribute
var speed = 10 * Time.deltaTime;
```
</details>

<details class="details-e">
<summary>Raw</summary>

When you are using the method not raw, you will see that the player will still move a bit after you stop pressing a key. This is great, but if this is not what you want, you can use

```cs
float axisX = Input.GetAxisRaw("Horizontal");
```
</details>

<details class="details-e">
<summary>Mouse</summary>

* **Input Mouse**

**Note that you don't need this if you are using the input manager** (simply use the name of the input as always).

```cs
// b is 0 = Left-Click, 1 = Right-Click, 2 = Middle-Click
Input.GetMouseButton(b);
Input.GetMouseButtonDown(b);
Input.GetMouseButtonUp(b);
```

* **Mouse events**

You can react to even such as "Mouse is over this game object", ... which the following functions are available in every Game Object.

```cs
private void OnMouseUp() {}
private void OnMouseDown() {}
private void OnMouseOver() {}
private void OnMouseEnter() {}
private void OnMouseExit() {}
```
</details>

> **Pro tip**: there is a new input system, that is event-based. You should [read the documentation](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.2/manual/index.html). Available in Unity 2019.4+ in version 1.0. You may use version 1.2 which is still compatible with 2019.4+.