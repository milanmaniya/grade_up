import 'package:flutter/material.dart';

class StudentRegController {
  static final TextEditingController _txtStudentNameController =
      TextEditingController();
  static final TextEditingController _txtclassController =
      TextEditingController();
  static final TextEditingController _txtDaysController =
      TextEditingController();
  static final TextEditingController _txtSubjectController =
      TextEditingController();
  static final TextEditingController _txtMessageController =
      TextEditingController();
  static final TextEditingController _txtLocationController =
      TextEditingController();

  static GlobalKey<FormState> key = GlobalKey<FormState>();

  static List<TextEditingController> get regStudentControllerList => [
        _txtStudentNameController,
        _txtclassController,
        _txtDaysController,
        _txtSubjectController,
        _txtMessageController,
        _txtLocationController,
      ];
}
