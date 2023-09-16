import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');

  static Future<void> setUserData({
    required String userName,
    required String mobNum,
    required String email,
    required String age,
    required String gender,
    required String address,
    required String pass,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'userName': userName,
      'mobNum': mobNum,
      'email': email,
      'address': address,
      'age': age,
      'gender': gender,
      'pass': pass
    });
  }

  static Future<List<Map>> selectData() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});

    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    log("$userData");
    return userData;
  }

  static updateData({required String key, required String userName}) {
    db.child(key).update({
      'key': key,
      'userName': userName,
    });
  }

  static Future<void> removeData({required String key}) async {
    await db.child(key).remove();
  }
}
