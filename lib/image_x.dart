library image_x;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_io/io.dart';

/// Lazy image widget for any path [Asset, Path, Url] for all image types
class ImageX extends StatelessWidget {
  /// required path to image
  final String path;

  /// BoxFit with default value of [BoxFit.contain]
  final BoxFit? fit;

  /// Optional loading widget
  final Widget? loadWidget;

  /// fallback error widget with default value of x icon
  final Widget? loadingErrorWidget;

  /// In case of [SVG] you can optionally set color
  final Color? svgColor;

  const ImageX({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.loadWidget,
    this.loadingErrorWidget,
    this.svgColor,
  });

  /// check if string is url
  bool _isUrl(String url) => Uri.parse(url).host.isNotEmpty;

  /// check if path starts with assets/
  bool _isAsset(String path) => path.startsWith('assets/');

  /// check if path contains .svg
  bool _isSVG(String path) => path.contains('.svg');

  Widget _errorWidgetBuilder(_, __, ___) =>
      loadingErrorWidget ?? const Icon(Icons.close_rounded, size: 50);

  Widget loadingWidgetBuilder(_, __, ___) => loadWidget!;

  _networkImage() => _isSVG(path)
      ? SvgPicture.network(path, color: svgColor)
      : Image.network(
          path,
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
          loadingBuilder: loadingWidgetBuilder,
        );

  _fileImage() => _isSVG(path)
      ? SvgPicture.file(File(path), color: svgColor)
      : Image.file(
          File(path),
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
        );

  _assetImage() => _isSVG(path)
      ? SvgPicture.asset(path, color: svgColor)
      : Image.asset(
          path,
          fit: fit,
          errorBuilder: _errorWidgetBuilder,
        );

  @override
  Widget build(BuildContext context) {
    return _isUrl(path)
        ? _networkImage()
        : _isAsset(path)
            ? _assetImage()
            : _fileImage();
  }
}
