import 'package:flutter/material.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:hkl_books/screens/detail/detail.dart';
import 'package:hkl_books/screens/home/components/book_item.dart';
import 'package:provider/provider.dart';

class AllBooksListByPromote extends StatefulWidget {
  const AllBooksListByPromote({
    Key? key,
    required this.promoteId,
    required this.promoteName,
  }) : super(key: key);
  final String promoteId;
  final String promoteName;
  @override
  State<AllBooksListByPromote> createState() => _AllBooksListByPromoteState();
}

class _AllBooksListByPromoteState extends State<AllBooksListByPromote> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getBooksByPromoteId(context, widget.promoteId);
  }

  late Book2 book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.promoteName,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<BookProvider>(builder: (context, data, child) {
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
    );
  }
}
