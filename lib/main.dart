import 'package:flutter/material.dart';

import 'flow/list/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(title: 'Flutter Heroes'),
      debugShowCheckedModeBanner: false,
    );
  }

}
