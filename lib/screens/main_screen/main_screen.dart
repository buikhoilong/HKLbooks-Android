import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/screens/home/home.dart';
import '../../config.dart';
import 'components/bottom_tab_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> listScreen = [];
    listScreen.add(const Home());
    //listScreen.add(const Cart());
    return Scaffold(
      backgroundColor: Colors.white,
      body: listScreen[pageIndex],
      bottomNavigationBar: const BottomTabBar(),
    );
  }
}
