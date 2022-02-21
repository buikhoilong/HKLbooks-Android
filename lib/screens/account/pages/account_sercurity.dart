import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';
import 'components/edit_button.dart';
import 'components/my_app_bar.dart';

class AccountSercurity extends StatefulWidget {
  const AccountSercurity({Key? key}) : super(key: key);

  @override
  _AccountSercurityState createState() => _AccountSercurityState();
}

class _AccountSercurityState extends State<AccountSercurity> {
  AccountModel acc = AccountModel();
  @override
  void initState() {
    DBConfig.instance.getAccount();
    acc = DBConfig.instance.account;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context, 'Bảo mật tài khoản'),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
              child: Text('Bảo Mật Tài Khoản'.toUpperCase(),
                  style: const TextStyle(fontSize: 17)),
            ),
            EditButton(
              icon: 'Lock.svg',
              title: 'Mật khẩu',
              name: '********',
              onTaps: () {},
            ),
            EditButton(
              icon: 'phone.svg',
              title: 'Số điện thoại',
              name: acc.phone.toString(),
              onTaps: () {},
            ),
            EditButton(
              icon: 'mail.svg',
              title: 'Email',
              name: acc.email.toString(),
              onTaps: () {},
            ),
            // Container(
            //   padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
            //   child: Text('Kết Nối Tài Khoản'.toUpperCase(),
            //       style: const TextStyle(fontSize: 17)),
            // ),
            // EditButton(
            //   icon: 'Facebook.svg',
            //   title: 'Thay đổi tài khoản Facebook',
            //   name: '******anghuy1234',
            //   OnTap: () {},
            // ),
            // EditButton(
            //   icon: 'Google.svg',
            //   title: 'Thay đổi tài khoản Google',
            //   name: acc.email.toString(),
            //   OnTap: () {},
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ElevatedButton(
                  onPressed: () async {
                    // print(snapshot.data);
                    await DBConfig.instance.deleteAccount(acc);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: myRed,
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset('assets/icons/sign-out.svg'),
                    title: const Text(
                      'Đăng Xuất',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ));
  }
}
