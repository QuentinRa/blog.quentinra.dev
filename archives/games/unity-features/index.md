# Unity features

This course is a follow-up of the Unity Editor course. I'm listing here unity feature that I use in both 2D in 3D. You may as well check features that I only use in 2D in Unity 2D (resp. 3D).

<hr class="sr">

## Input

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

<hr class="sl">

## User Interface (UI)

In Unity, UI stuff is in a game object called "**canvas**". Simply create one (UI > canvas), then you can add buttons (UI > buttons), texts (UI > text), etc. as a child of your canvas. Note that creating a UI element outside a canvas will automatically generate a new canvas.

> **Pro tip**: **go back to 2D** to create your user interface. If you were in 3D, simply toggle "2D" in the Scene windows ![Unity UI toggle 2D](images/toggle2D.png).

<details class="details-e">
<summary>Positioning components</summary>

It's not the best to manually place something in your canvas. What if a user got a window smaller or larger? **We are usually using anchors (`ancrage`) to position components**.

Click on a UI element, and check the "Rect Transform". Then click on this (**Anchor presets**) ![Unity UI Anchor presets](images/anchor_presets.png).

By pressing **ALT** and clicking on elements of the grid, you can position your component somewhere in the canvas, and you can stretch it too (increase width, height, both).

Here is an example of positioning an image near the top.

![Example Unity UI Anchor presets](images/anchor_presets.gif)
</details>

<details class="details-e">
<summary>How to ...?</summary>

* **Responsive canvas**

If you are **not using anchors**, you can click on your canvas, and in the component "canvas scaler", set **mode to "scale with the screen size"** while defining a size. I think it's better to use anchors.

* **Handle backgrounds**

You can create an Image, or an empty component, or do this on any component having the component "Image". You may drop a **sprite** (see 2D-sprites) in "Source Image" to create a **background image**, and/or you may **change the color**/**add a material**.

* **Override width/height/...**

If you want to override the minimum/preferred/... width, height, then you can do that by adding a **Layout element component** to the game object you want to override. You can use this when you got components inside another, and you want one to act a bit differently.

* **Auto-resize components**

If you got a component with some text, you may want your component to auto-resize itself, when the text is shorter or longer, smaller or bigger. You can do that by adding a component called "Content Size Fitter" and setting either (or both) fields to "Preferred size".

> **Pro tip**: you may have to add a layout, for instance, a horizontal layout, which is allowing you to use padding too.
</details>

<details class="details-e">
<summary>Layout managers</summary>

**Layout managers** (`gestionnaires de mise en page`) are components allowing you to design easily your interface. You need **to create an empty game object** (empty is not mandatory) and give it to the layout manager. Once you did, **children of the** empty **game object will be displayed according to the manager you picked**.

If you are familiar with Swing in Java, then this is quite similar.

* **Horizontal Layout**

Components are on the same line, with a gap (that is 0 by default).

* **Vertical Layout**

One component per line, with a gap between lines (that is 0 by default).

* **Grid Layout**

A horizontal layout by default. You can make columns and rows by selecting another value for the field "constraint".
</details>

<details class="details-e">
<summary>Handling multiple menus / another way of referencing something</summary>

You could create multiple canvas, and turn them on/off. I heard that Unity is advising against this, but I couldn't find proof that this is not a good practice. Anyway, another way to

* create a canvas, and put everything inside
* Add a component "XXXManager" (your script) on the canvas
* Add a component "XXXElement" (your script) on each menu (you may use "Empty Game objects", and put your stuff inside)

Then, in the manager, you are using `GetComponentsInChildren<XXXElement>`. As each component got a field "gameObject" for the associated game object, you got your menus too from their components. You may add a method in **XXXElement** returning the kind of menu (use an enum) to do specific stuff according to the kind of menu.
</details>

<details class="details-e">
<summary>UI Events</summary>

You can add a listener <small>(a method that will be called when an event is triggered)</small>

* in the code

```cs
GetComponent<Button>().onClick.AddListener(() => {});
GetComponent<Button>().onClick.AddListener(MyMethod);
```

* in the editor

You need to add an entry inside "On Click" (ex: Button > On Click). Select "Runtime Only" and drag and drop a component having the script in which you got the method you want to call. Then select the method in "No Function".
</details>

> **Pro tip**: As you can watch is [this video, there is a new way to create interfaces, called UI Builder](https://www.youtube.com/watch?v=NQYHIH0BJbs&ab_channel=CocoCode). It's not available yet.

<hr class="sr">

## Camera/Cursor

<div class="row row-cols-md-2 mx-0"><div>

* **Remove background**

You can replace the Skybox with a black background or something else, by clicking on the camera, and editing "clear flags" and background. On top of that, you can also turn off the skybox in the editor with this button.

![Unity Toggle Skybox](images/toggle_skybox.png)

* **Preview camera**

Simply click on the camera, you will see a little preview.

* **Set camera view**

If you like what you are seeing, you can right-click on your camera and click on "Align with view". The "view" is your view of the scene in the editor.
</div><div class="align-self-center">

```cs
Camera.current // may be null
Camera.allCameras
Camera.main // may be null

Camera.main.ViewportToScreenPoint() // ex: mouse position to world position
Camera.main.ScreenToViewportPoint() // ex: world position to mouse position
```

```cs
Cursor.visible = true;
Cursor.visible = false;
Cursor.SetCursor(cursorTexture, hotSpot, cursorMode);
```
</div></div>

<hr class="sl">

## Coroutines

**Coroutines** are functions with multiple returns. Each time the function is called, the code will be executed until the next return. **This is quite used when you need to do a job after X seconds, or when a condition is true, etc.**.

<div class="row row-cols-md-2 mx-0"><div>

If you only need to call a method in x seconds, and there is no optional parameter delay (ex: we got one for Destroy...), you may use `Invoke(methodName, delay);`.

Inside such function, you can call

* `yield return null`: tell unity to wait one frame and call again the coroutine
* `yield return ...`
	* `new WaitForSeconds(1f);`: wait for 1 second
	* `new WaitUntil(() => false);`: wait until the function returns true
	* `new WaitWhile(() => true);`: wait until the function returns false
	* `new WaitForSecondsRealtime(1f)`: wait for 1 real second (unscaled time)
	* You can create new ones by extending `CustomYieldInstruction`
	* ...
* `yield break` (or no other return): coroutine done
</div><div class="align-self-center">

**Declare a function**

```cs
private IEnumerator MyCoroutine()
{
	// when started, wait for one second then print "some code"
	yield return new WaitForSeconds(1f);
	Debug.Log("Some code");
}
```

**Start/Stop your coroutine**

```cs
StartCoroutine(MyCoroutine());
StartCoroutine(nameof(MyCoroutine)); // or StartCoroutine("MyCoroutine");

var c = MyCoroutine();
StartCoroutine(c);
StopCoroutine(c);
StopAllCoroutines();
```
</div></div>

<hr class="sr">

## Save/Load

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