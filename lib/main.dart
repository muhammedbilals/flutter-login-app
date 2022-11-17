
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login sample",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ScreenSplash(),
    );
  }
}