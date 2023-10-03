import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';
import 'package:grade_up/common_widget/common_toast.dart';

class StudentFirebaseApi {
  static setStudentData() {
    for (int i = 0; i < studentPostList.length; i++) {
      FirebaseFirestore.instance
          .collection('Student')
          .doc(i.toString())
          .set(studentPostList[i].toJson())
          .then((value) {
        CommonToast()
            .showMessage(message: 'Student Data inserted successfully...');
      }).onError((error, stackTrace) {
        CommonToast().showMessage(message: error.toString());
      });
    }
  }

  //static DatabaseReference db = FirebaseDatabase.instance.ref('student');

  // static Future<void> setStudentData() async {
  //   for (int i = 0; i < studentPostList.length; i++) {
  //     String key = db.push().key!;
  //     await db.child(key).set(studentPostList[i].toJson());
  //   }
  // }

  // static Future<void> addStudent(StudentPost student) async {
  //   String key = db.push().key!;
  //   await db.child(key).set(student.toJson());
  // }
}
