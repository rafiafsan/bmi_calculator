import 'package:flutter/material.dart';
import 'blicalculator.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          centerTitle: true,
        ),

      ),
      title: "First App",
      home: BMI(),
    );
  }
}