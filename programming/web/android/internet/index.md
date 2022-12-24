# Internet

<div class="row row-cols-md-2 mt-4"><div>

It's highly likely that if you make some Android application, you will want to connect your app to your servers. To avoid putting credentials in the code, or to use external services, Android developers use [APIs](/programming/web/apis/index.md) to connect to their/external servers.

Add the permission in your AndroidManifest.xml <small>(above application)</small> ⭐

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

<details class="details-e">
<summary>Note about localhost</summary>

⚠️ Note that `localhost`/`127.0.0.1` isn't available from your Android application. You should use `10.0.2.2` instead.

You will also have to edit AndroidManifest.xml and allow HTTP

```diff
    <application
+        android:usesCleartextTraffic="true"
```
</details>
</div><div>

There are many libraries that you may use at some point

* [retrofit](https://github.com/square/retrofit) (40.9k ⭐): HTTP library
* [moshi](https://github.com/square/moshi) (8.7k ⭐): JSON library
* [gson](https://github.com/google/gson) (21.7k ⭐): JSON library
* [okhttp](https://github.com/square/okhttp) (43.3k ⭐): HTTP client used by retrofit/fuel/...
* [fuel](https://github.com/kittinunf/fuel) (4.3k ⭐, 👻): HTTP library
* [volley](https://github.com/google/volley) (3.3k ⭐, 👻): HTTP library

What I defined as HTTP libraries are libraries that are providing an interface to an HTTP client, so they aren't the ones doing the request.
</div></div>

<hr class="sep-both">

## Retrofit

<div class="row row-cols-md-2"><div>

[Retrofit](https://github.com/square/retrofit) is the most used HTTP client.

```gradle
implementation "com.squareup.retrofit2:retrofit:2.9.0"
implementation "com.squareup.retrofit2:converter-scalars:2.9.0"
```

#### Use the API

In an Activity, you will be able to fetch results with the code below.

```kotlin
CoroutineScope(Dispatchers.IO).launch {
    Log.d("TAG", RetrofitService.instance.getAllPosts())
}
```

But, you should do it inside a ViewModel with viewModelScope

```kotlin
viewModelScope.launch {
    Log.d("TAG", RetrofitService.instance.getAllPosts())
}
```

#### interface xxxAPI

In the example, this interface is called `JsonPlaceholderAPI`. Name it however you want, but inside you will declare the methods that you will be able to use in the code. See the [documentation](https://square.github.io/retrofit/).

```kotlin
// create an interface with the routes+methods
interface JsonPlaceholderAPI {
    // GET /posts
    @GET("posts") suspend fun getAllPosts() : String
    // GET /posts?id=value
    @GET("posts") suspend fun getPost(@Query("id") id: Int) : String
    // GET /posts/:id
    @GET("posts/{id}") suspend fun getPost(@Path("id") id: Int) : String
    // POST /posts with parameters wrapped in a class
    @POST("posts") suspend fun getPost(@Body body: String) : String
    // POST /posts with parameters provided one by one
    @POST("posts") @FormUrlEncoded suspend fun login(@Field("xxx") xxx: String/*, ...*/) : String
}
```

> You can remove the return type if the result does not interest you.
</div><div>

#### RetrofitService

```kotlin
package xxx

import retrofit2.Retrofit
import retrofit2.converter.scalars.ScalarsConverterFactory
import retrofit2.http.GET

private const val BASE_URL = "https://jsonplaceholder.typicode.com"

private val retrofit = Retrofit.Builder()
    .addConverterFactory(ScalarsConverterFactory.create())
    .baseUrl(BASE_URL)
    .build()

// create an interface with the routes+methods
interface JsonPlaceholderAPI {
    @GET("posts")
    suspend fun getAllPosts() : String
}

object RetrofitService {
    val instance : JsonPlaceholderAPI by lazy {
        retrofit.create(JsonPlaceholderAPI::class.java) }
}
```

<details class="details-e">
<summary>Make this code yours</summary>

```diff
- package xxx
+ package com.my.app

import retrofit2.Retrofit
import retrofit2.converter.scalars.ScalarsConverterFactory
import retrofit2.http.GET

- private const val BASE_URL = "https://jsonplaceholder.typicode.com"
+ private const val BASE_URL = "https://MY_URL_HERE"

private val retrofit = Retrofit.Builder()
    .addConverterFactory(ScalarsConverterFactory.create())
    .baseUrl(BASE_URL)
    .build()

- interface JsonPlaceholderAPI {
+ interface MyAPI {
-    @GET("posts")
-    suspend fun getAllPosts() : String
+    // add your methods here
}

object RetrofitService {
-    val instance : JsonPlaceholderAPI by lazy {
-        retrofit.create(JsonPlaceholderAPI::class.java) }
+    val instance : MyAPI by lazy {
+        retrofit.create(MyAPI::class.java) }
}
```
</details>

#### Expected result

Any request will return a big string with the result inside. The JSON isn't converted to Kotlin as we haven't used any converted yet.

➡️That's why every method inside "xxxAPI" is returning a String.

➡️That's why the POST's request Body has the type String.

The output is available in the logcat tab after a few seconds.
</div></div>

<hr class="sep-both">

## Retrofit - moshi

<div class="row row-cols-md-2"><div>

[Moshi](https://github.com/square/moshi) is one of the [converters](https://github.com/square/retrofit/tree/master/retrofit-converters) supported by Retrofit. It's very similar to the popular GSON converter.

**Replace** the previous imports with the two below

```gradle
implementation 'com.squareup.moshi:moshi-kotlin:1.13.0'
implementation 'com.squareup.retrofit2:converter-moshi:2.9.0'
```

Then, you need to replace the previous "default" converter

```diff
- import retrofit2.converter.scalars.ScalarsConverterFactory
+ import com.squareup.moshi.Moshi
+ import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
+ import retrofit2.converter.moshi.MoshiConverterFactory

+ private val moshi = Moshi.Builder()
+    .add(KotlinJsonAdapterFactory())
+    .build()

private val retrofit = Retrofit.Builder()
-    .addConverterFactory(ScalarsConverterFactory.create())
+    .addConverterFactory(MoshiConverterFactory.create(moshi))
    .baseUrl(BASE_URL)
    .build()
```

Then, you need to define a class to store the JSON responses

```kotlin
// { "userId": 1, "id": 1, "title": "xxx", "body": "yyy" }
data class Post(val userId: Int,
                val id: Int,
                val title: String,
                val body: String)
```
</div><div>

Then, you can replace the return type of your methods

```diff
interface JsonPlaceholderAPI {
    @GET("posts")
-    suspend fun getAllPosts() : String
+    suspend fun getAllPosts() : List<Post>
}
```

And now we can adapt our code.

```diff
CoroutineScope(Dispatchers.IO).launch {
-    Log.d("TAG", RetrofitService.instance.getAllPosts())
+    val posts = RetrofitService.instance.getAllPosts()
+    posts.forEach {
+        Log.d("TAG", "Post title is: "+it.title)
+    }
}
```

And the output in the console will be

```text
Post title is: sunt aut [...]
Post title is: qui est esse [...]
[...]
```

Useful stuff

<details class="details-e">
<summary>Different names for API fields and attributes</summary>

```kotlin
// { player_name: "toto" }
// store "player_name" inside "playerName" 
data class Player(
    @Json(name = "player_name") val playerName: String)
```
</details>

<details class="details-e">
<summary>Multiple response formats</summary>

After looking around, I found a lot of alternatives, but I didn't like them, so I made my own.

```diff
private val moshi = Moshi.Builder()
+    .add(XXXXJsonAdapter)
    .add(KotlinJsonAdapterFactory())
    .build()
```

Then, create an Adapter that will map to results to one data class

```diff
data class Post(val userId: Int,
                val id: Int,
                val title: String,
                val body: String,
+               val error: String?)
```

```
// OK: { "userId": 1, "id": 1, "title": "xxx", "body": "yyy" }
// ERROR: { "message": "xxx" }
object XXXJsonAdapter {
    @Suppress("unused") @FromJson
    fun parse(json: Map<*, *>) : Post {
        // error result
        if (json.containsKey("message")) {
            return Post(
                -1, -1, "", "", json["message"] as String
            )
        }
        // normal result
        return Post(
            json["userId"] as Int,
            json["id"] as Int,
            json["title"] as String,
            json["body"] as String,
            null // no error
        )
    }
}
```

Then in the code, simply check if error is null or not.
</details>

<details class="details-e">
<summary>Prepare/Format results</summary>

See [Custom Type Adapters](https://github.com/square/moshi#custom-type-adapters) for better examples. See also the example above for multiple response formats.

```diff
private val moshi = Moshi.Builder()
+    .add(XXXXJsonAdapter)
    .add(KotlinJsonAdapterFactory())
    .build()
```

```kotlin
// mochi will first parse the result in XXX
data class XXX(@Json(name = "type") val type : Int)
// but, we want to use an enum instead of an Int
enum class YYY {
    AAA,
    BBB,
    CCC
}
```

```kotlin
object XXXJsonAdapter {
    @Suppress("unused") @FromJson
    fun parse(xxxJson: XXX): YYY {
        return when(xxxJson.type) {
            1 -> YYY.AAA
            2 -> YYY.BBB
            3 -> YYY.CCC
        }
    }
}
```

```kotlin
// in your interface xxxAPI
suspend fun getXXX() : YYY
```
</details>

</div></div>

<hr class="sep-both">

## Retrofit: cookies/sessions

<div class="row row-cols-md-2"><div>

By default, Retrofit does not store/load cookies. It can be solved easily by creating a CookieJar.

```diff
+ import okhttp3.OkHttpClient

private val retrofit = Retrofit.Builder()
    .addConverterFactory(MoshiConverterFactory.create(moshi))
+    .client(OkHttpClient().newBuilder().cookieJar(SimpleCookieJar()).build())
    .baseUrl(BASE_URL)
    .build()
```

The SimpleCookieJar is a class that is storing cookies received from the server, and loads them in the next requests.
</div><div>

```
import okhttp3.Cookie
import okhttp3.CookieJar
import okhttp3.HttpUrl

class SimpleCookieJar : CookieJar {
    private var _cookies : MutableList<Cookie> = mutableListOf()

    override fun saveFromResponse(url: HttpUrl, cookies: MutableList<Cookie>) {
        _cookies = cookies
    }

    override fun loadForRequest(url: HttpUrl): MutableList<Cookie> {
        return _cookies
    }
}
```
</div></div>

<hr class="sep-both">

## Coil: Load images from the internet

<div class="row row-cols-md-2"><div>

You can use the [coil](https://github.com/coil-kt/coil) (8.8k ⭐) library.

```gradle
implementation "io.coil-kt:coil:1.1.1"
```

Example of working imageURL

```kotlin
val imageURL = "https://hdqwalls.com/download/far-cry-5-australian-cattle-dog-5k-du-2160x3840.jpg"
```

And we will consider an ImageView with the id "image_view".

<br>

#### Use with findViewById

```kotlin
view.findViewById<ImageView>(R.id.image_view).load(imageURL)
```

<br>

#### Use with View Binding

```kotlin
binding.imageView.load(imageURL)
```

<br>

#### Add a placeholder/handle loading errors

```
imgView.load(imageURL) {
    placeholder(R.drawable.a_loading_image)
    error(R.drawable.a_broken_image)
}
```
</div><div>

#### Use with Data Binding

I assume here that you're already familiar with data binding.

```xml
<!-- xxx is a variable in <data> with an attribute imageURL -->
<!--You must import app (xmlns:app="http://schemas.android.com/apk/res-auto" in <layout>)  -->
<!-- we will create loadImage -->
<ImageView
    [...]
    app:loadImage="@{xxx.imageURL}" />
```

```kotlin
// see binding adapter, apply for 'kotlin-kapt'
object BindingAdapters {
    // you can change the first/second argument name/type
    // according to the component on which you use it
    // and the type of the value you are passing to it
    @BindingAdapter("app:loadImage") @JvmStatic
    fun someMethodName(imageView: ImageView, imageUrl: String) {
        imageView.load(imageUrl)
    }
}
```

<br>

#### Convert any URL to HTTPS

```kotlin
val imgUri = imageURL.toUri().buildUpon().scheme("https").build()
imgView.load(imgUri)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Fuel example (stripe)](https://stripe.com/docs/payments/accept-a-payment?platform=android&ui=payment-sheet#android-collect-payment-details)
* [Retrofit errors](https://futurestud.io/tutorials/retrofit-2-simple-error-handling)
</div><div>

* [glide](https://github.com/bumptech/glide) (33.2k ⭐, images)
</div></div>