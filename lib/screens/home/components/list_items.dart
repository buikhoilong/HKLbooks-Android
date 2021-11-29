import 'package:flutter/material.dart';
import 'package:hkl_books/models/book.dart';

import 'book_item.dart';
class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: books
              .map((item) => BookItem(book: item))
              .toList(),
        ),
      ),
    );
  }
}