import 'package:flutter/cupertino.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/repository/api.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel account = AccountModel();
  //List<AccountModel> kq = [];
  bool loading = false;

  getAccount(email, password) async {
    loading = true;
    account = await getAccountByEmail(email, password);
    loading = false;
    notifyListeners();
  }

  getInfoAccount(AccountModel account) async {
    loading = true;
    account = await getAccountByEmail(account.email, account.password);
    loading = false;
  }
}
