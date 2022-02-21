import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/repository/promote_api.dart';

class PromoteProvider extends ChangeNotifier {
  List<Promote> promotes = [];
  List<Book2> books = [];
  bool loading = false;

  getPromote(context) async {
    loading = true;
    promotes = await PromoteAPI.instance.getAllPromoteTypes();
    loading = false;
    notifyListeners();
  }

  getBooksByPromoteId(promoteId) async {
    loading = true;
    books = await  PromoteAPI.instance.getAllBooksByPromoteId(promoteId);
    loading = false;
    notifyListeners();
  }
}
