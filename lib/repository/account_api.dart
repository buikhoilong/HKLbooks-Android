import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:http/http.dart' as http;

Future<AccountModel> getAccountById(id) async {
  AccountModel resultAccount = AccountModel();
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'account/$id'),
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

Future<AccountModel> updateAccount(id, key, value) async {
  AccountModel resultAccount = AccountModel();
  Map<String, dynamic> row = {
    'Id': '$id',
    '$key': '$value',
    'Type': '$key',
  };
  // print(row);
  try {
    final response = await http.post(Uri.parse(apiURL + 'account/update'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(row));
    print('sttCode: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print('API: ' + item.toString());
      resultAccount = AccountModel.fromJson(item);
    } else {
      resultAccount.status = response.statusCode;
    }
  } catch (e) {
    rethrow;
  }

  return resultAccount;
}
