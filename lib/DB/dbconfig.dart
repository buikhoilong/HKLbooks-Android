import 'package:hkl_books/models/account.dart';
import 'package:sqflite/sqflite.dart';

class DBConfig {
  static final DBConfig instance = DBConfig._init();

  static Database? _db;
  DBConfig._init();

  Future<Database?> get db async {
    if (_db != null) {
      // getAccount();
      return _db!;
    }

    return _db = await initDatabase();
  }

  initDatabase() async {
    // io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentDirectory.path, 'cart.db');
    String path = "DB/local.db";
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    // await deleteDatabase(path);

    return db;
  }

  _onCreate(Database db, int version) async {
    // await db.execute("DROP TABLE IF EXISTS cart");

    await db.execute(
        'CREATE TABLE local_accounts (Id TEXT  PRIMARY KEY,  Name TEXT, Birthday NUMERIC, Address TEXT, Phone TEXT, Status INTEGER, Email TEXT, Password TEXT, Role INTEGER, Avatar TEXT, created_at TEXT, updated_at TEXT, deleted_at TEXT)');
  }

  AccountModel account = AccountModel();

  Future<AccountModel> insertAccount(AccountModel account) async {
    var dbClient = await db;
    await dbClient!.insert('local_accounts', account.toJson());
    // print("Insert thành công");
    return account;
  }

  // ignore: non_constant_identifier_names
  Future<AccountModel> updateAccount(Id, key, value) async {
    Map<String, dynamic> row = {
      key: value,
    };
    var dbClient = await db;
    await dbClient!
        .update('local_accounts', row, where: 'Id = ?', whereArgs: [Id]);
    // print("Insert thành công");
    // print(queryResult);
    getAccount();
    print('DBconfig: ${account.name}');
    return account;
  }

  Future<AccountModel> getAccount() async {
    var dbClient = await db;
    final queryResult = await dbClient!.query('local_accounts');

    Map<String, Object?> _data;
    if (queryResult.isEmpty) {
      _data = {'Message': null};
    } else {
      _data = queryResult.first;
    }
    account = AccountModel.fromJson(_data);
    return account;
  }

  Future<AccountModel?> deleteAccount(AccountModel? account) async {
    var dbClient = await db;
    await dbClient!.delete('local_accounts');
    // print("Xóa thành công!");
    // return account;
  }

  // checkLogined() async {
  //   var dbClient = await db;
  //   final queryResult = await dbClient!.query('local_accounts');
  //   print(queryResult.length != 0);

  //   return (queryResult.length != 0);
  // }
}
