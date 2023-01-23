## ImageX

Just a lazy image widget that accepts any path of [Asset, Path, Url] to load all image types including SVG.

#### => Returns a StatelessWidget
<br>

#### Takes these named paramters:
- ```String path``` required path to image. It could be [Asset, Path, or Url]
- ```double? height``` optional height.
- ```double? width``` optional width.
- ```BoxDecoration? decoration``` optional decoration.
- ```BoxFit? fit``` optional fit with default value = BoxFit.contain
- ```Widget? loadingWidget``` optional loading widget.
- ```Widget? errorWidget``` fallback error widget with default value of x icon
- ```Color? svgColor``` in case of [SVG] you can optionally set color

<br><br>

## Example: 

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