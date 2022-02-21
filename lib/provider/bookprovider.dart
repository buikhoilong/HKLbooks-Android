import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/repository/favorite_api.dart';
import 'package:hkl_books/repository/book_api.dart';
import 'package:hkl_books/repository/category_api.dart';

class BookProvider extends ChangeNotifier {
  List<Book2> books = [];

  bool loading = false;

  getProduct(context) async {
    loading = true;
    books = await getAllBook(context);
    loading = false;

    notifyListeners();
  }

  getBooksByCategoryId(categoryId) async {
    loading = true;
    books = await getAllBooksByCategory(categoryId);
    loading = false;
    notifyListeners();
  }
}
