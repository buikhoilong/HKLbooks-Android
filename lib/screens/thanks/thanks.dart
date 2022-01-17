import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';

class Thanks extends StatefulWidget {
  const Thanks({Key? key}) : super(key: key);

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
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
        "Mua hàng thành công! \n Cảm ơn bạn đã mua hàng.",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: "BalihoScript",
          fontSize: 30,
          height: 1.5,
          color: Colors.white,
          wordSpacing: 6,
        ),
        textAlign: TextAlign.center,
      ),
      showLoader: true,
      loadingText: const Text(
        "Đang trở về kho sách!!!",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: "BalihoScript",
          fontSize: 30,
          height: 1.5,
          color: Colors.white,
          wordSpacing: 6,
        ),
      ),
      navigator: const MainScreen(),
      durationInSeconds: 5,
    );
  }
}
