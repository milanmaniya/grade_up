import 'package:flutter/material.dart';

class TeacherRegController {
  static final TextEditingController _txtTeacherNameController =
      TextEditingController();
  static final TextEditingController _txtemailController =
      TextEditingController();
  static final TextEditingController _txtPhoneNumberController =
      TextEditingController();
  static final TextEditingController _txtAgeController =
      TextEditingController();
  static final TextEditingController _txtGenderController =
      TextEditingController();
  static final TextEditingController _txtExperienceController =
      TextEditingController();
  static final TextEditingController _txtSubjectController =
      TextEditingController();

  static GlobalKey<FormState> key = GlobalKey<FormState>();

  static List<TextEditingController> get regTeacherControllerList => [
        _txtTeacherNameController,
        _txtPhoneNumberController,
        _txtemailController,
        _txtSubjectController,
        _txtAgeController,
        _txtExperienceController,
        _txtGenderController,
      ];
}
