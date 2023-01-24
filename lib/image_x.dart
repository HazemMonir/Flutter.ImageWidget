library image_x;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_io/io.dart';

/// Lazy image widget for any path [Asset, Path, Url] for all image types
class ImageX extends StatelessWidget {
  /// required path to image
  final String path;

  /// optional height
  final double? height;

  /// optional width
  final double? width;

  /// optional borderRadius
  final BorderRadius? borderRadius;

  /// optional decoration [BoxDecoration]
  final BoxDecoration? decoration;

  /// optional fit with default value = [BoxFit.contain]
  final BoxFit fit;

  /// optional loading widget
  final Widget? loadingWidget;

  /// fallback error widget with default value of x icon
  final Widget? errorWidget;

  /// in case of [SVG] you can optionally set color
  final Color? svgColor;

  /// optional onPressed callback
  final VoidCallback? onPressed;

  const ImageX({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.contain,
    this.decoration,
    this.loadingWidget,
    this.errorWidget,
    this.svgColor,
    this.onPressed,
  });

  /// check if string is url
  bool _isUrl() => Uri.parse(path).host.isNotEmpty;

  /// check if path starts with assets/
  bool _isAsset() => path.startsWith('assets/');

  /// check if path contains .svg
  bool _isSVG() => path.contains('.svg');

  /// widget for errorBuilder
  Widget _errorWidgetBuilder(_, __, ___) =>
      errorWidget ?? const Icon(Icons.close_rounded, size: 50);

  /// widget for loadingBuilder
  Widget loadingWidgetBuilder(_, __, ___) => loadingWidget!;

  /// returns network image widget
  Widget _networkImage() => _isSVG()
      ? SvgPicture.network(
          path,
          color: svgColor,
          height: height,
          width: width,
          fit: fit,
        )
      : Image.network(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
          loadingBuilder: loadingWidgetBuilder,
        );

  /// returns file image widget
  Widget _fileImage() => _isSVG()
      ? SvgPicture.file(
          File(path),
          color: svgColor,
          height: height,
          width: width,
          fit: fit,
        )
      : Image.file(
          File(path),
          height: height,
          width: width,
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
        );

  /// returns asset file image widget
  Widget _assetImage() => _isSVG()
      ? SvgPicture.asset(
          path,
          color: svgColor,
          height: height,
          width: width,
          fit: fit,
        )
      : Image.asset(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
        );

  /// returns the proper image widget
  Widget _child() => _isUrl()
      ? _networkImage()
      : _isAsset()
          ? _assetImage()
          : _fileImage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          decoration: decoration,
          child: _child(),
        ),
      ),
    );
  }
}
