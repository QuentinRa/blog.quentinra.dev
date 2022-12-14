# Stripe API

<div class="row row-cols-md-2 mt-4"><div>

Stripe is a payment API. You can use it on websites, or mobiles, and you can use your own interface, or theirs.

* [API documentation](https://stripe.com/docs)
* [API reference](https://stripe.com/docs/api)
* [Stripe Dashboard](https://dashboard.stripe.com/)

It's worth noting that their documentation can be adapted according to the technologies you are using <small>(ex: Node.js, HTML...)</small>, so you may be able to download code samples in your language 🥳.
</div><div>

Some useful pages

* [Prebuilt Checkout page](https://stripe.com/docs/checkout/quickstart?lang=node&client=react) (client web + server)
* [Accept a payment](https://stripe.com/docs/payments/accept-a-payment?platform=android&ui=payment-sheet) (client web/mobile + server)
* [Custom payment flow](https://stripe.com/docs/payments/quickstart?platform=android&lang=node) (client web/mobile + server)

<br>

> ➡️You need an account at some point, but you can use the public (secret) test key provided in the samples to test the API
</div></div>


<hr class="sep-both">

## Stripe API

<div class="row row-cols-md-2 mt-4"><div>

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

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Android basic integration](https://stripe.com/docs/mobile/android/basic)
</div><div>


</div></div>