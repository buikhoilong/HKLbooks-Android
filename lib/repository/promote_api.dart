import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/promote.dart';

import '../config.dart';
import 'package:http/http.dart' as http;

class PromoteAPI {
  static final instance = PromoteAPI._init();
  PromoteAPI._init();

  Future<List<Book2>> getAllBooksByPromoteId(promoteId) async {
    List<Book2> resultBooksByPromote = [];
    try {
      final response = await http.get(
        Uri.parse(apiURL + 'promote/allBooksByPromoteId/$promoteId'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        resultBooksByPromote =
            (item as List).map((p) => Book2.fromJson(p)).toList();
      }
    } catch (e) {
      rethrow;
    }
    return resultBooksByPromote;
  }

  Future<List<Promote>> getAllPromoteTypes() async {
    List<Promote> resultPromote = [];
    try {
      final response = await http.get(
        Uri.parse(apiURL + 'promote'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        resultPromote = (item as List).map((p) => Promote.fromJson(p)).toList();
      }
    } catch (e) {
      rethrow;
    }
    return resultPromote;
  }
}
