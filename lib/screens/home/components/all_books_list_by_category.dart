import 'package:flutter/material.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:provider/provider.dart';

import 'book_item.dart';

class AllBooksListByCategory extends StatefulWidget {
  const AllBooksListByCategory({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);
  final String categoryId, categoryName;
  @override
  State<AllBooksListByCategory> createState() => _AllBooksListByCategoryState();
}

class _AllBooksListByCategoryState extends State<AllBooksListByCategory> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getBooksByCategoryId(widget.categoryId);
  }

  late Book2 book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categoryName),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Consumer<BookProvider>(builder: (context, data, child) {
          return GridView.builder(
            gridDelegate:
                // const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2),
                const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300, childAspectRatio: 0.5),
            itemCount: data.books.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detail(bookModel: data.books[index]))),
                  child: BookItem(
                    book2: data.books[index],
                  )),
            ),
          );
        }),
      ),
    );
  }
}
