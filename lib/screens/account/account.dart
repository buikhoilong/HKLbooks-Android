import 'package:flutter/material.dart';
import 'package:hkl_books/screens/favorite/favorite.dart';
import 'package:hkl_books/screens/my_order/my_order.dart';

import 'components/function_button.dart';
import 'components/infomation.dart';
import 'pages/account_detail.dart';
import 'pages/account_sercurity.dart';
import 'pages/setting.dart';
import 'pages/transaction_history.dart';

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
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Column(
                children: const [
                  FunctionButton(
                      name: 'Quản lý thông tin cá nhân',
                      icon: 'user.svg',
                      navigateTo: AccountDetail()),
                  FunctionButton(
                      name: 'Bảo mật tài khoản',
                      icon: 'Lock.svg',
                      navigateTo: AccountSercurity()),
                  FunctionButton(
                      name: 'Danh sách yêu thích',
                      icon: 'heart.svg',
                      navigateTo: Favorite()),
                  FunctionButton(
                      name: 'Đơn hàng của tôi',
                      icon: 'order.svg',
                      navigateTo: MyOrder()),
                  FunctionButton(
                      name: 'Lịch sử giao dịch',
                      icon: 'clock.svg',
                      navigateTo: TransactionHistory()),
                  FunctionButton(
                      name: 'Cài đặt',
                      icon: 'setting.svg',
                      navigateTo: Setting()),
                ],
              ),
            ),
          ],
        ));
  }
}
