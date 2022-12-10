# 🛳️ Application Programming Interface 🛳️

<div class="row row-cols-md-2 mt-4"><div>

Application Programming Interfaces (APIs) are used to allow access to internal services such as a database to both internal and external entities, but with a layer of abstraction called "interface".

For the client of the API

* 💐 Easier to use the company services <small>(ex: payment APIs)</small>
* 🍹 The service is maintained by the provider <small>(less work to do)</small>

For the API provider

* ✨ Once created, you can use it with websites, mobile apps...
* 🍹 Centralize database accesses <small>(easier to find/patch bugs/...)</small>
* 💎 Can aggregate multiple data sources <small>(i.g. multiple databases...)</small>
</div><div>

* [Github API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
* [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) (musics)
* [myanimelist API](https://myanimelist.net/apiconfig/references/api/v2) (mangas, anime, ...) or [jikan](https://jikan.moe/) (unofficial MAL API)
* [pokemon API](https://pokeapi.co/)
* [Stripe](https://stripe.com/docs/api) (payments), [Paypal API](https://developer.paypal.com/docs/api/overview/) (same)
* [Mangadex API](https://api.mangadex.org/docs.html) (manga reader)
* ...
</div></div>

<hr class="sep-both">

## Stripe API

<div class="row row-cols-md-2 mt-4"><div>

Stripe is a payment API.

* [API documentation](https://stripe.com/docs/api)
* [Stripe Dashboard](https://dashboard.stripe.com/)

<br>

#### 👻 To-do 👻

<p>

* [Stripe: Prepare your API](https://stripe.com/docs/mobile/android/basic#prepare-your-api)
* [Custom payment flow](https://stripe.com/docs/payments/quickstart) (can download code)
* [Manage products and prices](https://stripe.com/docs/products-prices/manage-prices?dashboard-or-api=api)
</p>

</div><div>

#### Android

To test this code, you need to generate (server-side) a [PaymentIntent](https://stripe.com/docs/api/payment_intents/create?lang=node). The attribute `client_secret` will be used by the client.

Reference: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment?platform=android).

<details class="details-e">
<summary>AndroidManifest.xml</summary>

```diff
+    <uses-permission android:name="android.permission.INTERNET" />

    <application
+        android:name=".MainApplication"
```
</details>

<details class="details-e">
<summary>build.gradle</summary>

```diff
dependencies {
    ...
+   implementation 'com.stripe:stripe-android:20.16.1'
    ...
}
```
</details>

<details class="details-e">
<summary>PaymentActivity.kt</summary>

```kotlin
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.stripe.android.PaymentConfiguration
import com.stripe.android.paymentsheet.PaymentSheet
import com.stripe.android.paymentsheet.PaymentSheetResult

class PaymentActivity : AppCompatActivity() {
    lateinit var paymentSheet: PaymentSheet
    lateinit var paymentIntentClientSecret: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // config
        paymentSheet = PaymentSheet(this, ::onPaymentSheetResult)
        paymentIntentClientSecret = "CLIENT_PAYMENT_INTENT"
    }

    // call this method when the client request a payment
    private fun presentPaymentSheet() {
        paymentSheet.presentWithPaymentIntent(
            paymentIntentClientSecret,
            PaymentSheet.Configuration(
                merchantDisplayName = "YOUR_MERCHANT_NAME",
                allowsDelayedPaymentMethods = false
            )
        )
    }

    private fun onPaymentSheetResult(paymentSheetResult: PaymentSheetResult) {
        when(paymentSheetResult) {
            is PaymentSheetResult.Canceled -> {
                // do something
            }
            is PaymentSheetResult.Failed -> {
                // do something | see paymentSheetResult.error
            }
            is PaymentSheetResult.Completed -> {
                // do something
            }
        }
    }
}
```

As shown [here](https://stripe.com/docs/libraries/android), you should use Application for initialization.

```kotlin
import android.app.Application
import com.stripe.android.PaymentConfiguration

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        PaymentConfiguration.init(
            applicationContext,
            "pk_PUBLIC_KEY_HERE"
        )
    }
}
```

</details>

<details class="details-e">
<summary>Testing</summary>

* `4242 4242 4242 4242` (any CVC/...): OK
* `4000 0025 0000 3155` (any CVC/...): Authentication required
* `4000 0000 0000 9995` (any CVC/...): Refused
</details>
</div></div>