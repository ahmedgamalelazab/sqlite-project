import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const String pageRoute = "/testScreen";
  const TestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Native device devices"),
        ),
      ),
    );
  }
}
