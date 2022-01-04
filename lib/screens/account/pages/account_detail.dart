import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'components/edit_button.dart';



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
      appBar: AppBar(
        title: const Text('Trang cá nhân'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(children: [
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
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/avatar.jpg'))),
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
        const EditButton(icon: 'user.svg', name: 'Đỗ Quang Huy'),
        const EditButton(icon: 'phone.svg', name: '0356251***'),
        const EditButton(icon: 'date.svg', name: '11/11/1995'),
      ]),
    );
  }
}


