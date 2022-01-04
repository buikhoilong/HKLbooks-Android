import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/models/book2.dart';
import 'package:http/http.dart' as http;

Future<List<Book2>> getAllBook(context) async {
  List<Book2> resultBook = [];
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/book'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      resultBook = (item as List).map((p) => Book2.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultBook;
}
