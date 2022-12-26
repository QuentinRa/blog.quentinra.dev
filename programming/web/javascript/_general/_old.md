# REST API

You got another course "API", explaining what's an API and a lot of related stuff. Let's take the [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) for example,

* [this URL](https://musicbrainz.org//ws/2/release?artist=65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab&status=bootleg&type=live&limit=1&fmt=json) is returning **one album** made by [Autechre](https://en.wikipedia.org/wiki/Autechre).
* Here, we are considering that, like the URL above, you got a URL allowing you to fetch a result from your API
* I'm going to explain how from this URL, you can get the result and use it in your code

When you are calling an API, you are requesting something from another website, this is not immediate. If you are waiting for the result, you won't be able to use JavaScript until the call is done (😨). We are making **asynchronous calls** (=in parallel to your code) to prevent this. I was taught XMLHTTPRequest, which need to be wrapped inside a **Promise** (asynchronous code) but **fetch** <small>(native function)</small> is already doing this making the code cleaner than ever.

* [XMLHttpRequest](api/request.md)
* [Promises](api/promises.md)
* [Fetch](api/fetch.md) 😍
* [Async/await](api/async.md)
* [Example API - MusicBrainz](api/example.md)
* W
  * <https://attacomsian.com/blog/xhr-post-request>
<hr class="sl">