import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/repository/api.dart';

class BookProvider extends ChangeNotifier {
  List<Book2> books = [];
  bool loading = false;

  getProduct(context) async {
    loading = true;
    books = await getAllBook(context);
    loading = false;

    notifyListeners();
  }
}
