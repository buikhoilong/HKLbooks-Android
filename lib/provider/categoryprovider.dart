import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/category.dart';
import 'package:hkl_books/repository/api.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  bool loading = false;

  getCategory(context) async {
    loading = true;
    categories = await getAllCategory(context);
    loading = false;
    notifyListeners();
  }
}
