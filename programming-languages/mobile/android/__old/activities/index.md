# Activity life-cycle


<hr class="sep-both">

## Random notes about activities

<div class="row row-cols-md-2"><div>

* Set the Activity's title from the code. The title is shown is the task list, and in the default menu bar.

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        ...
        title = "Some title"
    }
}
```
</div><div>

...
</div></div>

<hr class="sep-both">

## Navigate/open another activity

<div class="row row-cols-md-2"><div>

An [**intent**](https://developer.android.com/guide/components/intents-filters) is an object representing some action to be performed, such as navigating to another activity. There are two kinds of intent


* **Explicit**: ask specifically for something <small>(ex: start the Activity XXX)</small>
* **Implicit**: request another application/the system <small>(ex: open link)</small>

```kotlin
// create an intent
val intent = Intent(SOME_PARAMETERS)
// optional, you can pass parameters
intent.putExtra("param", "a value")
// start
startActivity(intent)
```

If you passed parameters, in the new Activity, use

```kotlin
val param = intent?.extras?.getString("param")
```
</div><div>

#### Explicit intent

Ex: to navigate to "MainActivity"

```kotlin
// this = a context
val intent = Intent(this, MainActivity::class.java)
```

#### Implicit intent

[There are a lot of them here](https://developer.android.com/reference/android/content/Intent).

<details class="details-e">
<summary>Open a link/mail/phone</summary>

Open a URL (`https:`), a mail (`mailto:`), or a telephone (`tel:`). For instance, given a URL, it will try to open it in a browser...

```kotlin
val intent = Intent(Intent.ACTION_VIEW, Uri.parse("???"))
```
</details>

<details class="details-e">
<summary>Share something</summary>

```kotlin
val intent = ShareCompat.IntentBuilder.from(this)
        .setText("...")
        .setType("text/plain")
        .intent
```
</details>

<details class="details-e">
<summary>Send an email</summary>

```kotlin
val intent = Intent(Intent.ACTION_SEND)
    .setType("text/plain")
    .putExtra(Intent.EXTRA_SUBJECT, "xxx")
    .putExtra(Intent.EXTRA_TEXT, "yyy")
    .putExtra(Intent.EXTRA_EMAIL, "a@b.c")
```
</details>

<details class="details-e">
<summary>⚠️ How to properly run an implicit intent ⚠️</summary>

What if you try to open a link in a browser, but the user uninstalled every browser? It will fail. You have to handle errors!

* Option 1: check if the startActivity fails

```kotlin
try {
    startActivity(intent)
} catch (ex: ActivityNotFoundException) {
    // use a toast / ...
}
```

* Option 2: check before starting the intent

```kotlin
if (packageManager.resolveActivity(intent, 0) != null) {
    startActivity(intent)
}
```
</details>
</div></div>

<hr class="sep-both">

## Application back stack

<div class="row row-cols-md-2"><div>

Android activities are pilled up in something called the "back stack". In older devices, users can use the "back arrow" to go back to a previous activity. The current intent is popped out, and the previous activity is started again. If there are none, then the app is terminated.

![img.png](_images/android_back_stack.png)
</div><div>

It's always the activity at the top that is shown to the user.

At the end of the example, we got two instances of "MainActivity". It's important to consider if this behavior is acceptable or not. If not, you should pass flags to your Intent using [Intent#addFlags](https://developer.android.com/reference/android/content/Intent.html#flags).

👉 For instance, if the user logs out, he should not be able to press "back", and go back to the "connected area".

* Manual "back" <small>(pop out current)</small>

```javascript
intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
```
</div></div>

<hr class="sep-both">

## Fragments

<div class="row row-cols-md-2"><div>

Fragments are in many ways similar to activities. They are loaded by an activity, but they have their own lifecycle.

* 👉 `Activity#onCreated` was split into 3 methods
* 👉 The navigation is done with a [Navigation Component](../views/index.md#-navigation-component-)
* 👉 Some code need to be updated <small>(most "`this`" won't work...)</small>
  * Use `requireActivity()` to get an Activity
  * Use `activity` to get an Activity <small>(@Nullable)</small>

```diff
- val param = intent?.extras?.getString("param")
+ val param = requireActivity().intent?.extras?.getString("param")
+ val param = activity?.intent?.extras?.getString("param")
```

  * Use `requireContext()` to get a Context
  * Use `context` to get a Context <small>(@Nullable)</small>

```diff
- val intent = Intent(this, MainActivity::class.java)
+ val intent = Intent(requireContext(), MainActivity::class.java)
+ val intent = Intent(context!!, MainActivity::class.java)
```

* Use `view`/`requireView()` to get a View

```diff
- val myButton = findViewById<Button>(R.id.myButton)
+ val myButton = view.findViewById<Button>(R.id.myButton)
+ val myButton = requireView().findViewById<Button>(R.id.myButton)
```

* Use `viewLifecycleOwner` to get a LifecycleOwner

```diff
- myLiveData.observe(this) {}
+ myLiveData.observe(viewLifecycleOwner) {}
```
</div><div>

#### Create a fragment

* File > New > fragment > [select a template]

```kotlin
class BlankFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Load the associated View
        return inflater.inflate(R.layout.fragment_blank, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // See View to configure the view (listeners...)
        // use "view.xxx()" instead of "xxx()".
    }
}
```

The Fragment lifecycle is as follows.

![Fragment lifecycle](./_images/android_fragment_lifecycle.png)
</div></div>