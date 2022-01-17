import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:http/http.dart' as http;

String baseURL = 'http://10.0.2.2:8000/api/';

Future<List<Book2>> getAllBook(context) async {
  List<Book2> resultBook = [];
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'book'),
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

Future<AccountModel> getAccountByEmail(email, password) async {
  //List<AccountModel> kq = [];
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'account/$email&$password'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultAccount = AccountModel.fromJson(item);
    } else {
      resultAccount.status = response.statusCode;
    }
  } catch (e) {
    rethrow;
  }

  return resultAccount;
}

Future<AccountModel> login(email, password) async {
  AccountModel resultAccount = AccountModel();
  try {
    final response =
        await http.post(Uri.parse(baseURL + 'account/login'), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    }, body: {
      'Email': email,
      'Password': password
    });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultAccount = AccountModel.fromJson(item);
    } else if (response.statusCode == 400) {
      final item = json.decode(response.body);

      resultAccount = AccountModel.fromJson(item);
      resultAccount.status = response.statusCode;
    } else {
      resultAccount.status = response.statusCode;
    }
  } catch (e) {
    rethrow;
  }

  return resultAccount;
}
