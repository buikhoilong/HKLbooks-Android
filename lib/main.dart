import 'package:flutter/material.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/provider/categoryprovider.dart';
import 'package:hkl_books/provider/promoteprovider.dart';
import 'package:hkl_books/screens/loading/loading.dart';
import 'package:provider/provider.dart';
import 'config.dart';
import 'provider/accountprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //create ChangeNotifierProvider
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BookProvider>(create: (_) => BookProvider()),
          ChangeNotifierProvider<AccountProvider>(
              create: (_) => AccountProvider()),
          ChangeNotifierProvider<PromoteProvider>(
              create: (_) => PromoteProvider()),
          ChangeNotifierProvider<CategoryProvider>(
              create: (_) => CategoryProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HKLBooks',
          theme: ThemeData(
            primaryColor: myGreen,
            colorScheme: const ColorScheme.light().copyWith(primary: myGreen),
            scaffoldBackgroundColor: primaryColor,
          ),
          home: const Loading(),
        ));
  }
  /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HKLBooks',
      theme: ThemeData(
        primaryColor: myGreen,
        colorScheme: const ColorScheme.light().copyWith(primary: myGreen),
        scaffoldBackgroundColor: primaryColor,
      ),
      home: const Loading(),
    );
  }*/
}
