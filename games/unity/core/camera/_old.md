# Camera/Cursor

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