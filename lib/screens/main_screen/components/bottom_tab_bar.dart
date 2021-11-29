import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;
  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        selectedIconTheme: const IconThemeData(color: myGreen),
        unselectedIconTheme: const IconThemeData(color: myGrey),
        onTap: (value) {
          setState(() {
            //pageIndex = value;
          });
        },
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
    );
  }
}
