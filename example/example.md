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
      fit: BoxFit.fitWidth,
      svgColor: Colors.blue,
    );
  }
}
```