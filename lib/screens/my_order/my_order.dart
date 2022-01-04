import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/my_order/pages/my_order_cancelled.dart';
import 'pages/my_order_wait_for_pay.dart';
import 'pages/my_order_processing.dart';
import 'pages/my_order_being_transported.dart';
import 'pages/my_order_delivered.dart';
import 'pages/my_order_cancelled.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Đơn Hàng Của Tôi'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: myGreen,
            elevation: 10,
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'Chờ thanh toán'),
                Tab(text: 'Đang xử lý'),
                Tab(text: 'Đang vận chuyển'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              WaitForPay(),
              Processing(),
              BeingTransported(),
              Delivered(),
              Cancelled(),
            ],
          ),
        ),
      );
}
