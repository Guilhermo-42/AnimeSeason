import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double getScreenWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getScreenHeight() {
    return MediaQuery.of(this).size.height;
  }
}