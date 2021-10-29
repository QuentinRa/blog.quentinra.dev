# Unity 3D

An incomplete (in-progress) course about Unity 3D. This is listing what I used only in 3D.

## Materials

This is a sort of skin/texture for our 3D models.

<details class="details-e">
<summary>Create a material</summary>

* In the Project window
* **[Optional]** In a folder Materials
* Right-click > Create > Material
* **[Optional]** you may set the material as Transparent, if you are planning to make the applied game object a light source (trick)
* **[Up to you]** you can change the **color** on the line "Albedo"
* **[Up to you]** you can set the smoothness to 0 (=not shinny)
* **[Up to you]** you can set an **image** (=texture) by clicking on the little circle with a dot inside, right before "Albedo"
* **[Up to you]** you can enable emission and set a color, if you want this color to be emitted from your material (trick)
</details>
<details class="details-e">
<summary>Apply a material</summary>

* **Method 1** 📚
	* Click on a Game object
	* Mesh Renderer > Materials
	* Drag and drop your Material from the Project window to the input field
* **Method 2** 🚀
	* Drag and drop the material on the game object, in the scene window
* **Method 3** 🚀🚀
	* Drag and drop the material on the game object, in the hierarchy window
</details>