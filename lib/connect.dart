// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison, avoid_print

import 'package:mongo_dart/mongo_dart.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      Fluttertoast.showToast(
          msg: "Connected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Could not connect to DB",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }

  static auth(String id, String pass) async {
    var idauther = await coll
        .find(where.eq('email', id).and(where.eq('pass', pass)))
        .toList();

    if (idauther.isNotEmpty) {
      //returning 1 if id pass found in stu
      ans2 = 1;
    } else if (idauther.isEmpty) {
      coll = db!.collection('Faculty');
      idauther = await coll
          .find(where.eq('email', id).and(where.eq('pass', pass)))
          .toList();
      if (idauther.isEmpty) {
        // returning 2 if id pass not found in stu or faculty
        ans2 = 2;
      } else {
        //returning 3 if id pass found in faculty
        ans2 = 3;
      }
    }
    return ans2;
    await db!.close();
  }
}
