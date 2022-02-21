import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/category.dart';
import 'package:http/http.dart' as http;

Future<List<Book2>> getAllBooksByCategory(categoryId) async {
  List<Book2> resultBooksByCategory = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'category/getAllBooksByCategoryId/$categoryId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultBooksByCategory =
          (item as List).map((p) => Book2.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultBooksByCategory;
}

Future<List<Category>> getAllCategory(context) async {
  List<Category> resultCategory = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'category'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultCategory = (item as List).map((p) => Category.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultCategory;
}
