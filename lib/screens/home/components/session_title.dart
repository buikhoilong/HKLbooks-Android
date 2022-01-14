import 'package:flutter/material.dart';
import 'package:hkl_books/screens/home/components/all_books.dart';

class SessionTitle extends StatelessWidget {
  const SessionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
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
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AllBooks())),
            child: const Text("XEM TẤT CẢ"),
          )
        ],
      ),
    );
  }
}
