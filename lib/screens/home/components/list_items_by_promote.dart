import 'package:flutter/material.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:provider/provider.dart';

import 'book_item.dart';

class ListItemsByPromoteId extends StatefulWidget {
  const ListItemsByPromoteId({
    Key? key,
    required this.PromoteId,
  }) : super(key: key);
  final String PromoteId;
  @override
  State<ListItemsByPromoteId> createState() => _ListItemsByPromoteIdState();
}

class _ListItemsByPromoteIdState extends State<ListItemsByPromoteId> {
  @override
  void initState() {
    super.initState();
    final booksbypromoteMdl = Provider.of<BookProvider>(context, listen: false);
    booksbypromoteMdl.getBooksByPromoteId(context, widget.PromoteId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<BookProvider>(builder: (context, data, child) {
          return Row(
            children: data.books
                .map((item) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(bookModel: item))),
                    child: BookItem(book2: item)))
                .toList(),
          );
        }),
      ),
    );
  }
}
