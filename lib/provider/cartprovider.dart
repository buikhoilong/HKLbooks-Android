// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/cart.dart';
import 'package:hkl_books/repository/cart_api.dart';
import 'package:hkl_books/screens/detail/detail.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> carts = [];
  List<Book2> books = [];
  int total = 0;
  bool loading = false;
  int respondCode = 0;

  // ignore: non_constant_identifier_names
  getCarts(AccountId) async {
    loading = true;
    carts = await getAllCarts(AccountId);
    books = await getAllBooksByAccountId(AccountId);
    total = 0;
    for (var i = 0; i < carts.length; i++) {
      total += books[i].price * (carts[i].quantity as int);
    }
    loading = false;
    notifyListeners();
  }

  getTotal() {
    loading = true;
    for (var i = 0; i < carts.length; i++) {
      total += books[i].price * (carts[i].quantity as int);
    }
    loading = false;
    notifyListeners();
  }

  addToCart(AccountId, BookId) async {
    loading = true;
    respondCode = await addToCartApp(AccountId, BookId);
    print(respondCode);
    loading = false;
    // notifyListeners();
  }
}
