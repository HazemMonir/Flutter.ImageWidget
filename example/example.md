## Import package

```dart
import 'package:image_widget/image_widget.dart';
```

## Usage: 

```dart
class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageWidget(
      path: 'assets/images/logo.svg',
      fit: BoxFit.fitWidth,
      svgColor: Colors.blue,
    );
  }
}
```