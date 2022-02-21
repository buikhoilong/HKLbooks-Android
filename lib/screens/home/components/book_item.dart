import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';

// ignore: must_be_immutable
class BookItem extends StatelessWidget {
  BookItem({Key? key, required this.book2}) : super(key: key);

  /*
  Book book;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            child: Image.asset(book.imgPath,
                width: 100, height: 150, fit: BoxFit.cover),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.amber),
          ),
          Text(
            book.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            book.author,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ]),
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ));
  }
  */

  Book2 book2;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      width: (size.width - 16) / 2.5,
      // height: (size.width - 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(width: 1, color: myGreen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: (size.width - 16) / 2.5,
            height: (size.width - 16) / 2,
            child: Image.asset(
              'assets/images/${book2.imgPath}',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            // width: size.width,
            padding: const EdgeInsets.only(left: 15),
            child: Text(book2.name,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              book2.author,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              formatMoney.format(book2.price),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
