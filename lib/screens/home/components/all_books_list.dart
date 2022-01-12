import 'package:flutter/material.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:provider/provider.dart';

class AllBooksList extends StatefulWidget {
  const AllBooksList({
    Key? key,
  }) : super(key: key);

  @override
  State<AllBooksList> createState() => _AllBooksListState();
}

class _AllBooksListState extends State<AllBooksList> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getProduct(context);
  }

  late Book2 book;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Consumer<BookProvider>(builder: (context, data, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: data.books.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Detail())),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  child: Image.asset(
                      'assets/images/${data.books[index].imgPath}',
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.amber),
                ),
                Text(
                  data.books[index].name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  data.books[index].author,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }),
    );
  }
}
