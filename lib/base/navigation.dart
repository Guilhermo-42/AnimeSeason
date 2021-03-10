import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navigation {
  final BuildContext context;

  Navigation(this.context);

  push(Widget page) {
    final route = MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }

  pushFinishingCurrent(Widget page) {
    final route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushReplacement(context, route);
  }
}
