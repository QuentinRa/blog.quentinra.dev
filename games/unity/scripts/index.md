# Unity Scripts 🐲

<div class="row row-cols-lg-2"><div>

Unity Scripts are written in [C#](/programming-languages/high-level/oo/cs/index.md). The version of C# used changes according to the editor version. 

For reference, it's [C# 9.0 for Unity 2022.3](https://docs.unity3d.com/2022.3/Documentation/Manual/CSharpCompiler.html). Note that some features from each C# version were not implemented in Unity. Refer to the Unsupported features of the link above.

Inside the project window of the editor, you can create new scripts <small>(ex: "Example.cs")</small>. We usually store them in a `Scripts` folder.

⚠️ Use UpperCamelCase for naming scripts/classes.

✍️ Unity Scripts are documented in the [Scripting Reference](https://docs.unity3d.com/ScriptReference/).
</div><div>

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

⚠️ The name of the script is the same as the name of the class.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
* `UnityEngine.MonoBehaviour`
</div><div>
</div></div>