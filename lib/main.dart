import 'package:flutter/material.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'HKLBooks',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
      ),
      home:const Loading(),      
    );
  }
}
