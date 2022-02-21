import 'dart:convert';
import 'dart:io';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/rate.dart';
import 'package:http/http.dart' as http;

Future<List<Rate>> getAllRateByBookId(bookid) async {
  List<Rate> resultRate = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'rates/getAllRateByBookId/$bookid'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultRate =
          (item as List).map((p) => Rate.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultRate;
}