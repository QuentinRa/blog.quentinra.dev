# Internet

<div class="row row-cols-md-2 mt-4"><div>

It's highly likely that if you make some Android application, you will want to connect your app to your servers. To avoid putting credentials in the code, Android developers use [APIs](/programming/web/apis/index.md) to connect to their servers/external services.

You may also want to check out

* [firebase](https://firebase.google.com/) (auth, server push, 👻)

Add the permission in your AndroidManifest.xml <small>(above application)</small>

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

</div><div>

There are many library/clients to a website

* [retrofit](https://github.com/square/retrofit) (40.9k ⭐): HTTP client
* [moshi](https://github.com/square/moshi) (8.7k ⭐): JSON library
* [gson](https://github.com/google/gson) (21.7k ⭐): JSON library
* [okhttp](https://github.com/square/okhttp) (43.3k ⭐): HTTP library used by retrofit/fuel
* [fuel](https://github.com/kittinunf/fuel) (4.3k ⭐, 👻): HTTP client
* [volley](https://github.com/google/volley) (3.3k ⭐, 👻): HTTP client

What I defined as HTTP clients are libraries that are providing an interface to do HTTP requests, but aren't the one doing the request.

<details class="details-e">
<summary>Note about localhost</summary>

⚠️ Note that `localhost` isn't available from your Android application. There is `10.0.2.2` which is redirecting to localhost that you must use instead.

You will also have to edit AndroidManifest.xml and allow HTTP

```diff
    <application
+        android:usesCleartextTraffic="true"
```
</details>
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
    @POST("posts") suspend fun getPost(@Body body: SomeWrapper) : String
    // POST /posts with parameters provided one by one
    @POST("posts") @FormUrlEncoded suspend fun login(@Field("xxx") xxx: String/*, ...*/) : String
}
```

> Yu can remove the return type if the result do not interest you.
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

#### expected result

Any request will return a big string with the result inside. The JSON isn't converted to Kotlin as we haven't used any converted yet.

➡️That's why every method inside "xxxAPI" is returning a String.
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
</div><div>

Then, you need to define a class to store the JSON responses

```kotlin
// { "userId": 1, "id": 1, "title": "xxx", "body": "yyy" }
data class Post(val userId: Int,
                val id: Int,
                val title: String,
                val body: String)
```

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
+        Log.d("TAG", "Post title is:"+it.title)
+    }
}
```

And the output will be

```text
Post title is:sunt aut [...]
Post title is:qui est esse [...]
[...]
```

</div></div>

<hr class="sep-both">

## Retrofit: sending requests over the internet

<div class="row row-cols-md-2"><div>

</div><div>

<details class="details-e">
<summary>Moshi: Json To Kotlin</summary>

The factory is the following

```kotlin
private val moshi = Moshi.Builder()
    .add(KotlinJsonAdapterFactory())
    .build()

// ...
.addConverterFactory(MoshiConverterFactory.create(moshi))
// ...
```

Now, the "hardest" part, is if your API return the following JSON for `/posts` (GET)

```json
[
    { "name": "toto" }, 
    { "name": "tota" } 
]
```

Then, you associated method will be

```kotlin
@GET("posts")
suspend fun getAllPosts() : List<Post>
```

And each key in the JSON, must have an attribute in the (data) class Player. If the attribute has a different name than the key, you may use `@Json(name = "name")` for moshi to handle that.

```kotlin
data class Player(
    @Json(name = "name") val name: String)
```
</details>

<details class="details-e">
<summary>Load images from the internet</summary>

You can use the [coil](https://github.com/coil-kt/coil) library.

```gradle
implementation "io.coil-kt:coil:1.1.1"
```

And in the code

```kotlin
val imgUri = imgUrl.toUri().buildUpon().scheme("https").build()
imgView.load(imgUri)
// or
imgView.load(imgUri) {
    placeholder(R.drawable.id_of_a_loading_animation)
    error(R.drawable.id_of_a_broken_image)
}
```

To use this with data binding, create a custom attribute (ex: `app:imgUrl`), as explaining in the paragraph about "formatting" in the data binding section, calling the code above.
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Fuel example (stripe)](https://stripe.com/docs/payments/accept-a-payment?platform=android&ui=payment-sheet#android-collect-payment-details)
</div><div>

* [glide](https://github.com/bumptech/glide) (33.2k ⭐, images)
</div></div>