# 🎆 Notifications 🎆

<div class="row row-cols-md-2"><div>

First, add the permission in AndroidManifest.xml

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

Then, since Android O, you need to create a **channel**. Developers should group their notifications by channels. For the user, they can do operations like disabling a notification channel.

* [Create a Channel](https://developer.android.com/develop/ui/views/notifications/channels#CreateChannel)
* I pasted the code the gave in `XXX#onCreate` <small>(XXX extends Application)</small>

See also.

* [Create multi-line notifications, or add images/...](https://developer.android.com/develop/ui/views/notifications/expanded)
* [Do something if the user clicks on the notification](https://developer.android.com/develop/ui/views/notifications/navigation)
</div><div>

You also have to provide an icon, a title, a message, and [a priority](https://developer.android.com/reference/androidx/core/app/NotificationCompat.Builder#setPriority(int)).

```kotlin
// priority is ignored on Android O (Channel importance is used instead)
val builder = NotificationCompat.Builder(applicationContext, channel_id)
    .setSmallIcon(R.drawable.some_icon)
    .setContentTitle("title")
    .setContentText("body")
    .setPriority(NotificationCompat.PRIORITY_DEFAULT)
    
with(NotificationManagerCompat.from(context)) {
    // the "notificationId" is used to edit/close/...
    // this notification later. Use any value >0.
    notify(notificationId, builder.build())
}
```
</div></div>