import 'package:flutter/material.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/screens/detail/detail.dart';

import 'book_item.dart';

class ListBookItem extends StatelessWidget {
  const ListBookItem({Key? key, required this.listBook}) : super(key: key);
  final List<Book2> listBook;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: listBook.map((item) {
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(bookModel: item))),
                child: BookItem(book2: item));
          }).toList(),
        ),
      ),
    );
  }
}

class ListItemsByPromoteId extends StatefulWidget {
  const ListItemsByPromoteId({
    Key? key,
    required this.listBooks,
  }) : super(key: key);
  final List<Book2> listBooks;
  @override
  State<ListItemsByPromoteId> createState() => _ListItemsByPromoteIdState();
}

class _ListItemsByPromoteIdState extends State<ListItemsByPromoteId> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.listBooks
              .map((item) => InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(bookModel: item))),
                  child: BookItem(book2: item)))
              .toList(),
        ),
      ),
    );
  }
}
