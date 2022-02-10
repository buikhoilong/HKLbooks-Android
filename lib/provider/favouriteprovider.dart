import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/favourite.dart';
import 'package:hkl_books/repository/api.dart';

class FavouriteProvider extends ChangeNotifier{
  List<Favourite> favorites = [];
  bool loading = false;

    getFavorite(context) async {
    loading = true;
    favorites = await getAllFavouritesBooksByAccountId(context);
    loading = false;
    notifyListeners();
  }
    getAllBooksByBookId(context, bookId) async {
    loading = true;
    favorites = await getAllBooksByBookId(context, bookId);
    loading = false;
    notifyListeners();
  }

}