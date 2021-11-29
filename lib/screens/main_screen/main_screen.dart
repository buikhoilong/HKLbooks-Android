import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../account/account.dart';
import '../cart/cart.dart';
import '../home/home.dart';
import 'package:hkl_books/config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> listScreen = [];
    listScreen.add(const Home());
    listScreen.add(const Cart());
    listScreen.add(const Account());
    return Scaffold(
        backgroundColor: Colors.white,
        body: listScreen[pageIndex],
        bottomNavigationBar: Container(
          height: 65,
          //padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: const Offset(0, -10),
                blurRadius: 35,
                color: myGreen.withOpacity(0.38))
          ]),
          child: BottomNavigationBar(
            selectedItemColor: myGreen,
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/warehouse-grey.svg"),
                  label: "Kho sách",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/warehouse-grey.svg",
                    color: myGreen,
                  )),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/cart.svg"),
                  label: "Giỏ hàng",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: myGreen,
                  )),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/account-grey.svg"),
                  label: "Tài khoản",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/account-grey.svg",
                    color: myGreen,
                  ))
            ],
          ),
        ));
  }
}
