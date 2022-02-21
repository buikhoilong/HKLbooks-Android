import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/category.dart';
import 'package:hkl_books/provider/categoryprovider.dart';
import 'package:hkl_books/screens/account/account.dart';
import 'package:hkl_books/screens/favorite/favorite.dart';
import 'package:hkl_books/screens/home/components/all_books_list_by_category.dart';
import 'package:hkl_books/screens/home/components/categories_list.dart';
import 'package:hkl_books/screens/login/login.dart';
import 'package:hkl_books/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool show = false;
  late List<Category> categoryList;

  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getCategory(context);
    categoryList =
        Provider.of<CategoryProvider>(context, listen: false).categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 12,
      child: FutureBuilder(
          future: DBConfig.instance.checkLogin(),
          builder: (context, AsyncSnapshot<AccountModel> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                //padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.asset(
                      'assets/images/LogoHKL.png',
                    ),
                  ),
                  UserAccountsDrawerHeader(
                    onDetailsPressed: () => setState(() {
                      show = !show;
                    }),
                    margin:
                        const EdgeInsets.only(bottom: 8, right: 10, left: 10),
                    accountName: Text(snapshot.data!.name.toString()),
                    accountEmail: Text(snapshot.data!.email.toString()),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/${snapshot.data!.avatar.toString()}',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: myGreen,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  if (show) ...[
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Yêu thích'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Favorite())),
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Thông báo'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notify())),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_box_rounded),
                      title: const Text('Tài khoản'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Account())),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Thể loại',
                      style: TextStyle(
                        fontFamily: 'BalihoScript',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CategoriesList(
                    listCategorite: categoryList,
                  ),
                ],
              );
            }
            return ListView(
              children: [
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    'assets/images/LogoHKL.png',
                  ),
                ),
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8, right: 10, left: 10),
                  accountName: const Text(''),
                  accountEmail: ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.white),
                    title: const Text('Đăng nhập'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login())),
                  ),
                  decoration: const BoxDecoration(
                    color: myGreen,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Thể loại',
                    style: TextStyle(
                      fontFamily: 'BalihoScript',
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CategoriesList(
                  listCategorite: categoryList,
                ),
              ],
            );
            // return Column(
            //   //padding: EdgeInsets.zero,
            //   children: [
            //     const UserAccountsDrawerHeader(
            //       accountName: Text(''),
            //       accountEmail: Text(''),
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //         image: AssetImage('assets/images/LogoHKLBooks.jpg'),
            //         fit: BoxFit.cover,
            //       )),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.account_circle, color: myGreen),
            //       title: const Text('Đăng nhập'),
            //       onTap: () => Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const Login())),
            //     ),
            //     const Divider(),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       child: const Text(
            //         'Thể loại',
            //         style: TextStyle(
            //           fontFamily: 'BalihoScript',
            //           fontSize: 30,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(height: 20),
            //     // const CategoriesList(),
            //   ],
            // );
          }),
    );
  }
}
