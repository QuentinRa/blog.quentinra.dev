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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)

```cs
// transform.position, ...
myTransform.LookAt(target);
myTransform.Rotate(axis, angle);
myTransform.Rotate(axis, Time.deltaTime * angle, Space.World); // or Space.Self
```
</div><div>
</div></div>