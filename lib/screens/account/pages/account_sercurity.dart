import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/provider/accountprovider.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'components/edit_button.dart';
import 'components/my_app_bar.dart';

class AccountSercurity extends StatefulWidget {
  const AccountSercurity({Key? key}) : super(key: key);

  @override
  _AccountSercurityState createState() => _AccountSercurityState();
}

class _AccountSercurityState extends State<AccountSercurity> {
  ShowDialog(context, text) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  letterSpacing: 0.5,
                )),
            actions: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Đóng'))
                  ],
                ),
              ),
            ],
          );
        });
  }

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
              const EditButton(
                  icon: 'Lock.svg', title: 'Mật khẩu', name: '**********'),
              const EditButton(
                  icon: 'CMND.svg',
                  title: 'Chứng minh thư',
                  name: '3092******'),
              EditButton(
                  icon: 'mail.svg',
                  title: 'Email',
                  name: snapshot.data!.email.toString()),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
                child: Text('Kết Nối Tài Khoản'.toUpperCase(),
                    style: const TextStyle(fontSize: 17)),
              ),
              const EditButton(
                  icon: 'Facebook.svg',
                  title: 'Thay đổi tài khoản Facebook',
                  name: '******anghuy1234'),
              const EditButton(
                  icon: 'Google.svg',
                  title: 'Thay đổi tài khoản Google',
                  name: '*******442@caothang.edu.vn'),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ElevatedButton(
                    onPressed: () async {
                      print(snapshot.data);
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
