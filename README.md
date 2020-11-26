# FlutterMCE

**Note: this is an unstable version which is not production-ready, and is only available as the developer preview. There are some breaking changes that will come in the future.**

![Showcase of the FlutterMCE](flutter_mce_001.gif)

FlutterMCE is a simplistic rich text editor for Flutter, inspired by [this awesome Medium article by Jan Brunckhorst](https://levelup.gitconnected.com/flutter-medium-like-text-editor-b41157f50f0e), and, *gasp*, the fact I've found no equivalent in the Flutter world while developing a production application.

The idea is to have a setup as simple as

```dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Yes, this is everything you gotta do
      body: FlutterMCE(),
    );
  }
}
```

## License

Project is licensed under MIT license.

## Development

Development is conducted on private GitLab repository, if you're seeing this you're most likely accessing it through GitHub. I'm only posting new major changes here.

If you wish to contribute, please contact me and we can collaborate.