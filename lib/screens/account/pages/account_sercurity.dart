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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Bảo mật tài khoản'),
      backgroundColor: Colors.white,
      body: FutureBuilder<AccountModel>(
        future: DBConfig.instance.getAccount(),
        builder: (context, snapshot) {
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
                child: Text('Bảo Mật Tài Khoản'.toUpperCase(),
                    style: const TextStyle(fontSize: 17)),
              ),
              EditButton(
                icon: 'Lock.svg',
                title: 'Mật khẩu',
                name: snapshot.data!.password.toString(),
                onTaps: () {},
              ),
              EditButton(
                icon: 'phone.svg',
                title: 'Số điện thoại',
                name: snapshot.data!.phone.toString(),
                onTaps: () {},
              ),
              EditButton(
                icon: 'mail.svg',
                title: 'Email',
                name: snapshot.data!.email.toString(),
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
              //   name: snapshot.data!.email.toString(),
              //   OnTap: () {},
              // ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ElevatedButton(
                    onPressed: () async {
                      // print(snapshot.data);
                      if (snapshot.hasData) {
                        await DBConfig.instance.deleteAccount(snapshot.data);
                      }

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
          );
        },
      ),
    );
  }
}
