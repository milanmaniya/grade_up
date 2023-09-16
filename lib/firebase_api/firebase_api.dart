import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');

  static Future<void> setUserData({
    required String userName,
    required String mobNum,
    required String email,
    required String age,
    required String address,
    required String pass,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'hospName': userName,
      'mobNum': mobNum,
      'email': email,
      'address': address,
      'age': age,
      'pass': pass
    });
  }

  static Future<bool> selectData(String phNumber) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});

    // for the fetching all data from the list
    List<Map> userData = [];
    data.forEach(
      (key, value) {
        userData.add(value);
      },
    );

    // for the fetching ph number value
    for (var element in userData) {
      if (element['mobNum'] == phNumber) {
        return true;
      }
    }
    return false;
  }
}
