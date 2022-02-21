import 'package:flutter/cupertino.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/repository/account_api.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel account = AccountModel();
  //List<AccountModel> kq = [];
  bool loading = false;

  getAccountByAccountId(id) async {
    loading = true;
    account = await getAccountById(id);
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

  update(id, value, type) async {
    var key = _convertType(type);
    loading = true;
    account = await updateAccount(id, key, value);
    getAccountById(id);
    if (account.id != null) {
      DBConfig.instance.updateAccount(id, key, value);
    } else {
      print('Provider error: can\'t get account');
    }

    // print('Provider: ${account.name}');
    loading = false;
    notifyListeners();
  }

  late AccountModel getAccount;
  getaccount() {
    DBConfig.instance.getAccount();
    getAccount = DBConfig.instance.account;
    // notifyListeners();
  }

  String _convertType(String name) {
    switch (name) {
      case 'Họ tên':
        return 'Name';
      case 'Sinh nhật':
        return 'Birthday';
      case 'Địa chỉ':
        return 'Address';
      case 'Số điện thoại':
        return 'Phone';
      case 'Email':
        return 'Email';
      case 'Mật khẩu':
        return 'password';
      default:
        return '';
    }
  }
}
