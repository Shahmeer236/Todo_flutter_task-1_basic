import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_1/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: "toDo App ",
      home: Home(),
    );
  }
}
