import 'package:flutter/material.dart';
import 'package:hkl_books/models/book.dart';
import 'package:hkl_books/screens/detail/detail.dart';

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
              .map((item) => InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail())),child: BookItem(book: item)))
              .toList(),
        ),
      ),
    );
  }
}