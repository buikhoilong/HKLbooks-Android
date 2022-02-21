import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/favourite.dart';
import 'package:hkl_books/repository/favorite_api.dart';

class FavouriteProvider extends ChangeNotifier{
  // List<Favourite> favorites = [];
  List<Book2> favoritebooks = [];
  String Message = '';
  bool isFavorite = false;
  bool loading = false;

    getAllBooks(accountid) async {
    loading = true;
    favoritebooks = await getAllFavBooksByAccountId(accountid);
    loading = false;
    notifyListeners();
  }

  addFav(accountid, bookid) async {
    loading = true;
    Message = await addFav(accountid, bookid);
    loading = false;
    notifyListeners();
  }

  checkFavavorite(accountid, bookid) async {
    loading = true;
    isFavorite = await checkFav(accountid, bookid);
    print(isFavorite);
    loading = false;
    notifyListeners();
  }

}