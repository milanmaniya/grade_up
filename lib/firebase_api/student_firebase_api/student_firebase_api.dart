import 'package:firebase_database/firebase_database.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';

class StudentFirebaseApi {
  static DatabaseReference db = FirebaseDatabase.instance.ref('student');

  static Future<void> setStudentData() async {
    for (int i = 0; i < studentPostList.length; i++) {
      String key = db.push().key!;
      await db.child(key).set(studentPostList[i].toJson());
    }
  }

  static Future<void> addStudent(StudentPost student) async {
    String key = db.push().key!;
    await db.child(key).set(student.toJson());
  }
}
