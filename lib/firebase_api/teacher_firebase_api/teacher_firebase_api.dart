import 'package:firebase_database/firebase_database.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';

class TeacherFirebaseApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('teacher');

  static Future<void> setTeacherData() async {
    for (int i = 0; i < commonTeacherCardList.length; i++) {
      String key = db.push().key!;
      await db.child(key).set(commonTeacherCardList[i].toJson());
    }
  }
}
