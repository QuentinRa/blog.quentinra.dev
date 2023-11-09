# Serialize Field: more

<details class="details-e">
<summary>General 🛠</summary>
<br>
<table class="table table-striped table-bordered border-dark">
<tr><th>Code</th><th>Editor/Description</th></tr>

<tr><td>

```cs
[ContextMenuItem("reset", "ResetIntWithMenuItem")] 
public int intWithMenuItem;
private void ResetIntWithMenuItem()
{
	intWithMenuItem = 12;
}
```
</td><td><br>

When using your left-click on a field, you can add fields in the context menu. If you want to add something for the class, check [ContextMenu](https://docs.unity3d.com/ScriptReference/ContextMenu.html).

![Attributes Unity - Context](attributes/context.png)
</td></tr>

<tr><td>

```cs
// using System; // for Serializable
[Serializable]
public class NestedClass // <=> struct
{
	public int nestedAttribute; 
}
[SerializeField] private NestedClass nestedClass;
```
</td><td><br>

You can make a dropdown nested inside your component, as other native components do. The class must be Serializable, then simply give the Serializable class as the type of the field.

![Attributes Unity - Nested](attributes/nested.png)
</td></tr>

<tr><td>

```cs
private enum Axis
{
	[InspectorName("X-axis")] X, 
	[InspectorName("Y-axis")] Y
}
[SerializeField] private Axis axis = Axis.X;
```
</td><td><br>

You can use this to rename the values of your enum in the inspector. It does not work for attributes 😭.

![Attributes Unity - InspectorName](attributes/InspectorName.png)

</td></tr>
</table>
</details>

You got way more attributes, you can

* use [SelectionBase](https://docs.unity3d.com/ScriptReference/SelectionBaseAttribute.html) to a class (even if you are not showing it in the editor), to pick whether this class should be selected (no attribute, default), or the base (this attribute)
* add an **entry** in the **preferences** with [SettingsProvider](https://docs.unity3d.com/ScriptReference/SettingsProvider.html) (new version of [PreferenceItem](https://docs.unity3d.com/ScriptReference/PreferenceItem.html))
* add an **entry** in the **toolbar** with [MenuItem](https://docs.unity3d.com/ScriptReference/MenuItem.html)
* add an **entry** in the **assets list** with [CreateAssetMenu](https://docs.unity3d.com/ScriptReference/CreateAssetMenuAttribute.html) (attached to a class extending ScriptableObject)
* make this component show up when **selecting multiples game objects** with [CanEditMultipleObjects](https://docs.unity3d.com/ScriptReference/CanEditMultipleObjects.html)