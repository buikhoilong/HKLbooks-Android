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

  login(email, password) async {
    loading = true;
    account = await loginApp(email, password);
    loading = false;
    notifyListeners();
  }

  register(name, email, phone, password, address) async {
    loading = true;
    account = await registerApp(name, email, phone, password, address);
    loading = false;
  }

  getInfoAccount(AccountModel account) async {
    loading = true;
    account = await getAccountByEmail(account.email, account.password);
    loading = false;
  }

  updateName(name) async {
    loading = true;
    // account = await updateAccount(name, email, phone, password, address);
  }
}
