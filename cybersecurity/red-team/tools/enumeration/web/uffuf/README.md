# Unrestricted File Upload Fuzzer

⚠️ The tool is experimental, use at your own risk ⚠️

uffuf is a specialized tool inspired by the popular fuzzer [ffuf](https://github.com/ffuf/ffuf). It allows users to fuzz file names, content types, and other parameters, to assist in identifying vulnerabilities related to unrestricted file uploads in web applications. It's an alternative to Burp Suite or other web proxies.

#### Basic Usage

* Filename Fuzzing - Bypassing Filename Checks

```shell!
$ ./main.py -u https://example.com -p uploadFile -F myFile -w myWordlist -Fn dummyFUZZ
$ # Attempt by prepending a valid extension (filter)
$ ./main.py -u https://example.com -p uploadFile -F myFile -w myWordlist -Fn dummy.jpgFUZZ
$ # Attempt by appending a valid extension (misconfiguration, rare)
$ ./main.py -u https://example.com -p uploadFile -F myFile -w myWordlist -Fn dummyFUZZ.jpg
```

* ... And use a custom mime-type to see if it works

```shell!
$ # Attempt basic MIME type bypass
$ ./main.py [...] -Ft image/jpeg
```

* MIME type Fuzzing - Detect MIME type filtering

```shell!
$ ./main.py -u https://example.com -p uploadFile -F myFile -w myWordlist -Ft FUZZ
```

#### Testing

* Blacklist some extensions (`https://academy.hackthebox.com/module/136/section/1288`)

```shell!
$ ./main.py -u <IP:port>/upload.php -p uploadFile -w web-extensions.txt -Fn testFUZZ -mr "File successfully uploaded"
```

* Blacklist and whitelist extensions (`https://academy.hackthebox.com/module/136/section/1289`)

```shell!
$ ./main.py -u <IP:port>/upload.php -p uploadFile -w web-extensions.txt -Fn testFUZZ.jpg -mr "File successfully uploaded"
```

* Blacklist and whitelist extensions, MIME type checking `https://academy.hackthebox.com/module/136/section/1290`

```shell!
$ file webshell.php.jpg
webshell.php.jpg: JPEG image data
$ ./main.py -u <IP:port>/upload.php -p uploadFile -w web-extensions.txt -F webshell.php.jpg -Fn test.jpgFUZZ -Ft image/jpg -mr "File successfully uploaded"
```

Alternatively, we can use the `--spoof` flag:

```shell!
$ ./main.py -u <IP:port>/upload.php -p uploadFile -w web-extensions.txt -F webshell.php -Fn test.jpgFUZZ -Ft image/jpg -mr "File successfully uploaded" --spoof
```

#### Missing Features

* Verbose (-v == see payloads, -vv == see first line of content)
* Add option to test if uploaded file is executable?