## Features

Just a lazy image widget that accepts any path of [Asset, Path, Url] to load all image types including SVG.

## Usage: 

```dart
class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageX(
      path: 'assets/images/logo.svg',
      fit: BoxFit.fitWidth,
      svgColor: Colors.blue,
    );
  }
}
```