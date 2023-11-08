# Unity Scripts 🐲

<div class="row row-cols-lg-2"><div>

Unity Scripts are written in [C#](/programming-languages/high-level/oo/cs/index.md). The version of C# used changes according to the editor version. 

For reference, it's [C# 9.0 for Unity 2022.3](https://docs.unity3d.com/2022.3/Documentation/Manual/CSharpCompiler.html). Note that some features from each C# version were not implemented in Unity. Refer to the Unsupported features of the link above.

Inside the project window of the editor, you can create new scripts, for instance, `Example.cs`. We usually store them in a folder `Scripts`.

✍️ Unity Scripts are documented in the [Scripting Reference](https://docs.unity3d.com/ScriptReference/).
</div><div>

The name of the script is the same as the name of the class. Use UpperCamelCase for naming scripts/classes.

```cs
using UnityEngine;

public class Example : MonoBehaviour
{
    // Awake is called when the script instance is being loaded
    private void Awake() { }

    // Start is called before the first frame update
    private void Start() { }

    // Update is called once per frame
    private void Update() { }
}
```
</div></div>

<hr class="sep-both">

## Game Objects and MonoBehavior

<div class="row row-cols-lg-2"><div>

Most unity scripts are inheriting the class [MonoBehaviour](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html) as it is the base class for components that can be attached to GameObjects.

#### Associated Game Object

The associated game object is available in the `gameObject` attribute. You can edit any value as you would in the editor.

```cs
// Name of the game object (attribute 'name')
// Tag of the game object (attribute 'tag')
// State of the game object (attribute 'enabled')
// Access the TransformComponent (attribute 'transform')
string previousName = name;  // store in a variable
name = "Hello, World";       // change the name
```

➡️ You can use `this.attribute` or `gameObject.attribute` too.
</div><div>

#### Accessing Other Game Objects

You can find game objects that have a tag `tagName`:

```cs
GameObject obj = GameObject.FindWithTag("tagName"); // null if not found
GameObject obj = GameObject.FindGameObjectWithTag("tagNametagName"); // same
GameObject[] objects = GameObject.FindGameObjectsWithTag("tagName");
```
</div></div>

<hr class="sep-both">

## Basic Methods

<div class="row row-cols-lg-2"><div>

#### Game Object Methods

Clone a game object, e.g., create a new one.

```cs
var _obj = Instantiate(obj);
var _obj = Instantiate(obj, pos, rot);
var _obj = Instantiate(obj, pos, Quaternion.identity);
```

Destroy a game object.

```cs
Destroy(obj);
Destroy(obj, time_before_death);
```

Call a method on every MonoBehavior of our game object.

```cs
SendMessage("methodName");
SendMessageUpwards("methodName"); // and on its ancestors
```
</div><div>

#### Position-Related Methods

A class used to represent a position (x,y) or (x,y,z).

```cs
// shortcuts to create vectors
Vector3.back, Vector3.down, Vector3.up, ...
someVector.normalized; // magnitude=1, just a direction
Vector3.MoveTowards(current, target, maxDistancePerStep);
Vector3.Reflex(inDirection, inNormal) // sort of mirror, bounce
if (Vector3.Distance(a, b) <= 0.0001f) {} // a near b?
```

We can use these functions with transforms:

```cs
// transform.position, ...
transform.LookAt(target);
transform.Rotate(axis, angle);
transform.Rotate(axis, Time.deltaTime * angle, Space.World); // or Space.Self
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>