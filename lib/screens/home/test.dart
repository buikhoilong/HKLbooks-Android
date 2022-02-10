// import 'package:flutter/material.dart';
// import 'package:hkl_books/DB/dbconfig.dart';
// import 'package:hkl_books/models/account.dart';
// import 'package:hkl_books/provider/categoryprovider.dart';
// import 'package:hkl_books/screens/account/account.dart';
// import 'package:hkl_books/screens/favorite/favorite.dart';
// import 'package:hkl_books/screens/home/components/all_books_list_by_category.dart';
// import 'package:hkl_books/screens/login/login.dart';
// import 'package:hkl_books/screens/notification/notification.dart';
// import 'package:provider/provider.dart';

// import '../../../config.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   void initState() {
//     super.initState();
//     final booksMdl = Provider.of<CategoryProvider>(context, listen: false);
//     booksMdl.getCategory(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Consumer<CategoryProvider>(builder: (context, data, child) {
//       return ListView.builder(
//           itemCount: data.categories.length,
//           itemBuilder: (context, index) {
//             return FutureBuilder(
//               future: DBConfig.instance.getAccount(),
//               builder: (context, AsyncSnapshot<AccountModel> snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView(
//                     padding: EdgeInsets.zero,
//                     children: [
//                       UserAccountsDrawerHeader(
//                         accountName: Text(snapshot.data!.name.toString()),
//                         accountEmail: Text(snapshot.data!.email.toString()),
//                         currentAccountPicture: CircleAvatar(
//                           child: ClipOval(
//                             child: Image.asset(
//                               'assets/images/${snapshot.data!.avatar.toString()}',
//                               width: 90,
//                               height: 90,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         decoration: const BoxDecoration(
//                             image: DecorationImage(
//                           image: AssetImage('assets/images/LogoHKLBooks.jpg'),
//                           fit: BoxFit.cover,
//                         )),
//                       ),
//                       ListTile(
//                         leading: const Icon(Icons.favorite),
//                         title: const Text('Yêu thích'),
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Favorite())),
//                       ),
//                       ListTile(
//                         leading: const Icon(Icons.notifications),
//                         title: const Text('Thông báo'),
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Notify())),
//                       ),
//                       ListTile(
//                         leading: const Icon(Icons.settings),
//                         title: const Text('Cài đặt'),
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Account())),
//                       ),
//                       const Divider(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: const Text(
//                           'Thể loại',
//                           style: TextStyle(
//                             fontFamily: 'BalihoScript',
//                             fontSize: 30,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const AllBooksListByCategory())),
//                         child: Text(
//                           data.categories[index].name.toString(),
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                       )
//                     ],
//                   );
//                 } else {
//                   return ListView(
//                     padding: EdgeInsets.zero,
//                     children: [
//                       const UserAccountsDrawerHeader(
//                         accountName: Text(''),
//                         accountEmail: Text(''),
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                           image: AssetImage('assets/images/LogoHKLBooks.jpg'),
//                           fit: BoxFit.cover,
//                         )),
//                       ),
//                       ListTile(
//                         leading:
//                             const Icon(Icons.account_circle, color: myGreen),
//                         title: const Text('Đăng nhập'),
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Login())),
//                       ),
//                       const Divider(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: const Text(
//                           'Thể loại',
//                           style: TextStyle(
//                             fontFamily: 'BalihoScript',
//                             fontSize: 30,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const AllBooksListByCategory())),
//                         child: Text(
//                           data.categories[index].name.toString(),
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                       )
//                     ],
//                   );
//                 }
//               },
//             );
//           });
//     }));
//   }
// }

import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/provider/categoryprovider.dart';
import 'package:hkl_books/screens/account/account.dart';
import 'package:hkl_books/screens/favorite/favorite.dart';
import 'package:hkl_books/screens/home/components/all_books.dart';
import 'package:hkl_books/screens/home/components/all_books_list_by_category.dart';
import 'package:hkl_books/screens/home/components/categories_list.dart';
import 'package:hkl_books/screens/login/login.dart';
import 'package:hkl_books/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<CategoryProvider>(context, listen: false);
    booksMdl.getCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        // const UserAccountsDrawerHeader(
        //   accountName: Text(''),
        //   accountEmail: Text(''),
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //     image: AssetImage('assets/images/LogoHKLBooks.jpg'),
        //     fit: BoxFit.cover,
        //   )),
        // ),
        // ListTile(
        //   leading: const Icon(Icons.account_circle, color: myGreen),
        //   title: const Text('Đăng nhập'),
        //   onTap: () => Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => const Login())),
        // ),
        // const Divider(),
        // const SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   alignment: Alignment.center,
        //   child: const Text(
        //     'Thể loại',
        //     style: TextStyle(
        //       fontFamily: 'BalihoScript',
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 20),
        CategoriesList(),
        Consumer<CategoryProvider>(builder: (context, data, child) {
          return Expanded(
            child: ListView.builder(
              itemCount: data.categories.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AllBooksListByCategory())),
                  child: Text(
                    data.categories[index].name.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          );
        }),
      ],
    ));
  }
}
