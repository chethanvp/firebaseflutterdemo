import 'package:flutter/material.dart';
import 'package:firebasedemo/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "firebase sample",
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
