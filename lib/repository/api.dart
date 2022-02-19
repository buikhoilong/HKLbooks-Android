import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/category.dart';
import 'package:hkl_books/models/promote.dart';
import 'package:http/http.dart' as http;

// String baseURL = 'http://10.0.2.2:8000/api/';

Future<List<Book2>> getAllBook(context) async {
  List<Book2> resultBook = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'book'),
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

Future<List<Book2>> getAllBooksByPromoteId(context, promoteId) async {
  List<Book2> resultBooksByPromote = [];
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'promote/allBooksByPromoteId/$promoteId'),
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

Future<List<Book2>> getAllBooksByCategory(categoryId) async {
  List<Book2> resultBooksByCategory = [];
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'category/getAllBooksByCategoryId/$categoryId'),
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

Future<AccountModel> getAccountByEmail(email, password) async {
  //List<AccountModel> kq = [];
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'account/$email&$password'),
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

Future<List<Promote>> getAllPromoteTypes(context) async {
  List<Promote> resultPromote = [];
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'promote'),
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

Future<List<Category>> getAllCategory(context) async {
  List<Category> resultCategory = [];
  try {
    final response = await http.get(
      Uri.parse(baseURL + 'category'),
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

Future<AccountModel> loginApp(email, password) async {
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.post(Uri.parse(apiURL + 'account/login'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body:
            jsonEncode(<String, String>{'Email': email, 'Password': password}));

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

Future<AccountModel> registerApp(name, email, phone, password, address) async {
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.post(Uri.parse(apiURL + 'account/register'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(<String, String>{
          'Name': name,
          'Email': email,
          'Phone': phone,
          'Password': password,
          'Address': address
        }));

    resultAccount.status = response.statusCode;
  } catch (e) {
    rethrow;
  }

  return resultAccount;
}

Future<AccountModel> updateAccount(id, value, type) async {
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.post(Uri.parse(apiURL + 'account/register'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(<String, String>{
          'Id': id,
          '$type': value,
        }));
    if(response.statusCode == 200){
      final item = json.decode(response.body);
      resultAccount = AccountModel.fromJson(item);
    }else{
      resultAccount.status = response.statusCode;
    }
    
  } catch (e) {
    rethrow;
  }

  return resultAccount;
}
