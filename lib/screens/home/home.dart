import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 65,
        //padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: myGreen.withOpacity(0.38))
        ]),
        child: BottomNavigationBar(
          selectedItemColor: myGreen,
          selectedIconTheme: const IconThemeData(color: myGreen),
          unselectedIconTheme: const IconThemeData(color: myGrey),
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
      ),
    );
  }
}
