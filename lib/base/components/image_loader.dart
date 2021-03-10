import 'package:flutter/material.dart';
import 'package:flutter_heroes/extension/build_context_extensions.dart';

class ImageLoader extends StatefulWidget {
  final String imageUrl;
  final double widthFactor;
  final double heightFactor;

  const ImageLoader(this.imageUrl,
      {Key key, this.widthFactor, this.heightFactor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  static const _imageWidthFactor = 0.25;
  static const _imageHeightFactor = 0.2;

  @override
  Widget build(BuildContext context) {
    final _imageWidth = widget.widthFactor != null
        ? context.getScreenWidth() * widget.widthFactor
        : context.getScreenWidth() * _imageWidthFactor;
    final _imageHeight = widget.heightFactor != null
        ? context.getScreenHeight() * widget.heightFactor
        : context.getScreenHeight() * _imageHeightFactor;

    return Container(
        alignment: Alignment.center,
        color: Colors.grey,
        width: _imageWidth,
        height: _imageHeight,
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.fill,
          height: _imageHeight,
          width: _imageWidth,
        ));
  }
}
