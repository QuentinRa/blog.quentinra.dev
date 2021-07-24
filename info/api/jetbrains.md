# Jetbrains Requests tools

* inside a Jetbrains software (like PHPStorm, IntelliJ, ...)
* create a file/scratch .http (ex: `test.http`)
* then write some requests (post/get)
  (and the result you are expecting if you want to).
  This is quite good if you are making tests
  for your api.
* a file is looking this this but you should use
  the generation tools to add some requests (and
  you can also see some examples inside the
  editor)

```http request
# example of GET request
# get user "test"
GET http://localhost:80/api/user/test
Accept: application/json

### (example of POST request)
### Login (it's like you are submitting a login form, you
### provide an username and a password to login)
POST http://localhost:80/api/user/login
Content-Type: application/x-www-form-urlencoded

username=john&password=doe
```

<hr class="sr">

* [IntelliJ Request](https://www.jetbrains.com/help/idea/http-client-in-product-code-editor.html)
* [PHPStorm Request](https://www.jetbrains.com/help/phpstorm/http-client-in-product-code-editor.html)
* [PHPStorm Request syntax](https://www.jetbrains.com/help/phpstorm/exploring-http-syntax.html)