# Unity Input System 🕹️

<div class="row row-cols-lg-2"><div>

There are 3 ways of handling user input in Unity Games:

* Manually
* Using the [new input system](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.8/manual/index.html)
* Using the old input system

⚠️ Todo: using input to move a character is not a good practice?
</div><div>

#### Delta Time

As per what is explained of the [Game Loop](/games/_knowledge/game-engines/index.md#frames-per-second-fps), the time between updates is inconsistent. To ensure something move at `10 m/s`, we use `Time.deltaTime` in the update method:

```cs
// defaultSpeed is an attribute with the value "10"
var speed = defaultSpeed * Time.deltaTime; 
```
</div></div>

<hr class="sep-both">

## Old Input System

<div class="row row-cols-lg-2"><div>

#### Input System Configuration

Navigate to **Edit > Project Settings > Input Manager**. Expand Axes.

You will define each "control" of the game. For instance, you can define that "Jump" is done by pressing the left-click of the mouse. From the code, only the control name is referenced, so the key can be changed relatively easily over time.

* **Horizontal**: you can see that there is `left`/`right` to move, while `A` and `D` are marked as alternative keys.
* **Vertical**: you can see that there is `down`/`up` to move, while `S` and `W` are marked as alternative keys.
* **Jump**: the default key is `space`

To add more keys, increase the size of the array.

➡️ The "dead" properties is a range where if a value is within that range, then it's considered as "null"/0.

➡️ The "negative" means the value will be negative in "GetAxis".

➡️ The "sensitivity" is the response time (low=smooth, great=fast)

#### Raw Input

When using non-raw input, for instance, when moving a character, the character will still move a bit after the key was released. If this behavior is not acceptable, we can use:

```cs
float axisX = Input.GetAxisRaw("Horizontal");
```
</div><div>

#### Discontinuous Input

User presses a key and releases it.

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

<br>

#### Continuous Input

User hold a key.

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

<hr class="sep-both">

## Manual Input Handling

<div class="row row-cols-lg-2"><div>

For testing purposes, as it's a bad practice. Use an input system.

#### Keyboard Input

```cs
bool pressed = Input.GetKey(KeyCode.Space);
bool down = Input.GetKeyDown(KeyCode.Space);
bool up = Input.GetKeyUp(KeyCode.Space);
```
</div><div>

#### Mouse Input

```cs
// b is 0 = Left-Click, 1 = Right-Click, 2 = Middle-Click
Input.GetMouseButton(b);
Input.GetMouseButtonDown(b);
Input.GetMouseButtonUp(b);
```
</div></div>

<hr class="sep-both">

## Random

<div class="row row-cols-lg-2"><div>

#### Mouse Events

Each game object has these methods that you can override:

```cs
private void OnMouseUp() {}
private void OnMouseDown() {}
private void OnMouseOver() {}
private void OnMouseEnter() {}
private void OnMouseExit() {}
```
</div><div>

#### Drag Events

You may use the following interfaces:

```cs
using UnityEngine.EventSystems;

public class XXX : 
    IDragHandler, IBeginHandler, IEndDragHandler,
    IPointerEnterHandler IPointerExitHandler {}
```
</div></div>