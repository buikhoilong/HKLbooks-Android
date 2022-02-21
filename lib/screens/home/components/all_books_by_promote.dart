import 'package:flutter/material.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/provider/promoteprovider.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:hkl_books/screens/home/components/book_item.dart';
import 'package:provider/provider.dart';

class AllBooksByPromote extends StatefulWidget {
  const AllBooksByPromote({
    Key? key,
    required this.listBook,
    required this.promote,
  }) : super(key: key);
  final  listBook;
  final Promote promote;
  @override
  State<AllBooksByPromote> createState() => _AllBooksByPromoteState();
}

class _AllBooksByPromoteState extends State<AllBooksByPromote> {
  late Promote _promote;
  late List<Book2> _listBooks;
  @override
  void initState() {
    _promote = widget.promote;
    _listBooks = widget.listBook;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('All Books By Promote ${_promote.id}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _promote.name.toString(),
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            // const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2),
            const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300, childAspectRatio: 0.5),
        itemCount: _listBooks.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Detail(bookModel: _listBooks[index]))),
              child: BookItem(
                book2: _listBooks[index],
              )),
        ),
      ),
    );
  }
}
