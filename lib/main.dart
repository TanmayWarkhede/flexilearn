import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

void main() {
  runApp(FlexiLearnApp());
}

class FlexiLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexiLearn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}
