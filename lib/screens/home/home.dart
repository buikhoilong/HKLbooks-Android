import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/provider/promoteprovider.dart';
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
  @override
  void initState() {
    super.initState();
    final promotesMdl = Provider.of<PromoteProvider>(context, listen: false);
    promotesMdl.getPromote(context);
  }

  late Promote promote;

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
      body: Column(
        children: [
          const SizedBox(height: 20),
          const MyBanner(),
          Consumer<PromoteProvider>(builder: (context, data, child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: data.promotes.length,
                  itemBuilder: (context, index) {
                    if (data.promotes[index].status == 1) {
                      return Column(
                        children: [
                          SessionTitle(
                            title: data.promotes[index].name.toString(),
                            promoteId: data.promotes[index].id.toString(),
                          ),
                          ListItemsByPromoteId(
                              PromoteId: data.promotes[index].id.toString()),
                        ],
                      );
                    }
                    return Container();
                  }),
            );
          }),
        ],
      ),
    );
  }
}
