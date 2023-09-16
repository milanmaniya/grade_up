import 'package:firebase_database/firebase_database.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';

class StudentFirebaseApi {



  static DatabaseReference db = FirebaseDatabase.instance.ref('student');

  static Future<void> setStudentData() async {

  

    String key = db.push().key!;

    for (int i = 0; i < studentPostList.length; i++) {
      await db.child(key).set({
          "image": studentPostList[i].image,
        "subject": studentPostList[i].subject,
        "totalDays": studentPostList[i].totalDays,
        "className": studentPostList[i].className,
        "location": studentPostList[i].location,
        "studentName": studentPostList[i].studentName,
        "message": studentPostList[i].message,
      });
    }
  }
}
