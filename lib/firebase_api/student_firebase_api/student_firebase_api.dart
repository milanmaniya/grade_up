import 'package:firebase_database/firebase_database.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';

class StudentFirebaseApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('student');

  static Future<void> setStudentData() async {
    String key = db.push().key!;
    await db.child(key).set(studentPostList);
  }
}
