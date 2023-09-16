import 'package:flutter/material.dart';

class CommonRegController {
  static final TextEditingController _txtuserNameController =
      TextEditingController();
  static final TextEditingController _txtemailController =
      TextEditingController();
  static final TextEditingController _txtPhoneNumberController =
      TextEditingController();
  static final TextEditingController _txtPasswordController =
      TextEditingController();

  static final TextEditingController _txtCPasswordController =
      TextEditingController();
  static final TextEditingController _txtAgeController =
      TextEditingController();
  static final TextEditingController _txtGenderController =
      TextEditingController();

  static final TextEditingController _txtAddressController =
      TextEditingController();

  static GlobalKey<FormState> key = GlobalKey<FormState>();

  static List<TextEditingController> get regControllerList => [
        _txtuserNameController,
        _txtPhoneNumberController,
        _txtemailController,
        _txtAgeController,
        _txtGenderController,
        _txtAddressController,
        _txtPasswordController,
        _txtCPasswordController,
      ];
}
