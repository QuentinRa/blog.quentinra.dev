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

## Create Prefabs 📚✨

You may want to create a "**template**" for your Game Objects. For instance, every bullet is the same. You could duplicate the Game Object. But what if you want to change something? Will you manually edit everything? No way! You should create a **Prefab** (Prefabricated game object).

**Create a prefab**

* Simply **drag and drop** an existing game object, **from** the **hierarchy** window, **to** the **project window**, inside a folder "Prefabs"

**Instances of a prefab**

* **Drag and drop a prefab**, either **inside the scene**, or inside the **hierarchy**
* Every instance of this Prefab is now blue inside the hierarchy window

**Edit the prefab**

* Simply 
  * **double-click** on the **prefab** inside the **project window**
  * Or click on the arrow on the line of the prefab instance in the hierarchy
* It will open a prefab inside the scene window, with its hierarchy window
* **It will update the values for every instance** (aside from transform, or properties modified by the instance)

**Edit one instance**

* You can edit prefabs instances as you always did, it won't alter the prefab
* **If the prefab and the instance got different values in a field**, then
  * the **line** with a different value will have a **blue left border**
  * the different **value** will be in **bold**
* You can **revert/update the prefab** a value with a **right-click on the name of the field**
* **You can see every overridden property by clicking on "override"**, right below "layer" in the inspector.

<hr class="sr">

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

<details class="details-e">
<summary>Rigidbody (Physics 🐱‍🏍)</summary>

First, Rigidbody is for 3D games, and you have Rigidbody2D for 2D games. A game object with a rigid body **is subject to gravity** and **colliders**. If you ever add this to a game object, **you can't use transform to move your game object**, as you need to apply forces to move it. **If you are not planning to use force, be sure to toggle " is kinematic" on your Rigidbody component**.

1. `is kinematics: true`: no forces (including gravity) applied on this game object (ex: a wall).
2. `use gravity: false`: still apply forces, but no gravity.
3. **Notes**
   * lower mass = pushed back by others
   * increasing drag = slow down the velocity (speed)
4. **Constraints**
   * you can freeze the Rotation (ex: x, y, z = no rotation)
   * you can freeze the position (ex: z in 2D)
5. **Interpolate**: turn it on for the player's character ([source](https://docs.unity3d.com/ScriptReference/Rigidbody-interpolation.html)), it makes collision smoother <small>(but a collision between two interpolated objects may produce the reverse result)</small>
6. **Settings** (Edit > Project Settings > Physics)
   * You can change the gravity
   * You got a Layer Collision Matrix, explained in Collider
7. **Some code**

**Pro tip**: updating physics must be done in the method `FixedUpdate` <small>(running at 50 FPS, even if the game is running at 20 FPS)</small> instead of `Update`. In `Update`, you will process input (calls to Input.Something), and in `FixedUpdate`, you will ONLY update the force, you won't call Input.Something (use attributes to remember what key/... were pressed).

```cs
// if up then Jump, etc.
rb.AddForce(Vector3.left); // move to the left
rb.AddForce(Vector3.left * speed);
rb.AddForce(Vector3.left * speed, ForceMode.A_MODE_HERE);
rb.MovePosition(position);
rb.AddExplosionForce(power, explosionPos, radius, 3.0F);
```
</details>

<details class="details-e">
<summary>Colliders</summary>

Colliders are used to check if our game object is colliding with another object. You will define a collider covering your game object (up to you, whether only touching the bust is considered as colliding=more efficient, etc.). Once you created your collider, **it will be triggered each time a game object having a Rigidbody is entering your collider**.

1. **Create**: by default, the collider will fit your object, more or less according to the kind of collider you picked. You can click on edit collider. If you are zooming a lot, you will see small green dots. Click on them to edit your collider in one direction. **Pro tip**: use rectangular colliders for better performances <small>(ex: not a good example but, you can make one covering the bust rather than the whole player)</small>.
2. **is trigger**
   1. if **false**, this object is solid, trigger the method `OnCollisionEnter(Collision)`.
   2. if **true**, objects are passing through each other, trigger the method `OnTriggerEnter(Collider)`.
3. **Layers**
   * by default, objects may collide even if there are not on the same layer.
   * You can change this behavior by tweaking the collision matrix at the end of Edit > Project Settings > Physics 
4. **Physical material**
    * it's an asset "create > Physic Material" in the project explorer
    * you can set every friction to 0, and set combine to "minimum" to disable friction.
    * then you can add it to a collider
5. **Some Code** (3 ways that I used)

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

| | Collider | Collider (isTrigger) | Collider+Rigidbody | Collider+Rigidbody (kinematic) |
| --- | --- | --- | --- | --- |
| Collider | x | x | OnCollisionEnter | x |
| Collider (isTrigger) | x  | x | OnTriggerEnter | OnTriggerEnter |
| Collider+Rigidbody | OnCollisionEnter | OnTriggerEnter | OnCollisionEnter | OnCollisionEnter |
| Collider+Rigidbody (kinematic) | x | OnTriggerEnter | OnCollisionEnter | x |

> **Pro tip**: this may not be the best way to do it, but methods such as `OnCollisionEnter` are filled with the game object we are colliding with. You may use tags, and check the tag of the game object.
</details>

> **Pro tip**: on the same line that you use to remove a component, you got a question mark inside a circle. Click on it to open the documentation of a component.

<hr class="sep-both">

## Asset Store

This is one of the places that you may use to look for assets. The [Asset Store](https://assetstore.unity.com/) needs you to log in to your unity account to import an asset in the editor. Fortunately, if Unity is open, you can do **Window > Asset store**, which will open the asset store in your browser and log you.

Once you added an asset to your list of assets, in Unity, you can find your assets in **Window > Package manager**. **Right next to the "+", you can set packages to**

* **My assets** (you can download and import your assets here)
* **Unity Registry** (verified plugins)
* **In Project** (you can update/remove your packages here)