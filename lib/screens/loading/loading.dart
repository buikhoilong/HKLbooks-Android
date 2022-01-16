import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';
import 'package:hkl_books/screens/welcome/welcome.dart';

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
          const LinearGradient(colors: [
        myGreen,
        Color(0xFF88ECAC),
      ]),
      //backgroundColor: primaryColor,
      logo: Image.asset('assets/images/logo.png'),
      logoSize: 200,
      title: const Text(
        "HKLBooks",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: "Dancing Script",
          fontSize: 40,
          height: 1.5,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          wordSpacing: 6,
        ),
      ),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: "Dancing Script",
          fontSize: 30,
          height: 1.5,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          wordSpacing: 6,
        ),
      ),
      navigator: FutureBuilder(
        future: DBConfig.instance.getAccount(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          }
          return const Welcome();
        },
      ),
      durationInSeconds: 3,
    );
  }
}
