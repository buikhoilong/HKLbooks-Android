import 'package:flutter/material.dart';
import 'package:hkl_books/models/book.dart';

// ignore: must_be_immutable
class BookItem extends StatelessWidget {
  BookItem({Key? key, required this.book}) : super(key: key);
  
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
}