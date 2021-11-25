import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      gradientBackground:
          // ignore: prefer_const_literals_to_create_immutables
          const LinearGradient( colors: [
        myGreen,
        Color(0xFF88ECAC),
      ]),
      //backgroundColor: primaryColor,
      logo: Image.asset('assets/images/logo.png'),
      logoSize: 200,
      title: const Text(
        "HKLBooks",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      navigator: const MainScreen(),
      durationInSeconds: 3,
    );
  }
}
