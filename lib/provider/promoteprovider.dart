import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:hkl_books/repository/api.dart';

class PromoteProvider extends ChangeNotifier {
  List<Promote> promotes = [];
  bool loading = false;

  getPromote(context) async {
    loading = true;
    promotes = await getAllPromoteTypes(context);
    loading = false;
    notifyListeners();
  }
}
