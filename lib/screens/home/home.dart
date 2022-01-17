import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/home/components/banner.dart';
import 'components/list_items.dart';
import 'components/session_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _MycustomState createState() => _MycustomState();
}

class _MycustomState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: myGreen,
          toolbarHeight: 90,
          leading: const Icon(Icons.list, size: 45),
          title: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              hintText: 'Nhập từ khóa tìm kiếm',
              hintStyle: const TextStyle(color: Colors.white),
              fillColor: Colors.white38,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            style: const TextStyle(color: myGrey),
          ),
        ),
        body: ListView(children: [
          const MyBanner(),
          Column(
            children: const [
              SessionTitle(title: "Sách mới nhất"),
              ListItems(),
              SessionTitle(title: "Truyện"),
              ListItems(),
              SessionTitle(title: "Bán chạy nhất"),
              ListItems(),
            ],
          ),
        ]));
  }
}
