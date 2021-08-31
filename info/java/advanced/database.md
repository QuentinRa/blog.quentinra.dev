# Databases

[Go back](../index.md#advanced)

Sorry, I was planning to make it but I don't want to.

* using a database inside your code means that you will put an username and a password inside your code
* and it's quite a lot of code (a lot of exceptions) that you will have to handle so that's not a good idea
  
You may look at **SQLite** if you want a local database to store your data (so you don't care about some local username/password being leaked).

If not, I think you should consider writing a Rest API, then in Java, simply make HTML request to the API.

* use `org.json` to handle the responses in JSON
* use `HttpURLConnection` (or HttpsURLConnection) to read content from a page like this
  
```java
URL url = new URL(endpoint);
HttpURLConnection req = (HttpURLConnection) url.openConnection();

// read 
BufferedReader buff = new BufferedReader(new InputStreamReader(req.getInputStream()));
String reader;
StringBuilder str = new StringBuilder();
while((reader = buff.readLine()) != null) str.append(reader);
            
// close
buff.close();
req.disconnect();

String response = str.toString();
// parse
JSONObject o = new JSONObject(response);
String string = o.getString("...");
```

it's not hard right? Just create a method doing this, on you only do handle the parsing. Since JDK15/JDK16, you may be able to use records to store the response in a class.

<hr class="sl">

## WebSockets

Since making HTTP requests is quite slow (preparing the headers, sending the content, ...), I'm using WebSockets (with Socket.io) so that it leaves me only having to handle the content. But you won't be able to use that in a lot of cases (since Sockets are mainly used when doing a real-time app so an app interacting a lot with the API).