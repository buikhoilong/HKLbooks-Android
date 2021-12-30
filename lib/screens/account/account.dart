import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';

import 'components/infomation.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const Infomation(),
            
          ],
        ));
  }
}


