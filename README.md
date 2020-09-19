# AutoSplash

A client/app written in Google's Flutter framework that interacts with the official Unsplash API.

Currently displays images from the trending page.


## Build

Add a file `key.dart` in `/lib/` with an API key from Unsplash.


```
class Key {
  String baseUrl;
  String key;

  Key({this.baseUrl, this.key});

  void getKey() {
    this.key = "YOUR_API_KEY";
  }
}
```
