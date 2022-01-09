// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison, avoid_print

import 'package:mongo_dart/mongo_dart.dart';
import 'main.dart';

class DBConnection {
  static int ans2 = 2;
  static LoginPage l11 = LoginPage();

  static Db? db;
  static DbCollection coll = db!.collection('Students');
  static connect() async {
    db = await Db.create(
        "mongodb+srv://groupc3:pakistaN1@fih.liy20.mongodb.net/FIH?retryWrites=true&w=majority");

    try {
      await db!.open();
      print('connected');
    } catch (e) {
      print(e);
    }
  }

  static auth(String id, String pass) async {
    var idauther = await coll
        .find(where.eq('email', id).and(where.eq('pass', pass)))
        .toList();

    print(idauther);
    if (idauther.isNotEmpty) {
      print(1);
      ans2 = 1;
    } else if (idauther.isEmpty) {
      print(2);
      ans2 = 2;
    }
    return ans2;
    await db!.close();
  }
}
