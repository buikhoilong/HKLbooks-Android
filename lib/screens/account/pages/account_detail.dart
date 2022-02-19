import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'components/edit_button.dart';
import 'components/my_app_bar.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(context, 'Trang cá nhân'),
      body: FutureBuilder<AccountModel>(
        future: DBConfig.instance.getAccount(),
        builder: (context, snapshot) {
          return ListView(children: [
            Container(
              decoration: const BoxDecoration(
                  color: myGreen,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${snapshot.data!.avatar.toString()}'))),
                      child: Stack(children: [
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: const Icon(Icons.camera_alt,
                                    color: myGrey, size: 25))),
                      ]),
                    ),
                  ),
                  const Text('Ảnh đại diện',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            EditButton(
              icon: 'user.svg',
              title: 'Họ tên',
              name: snapshot.data!.name.toString(),
              onTaps: () {},
            ),
            
            EditButton(
              icon: 'date.svg',
              title: 'Sinh nhật',
              name: snapshot.data!.birthday.toString(),
              onTaps: () {},
            ),
            EditButton(
              icon: 'location.svg',
              title: 'Địa chỉ',
              name: snapshot.data!.address.toString(),
              onTaps: () {},
            ),
          ]);
        },
      ),
    );
  }
}