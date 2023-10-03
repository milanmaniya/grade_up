import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_toast.dart';

class TeacherFirebaseApi {
  static setTeacherProfile() {
    for (int i = 0; i < commonTeacherCardList.length; i++) {
      FirebaseFirestore.instance
          .collection('Teacher')
          .doc(i.toString())
          .set(commonTeacherCardList[i].toJson())
          .then((value) {
        CommonToast()
            .showMessage(message: 'Student Data inserted successfully...');
      }).onError((error, stackTrace) {
        CommonToast().showMessage(message: error.toString());
      });
    }
  }

  // static DatabaseReference db = FirebaseDatabase.instance.ref('teacher');

  // static Future<void> setTeacherData() async {
  //   for (int i = 0; i < commonTeacherCardList.length; i++) {
  //     String key = db.push().key!;
  //     await db.child(key).set(commonTeacherCardList[i].toJson());
  //   }
  // }

  // static Future<void> addTeacher(TeacherCard teacher) async {
  //   String key = db.push().key!;
  //   await db.child(key).set(teacher.toJson());
  // }
}
