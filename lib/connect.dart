// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison, avoid_print, unused_local_variable

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
    } catch (e) {
      return e;
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
      await db!.close();
      if (idauther.isEmpty) {
        // returning 2 if id pass not found in stu or faculty
        ans2 = 2;
      } else {
        //returning 3 if id pass found in faculty
        ans2 = 3;
      }
    }
    return ans2;
  }

  static gettt(int? day, String? dept) async {
    coll = db!.collection('Time_table');
    if (day == 1) {
      var ttgetter = await coll
          .find(where.eq('Day', 'Monday').fields(
            ['Subject_and_time'],
          ).excludeFields(['_id']).and(where.eq('Department', dept)))
          .toList();

      return ttgetter;
    } else if (day == 2) {
      var ttgetter = await coll
          .find(where
              .eq('Day', 'Tuesday')
              .fields(['Subject_and_time']).excludeFields(['_id']).and(
                  where.eq('Department', dept)))
          .toList();
      return ttgetter;
    } else if (day == 3) {
      var ttgetter = await coll
          .find(where
              .eq('Day', 'Wednesday')
              .fields(['Subject_and_time']).excludeFields(['_id']).and(
                  where.eq('Department', dept)))
          .toList();
      return ttgetter;
    } else if (day == 4) {
      var ttgetter = await coll
          .find(where
              .eq('Day', 'Thursday')
              .fields(['Subject_and_time']).excludeFields(['_id']).and(
                  where.eq('Department', dept)))
          .toList();
      return ttgetter;
    } else {
      var ttgetter = await coll
          .find(where
              .eq('Day', 'Friday')
              .fields(['Subject_and_time']).excludeFields(['_id']).and(
                  where.eq('Department', dept)))
          .toList();
      return ttgetter;
    }
  }
}
