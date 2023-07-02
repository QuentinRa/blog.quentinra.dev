# Threads

<hr class="sl">

## async/await

Sometimes you need to call an async function and wait for the return. In Java, what I saw with websockets was

* a function is called like you send your request
* the websocket server-side do his job
* then when we got your answer, an event is generated and parsing it will give us the result that we awaited.

To wait, I'm using `CountDownLatch`. I will store the function result in an `AtomicReference` variable ``ref``.

```java
CountDownLatch latch = new CountDownLatch(1);
AtomicReference<T> ref = new AtomicReference<>();
```

Then in the function

```java
// send a message to the server
// ...

// create and listen for events (=the server response)
// ...

// and wait for response in this thread
latch.await();
// once await is done,
// return the result
return this.ref.get();
```

And in the event function, where you handle the response from the server, you need to tell latch to stop waiting and set ref value.

```java
this.ref.set(value);
this.latch.countDown();
```