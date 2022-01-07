import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/config.dart';
import 'components/edit_button.dart';
import 'components/my_app_bar.dart';

class AccountSercurity extends StatefulWidget {
  const AccountSercurity({Key? key}) : super(key: key);

  @override
  _AccountSercurityState createState() => _AccountSercurityState();
}

class _AccountSercurityState extends State<AccountSercurity> {
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
          const EditButton(icon: 'Lock.svg', name: '**********'),
          const EditButton(icon: 'CMND.svg', name: '3092******'),
          const EditButton(
              icon: 'mail.svg', name: '*******442@caothang.edu.vn'),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
            child: Text('Kết Nối Tài Khoản'.toUpperCase(),
                style: const TextStyle(fontSize: 17)),
          ),
          const EditButton(icon: 'Facebook.svg', name: '******anghuy1234'),
          const EditButton(
              icon: 'Google.svg', name: '*******442@caothang.edu.vn'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ElevatedButton(
                onPressed: () {},
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
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SvgPicture.asset('assets/icons/sign-out.svg'),
                //     const SizedBox(width: 10),
                //     const Text(
                //       'Đăng Xuất',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ],
                // )
                ),
          )
        ],
      ),
    );
  }
}
