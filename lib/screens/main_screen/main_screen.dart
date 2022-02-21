import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/screens/favorite/favorite.dart';
import 'package:hkl_books/screens/login/login.dart';
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

    return FutureBuilder(
        future: DBConfig.instance.checkLogin(),
        builder: (context, AsyncSnapshot<AccountModel> snapshot) {
          // print(snapshot.data == null);
          if (snapshot.hasData) {
            listScreen.add(const Cart());

            listScreen.add(const Favorite());
            listScreen.add(const Account());
          } else {
            listScreen.add(const Login());
            listScreen.add(const Login());
            listScreen.add(const Login());
          }

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
                  showUnselectedLabels: true,
                  selectedItemColor: myGreen,
                  unselectedItemColor: Colors.black,
                  onTap: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                  currentIndex: pageIndex,
                  items: [
                    BottomNavigationBarItem(
                        icon:
                            SvgPicture.asset("assets/icons/warehouse-grey.svg"),
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
                        icon: SvgPicture.asset("assets/icons/heart.svg"),
                        label: "Yêu thích",
                        activeIcon: SvgPicture.asset(
                          "assets/icons/heart.svg",
                          color: myGreen,
                        )),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/account-grey.svg"),
                        label: "Tài khoản",
                        activeIcon: SvgPicture.asset(
                          "assets/icons/account-grey.svg",
                          color: myGreen,
                        )),
                  ],
                ),
              ));
        });
  }
}
