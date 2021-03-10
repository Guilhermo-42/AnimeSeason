import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleProgressBar extends StatelessWidget {
  const SimpleProgressBar({this.progressIndicatorColor});

  final Color progressIndicatorColor;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3.0,
      valueColor: AlwaysStoppedAnimation<Color>((progressIndicatorColor != null)
          ? progressIndicatorColor
          : Colors.black
      ),
    );
  }

}