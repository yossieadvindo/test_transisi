import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_transisi/pages/AddPage.dart';
import 'package:test_transisi/pages/HomePage.dart';
import 'package:test_transisi/pages/LoginPage.dart';
import 'package:test_transisi/provider/Employee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
