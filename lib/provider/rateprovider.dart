import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/rate.dart';
import 'package:hkl_books/repository/rate_api.dart';

class RateProvider extends ChangeNotifier {
  List<Rate> rates = [];
  bool loading = false;
  int allStar = 0;

   getRatesByBookId(bookid) async {
    loading = true;
    rates = await getAllRateByBookId(bookid);
    allStar=0;
    rates.forEach((element) {allStar+=element.star;});
    loading = false;
    notifyListeners();
  }
}
