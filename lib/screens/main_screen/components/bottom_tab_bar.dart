import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    Key? key,
  }) : super(key: key);

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