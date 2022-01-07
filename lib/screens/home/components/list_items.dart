import 'package:flutter/material.dart';
import 'package:hkl_books/models/book.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/repository/api.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:provider/provider.dart';

import 'book_item.dart';

class ListItems extends StatefulWidget {
  const ListItems({
    Key? key,
  }) : super(key: key);

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<BookProvider>(builder: (context, data, child) {
          return Row(
            children: data.books
                .map((item) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Detail())),
                    child: BookItem(book2: item)))
                .toList(),
          );
        }),
      ),
    );
  }
}
