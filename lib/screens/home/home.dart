import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/provider/promoteprovider.dart';
import 'package:hkl_books/repository/promote_api.dart';
import 'package:hkl_books/screens/home/components/banner.dart';
import 'package:hkl_books/screens/home/components/sidebar.dart';
import 'package:provider/provider.dart';
import 'components/list_items_by_promote.dart';
import 'components/session_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _MycustomState createState() => _MycustomState();
}

class _MycustomState extends State<Home> {
  List<Promote> listPromotes = [];
  Map<String, List<Book2>> booksByAllPromoteTypes = {};
  List<Book2> listBooks = [];
  @override
  void initState() {
    super.initState();
    final promotesMdl = Provider.of<PromoteProvider>(context, listen: false);
    promotesMdl.getPromote(context);
    listPromotes = promotesMdl.promotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideBar(),
      appBar: AppBar(
        backgroundColor: myGreen,
        toolbarHeight: 90,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
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
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const MyBanner(),
          // Column(
          //   children: [
          //     SessionTitle(
          //       promote: listPromotes[0],
          //       listBook: listBooks,
          //     ),
          //     ListBookItem(listBook: listBooks),
          //   ],
          // ),

          ...listPromotes.map<Widget>((item) {
            return FutureBuilder(
              future: PromoteAPI.instance.getAllBooksByPromoteId(item.id),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    SessionTitle(
                      promote: item,
                      listBook: snapshot.data,
                    ),
                    if (snapshot.hasData) ...[
                      ListBookItem(listBook: snapshot.data as List<Book2>)
                    ] else
                      ...[],
                  ],
                );
              },
            );
          }).toList(),

          // Column(
          //   children: [
          //     SessionTitle(
          //       promote: listPromotes[0],
          //       listBook: listBooks,
          //     ),
          //     ListBookItem(listBook: listBooks),
          //   ],
          // )
        ],
      ),
    );
  }
}
