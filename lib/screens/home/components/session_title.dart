import 'package:flutter/material.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/screens/home/components/all_books_by_promote.dart';

class SessionTitle extends StatelessWidget {
  const SessionTitle({
    Key? key,
    required this.promote,
    required this.listBook,
  }) : super(key: key);

  final Promote promote;
  // ignore: prefer_typing_uninitialized_variables
  final listBook;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            promote.name.toString().toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllBooksByPromote(
                          promote: promote,
                          listBook: listBook,
                        ))),
            child: const Text("XEM TẤT CẢ"),
          )
        ],
      ),
    );
  }
}
