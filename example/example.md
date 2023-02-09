## Import package

```dart
import 'package:image_x/image_x.dart';
```

## Usage: 

```dart
class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageX(
      path: 'assets/images/logo.svg',
      height: 200,
      width: 200,
      scale: .66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2, color: Colors.blue),
      ),
      svgColor: Colors.blue,
    );
  }
}
```