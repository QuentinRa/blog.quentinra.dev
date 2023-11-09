# Scenes

Now, you will be able later to switch scenes using this sample of code

```cs
SceneManager.LoadScene(buildIndex);
SceneManager.LoadScene("SceneName");
```

If you got things that you don't want to lose between scenes

* you may create `static variables`. Instances are destroyed, but static variables aren't reset.
* you may create a singleton, if you don't want to instance an object twice (check [DontDestroyOnLoad](https://docs.unity3d.com/ScriptReference/Object.DontDestroyOnLoad.html), or [Unity Singleton](https://blog.mzikmund.com/2019/01/a-modern-singleton-in-unity/), or [DontDestroyOnLoad+Singleton](https://gist.github.com/mstevenson/4325117))

> **Pro tip**: you can open multiples scenes in the hierarchy. You can use "Set active"

<hr class="sl">

## Components

You may refine your game object with what we call **components**. They are extensions such as collision, physics, etc. that you can add to your game objects. You can do that in the inspector (as we saw before), or by dropping a component on a game object in the hierarchy. You can write scripts that are also components to add things such as movement, etc.

You can use these methods to get a component, either applied on our game object, its children, or its parent. **Note that these methods are called on a game object, here it's the attribute "gameObject" in `MonoBehaviour`**, but it's implicit.

```cs
// the component is Rigidbody
Rigidbody r = GetComponent<Rigidbody>(); // same as gameObject.GetComponent<Rigidbody>() ...
r = GetComponentInChildren<Rigidbody>();
r = GetComponentInParent<Rigidbody>();
r = FindObjectOfType<Rigidbody>();

// disable a component (ex: the renderer to "hide" something)
// assert that we got a Renderer first!
GetComponent<Renderer>().enabled = true;
```

> **Pro tip**: on the same line that you use to remove a component, you got a question mark inside a circle. Click on it to open the documentation of a component.

<hr class="sep-both">

## Asset Store

This is one of the places that you may use to look for assets. The [Asset Store](https://assetstore.unity.com/) needs you to log in to your unity account to import an asset in the editor. Fortunately, if Unity is open, you can do **Window > Asset store**, which will open the asset store in your browser and log you.

Once you added an asset to your list of assets, in Unity, you can find your assets in **Window > Package manager**. **Right next to the "+", you can set packages to**

* **My assets** (you can download and import your assets here)
* **Unity Registry** (verified plugins)
* **In Project** (you can update/remove your packages here)