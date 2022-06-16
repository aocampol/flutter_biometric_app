import 'package:flutter/material.dart';
import 'package:flutter_biometric_app/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biometric Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage()
    );
  }
}