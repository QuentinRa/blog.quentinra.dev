# Stripe API

<div class="row row-cols-lg-2"><div>

Stripe is a payment API. You can use it on websites, or mobiles devices, and you can use your own interface, or theirs.

* [API documentation](https://stripe.com/docs)
* [API reference](https://stripe.com/docs/api)
* [Stripe Dashboard](https://dashboard.stripe.com/)

It's worth noting that their documentation can be adapted according to the technologies you are using <small>(ex: Node.js, HTML...)</small>, so you may be able to download code samples in your language 🥳.
</div><div>

Some useful pages

* [Prebuilt Checkout page](https://stripe.com/docs/checkout/quickstart?lang=node&client=react) (client web + server)
* [Accept a payment](https://stripe.com/docs/payments/accept-a-payment?platform=android&ui=payment-sheet) (client web/mobile + server)
* [Custom payment flow](https://stripe.com/docs/payments/quickstart?platform=android&lang=node) (client web/mobile + server)

> ➡️You need an account at some point, but you can use the public (secret) test key provided in the samples to test the API
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-lg-2"><div>

To use the Stripe API, you will have to use two tokens.

* `sk_SECRET_KEY`: a secret key used server-side
* `pk_PUBLIC_KEY`: a public key used client-side

You can get them from your Stripe Dashboard.

</div><div>

Testing

* `4242 4242 4242 4242` (any CVC/...): OK
* `4000 0025 0000 3155` (any CVC/...): Authentication required
* `4000 0000 0000 9995` (any CVC/...): Refused
</div></div>

<hr class="sep-both">

## Node.js (server)

<div class="row row-cols-lg-2"><div>

Generate a payment intent

```javascript!
await stripe.paymentIntents.create({
    amount: 1400, // calculate the price
    currency: "usd",
    payment_method_types: ['card'],
    // optional; you can store custom data
    // metadata: {
    //     key: value
    // }
}).then(r => res.json({ id: r.id, clientSecret: r.client_secret }) )
```

Retrieve a payment intent

```javascript!
const paymentIntent = await stripe.paymentIntents.retrieve('pi_id')
// see status
if (paymentIntent.status === 'succeeded') { /* ... */ }
```
</div><div>

Delete a payment intent

```javascript!
const paymentIntent = await stripe.paymentIntents.cancel('pi_id')
```
</div></div>

<hr class="sep-both">

## Android (client)

Reference: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment?platform=android).

<div class="row row-cols-lg-2"><div>

**Edit your build.gradle**

```diff
+   implementation 'com.stripe:stripe-android:20.16.1'
```

**Edit your AndroidManifest.xml**

```diff
+    <uses-permission android:name="android.permission.INTERNET" />

    <application
+        android:name=".MainApplication"
```

**Create/Edit MainApplication.kt**

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

**Create a payment intent** (server-side)

You need to create a [PaymentIntent](https://stripe.com/docs/api/payment_intents/create?lang=node) server-side. In the Stripe response, you will get a **client_secret** that must be sent to the client.

</div><div>

Finally, add this code to the activity with the payment button. You will typically call **init** at the start, **show** when the pay button is pressed.

⚠️ You need to fetch the payment intent from your API. See [Internet](/programming-languages/mobile/android/others/net.md).

```kotlin
private lateinit var paymentSheet: PaymentSheet

private fun init() {
    paymentSheet = PaymentSheet(this, ::onPaymentSheetResult)
}

private fun show() {
    paymentSheet.presentWithPaymentIntent(
        "PAYMENT_INTENT.CLIENT_SECRET",
        PaymentSheet.Configuration(
            merchantDisplayName = "MERCHANT NAME HERE",
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
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Android basic integration](https://stripe.com/docs/mobile/android/basic)
* [VueStripe](https://vuestripe.com/) / [docs](https://docs.vuestripe.com/vue-stripe/)
</div><div>


</div></div>