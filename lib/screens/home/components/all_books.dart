import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/screens/home/components/all_books_list.dart';

import '../test.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);
  @override
  _AllBooksState createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Test(),
      appBar: AppBar(
        backgroundColor: myGreen,
        toolbarHeight: 90,
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
      body: const AllBooksList(),
    );
  }
}
