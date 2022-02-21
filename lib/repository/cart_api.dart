import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/cart.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
Future<List<Cart>> getAllCarts(AccoutnId) async {
  List<Cart> carts = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'cart/$AccoutnId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      carts = (item as List).map((p) => Cart.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return carts;
}

Future<List<Book2>> getAllBooksByAccountId(AccoutnId) async {
  List<Book2> books = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'cart/getBooks/$AccoutnId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      books = (item as List).map((p) => Book2.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return books;
}

addToCartApp(AccountId, BookId) async {
  try {
    final response = await http.post(Uri.parse(apiURL + 'cart/addToCart'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(<String, String>{
          'AccountId': AccountId,
          'BookId': BookId,
          'Quantity': '1',
        }));
    print(response.statusCode);
    return response.statusCode;
  } catch (e) {
    rethrow;
  }
}
