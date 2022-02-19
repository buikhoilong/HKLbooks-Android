import 'package:flutter/material.dart';
import 'package:hkl_books/screens/home/components/all_books.dart';
import 'package:hkl_books/screens/home/components/all_books_list.dart';
import 'package:hkl_books/screens/home/components/all_books_list_by_promote.dart';
import 'package:hkl_books/screens/home/components/list_items_by_promote.dart';

class SessionTitle extends StatelessWidget {
  const SessionTitle({
    Key? key,
    required this.title,
    required this.promoteId,
  }) : super(key: key);
  final String title;
  final String promoteId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllBooksListByPromote(
                          promoteId: promoteId,
                          promoteName: title,
                        ))),
            child: const Text("XEM TẤT CẢ"),
          )
        ],
      ),
    );
  }
}
