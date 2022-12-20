# Android Activities

<div class="row row-cols-md-2"><div>

From a user perspective, an activity is a view of your application.

* 👉 Activities must be declared in AndroidManifest.xml
* 👉 The first screen is usually called "MainActivity"
* 👉 Activities are associated with a [View](../views/index.md) <small>(ex: R.layout.activity_main)</small>

Using **Fragments**, a developer can use multiple views in one activity. Fragments are reusable views that can be loaded from any Activity.

```kotlin
class MainActivity : AppCompatActivity(R.layout.activity_main) {
}
```

</div><div>

Extended (and usual) version

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Associate the View
        setContentView(R.layout.activity_main)
    }
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

...
</div><div>


</div></div>