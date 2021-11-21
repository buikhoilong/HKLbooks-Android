import 'package:flutter/material.dart';
import 'package:hkl_books/screens/home/home.dart';
import 'package:hkl_books/screens/loading/loading.dart';
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HKLBooks',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const Loading(),
    );
  }
}
