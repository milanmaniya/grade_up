import 'package:flutter/material.dart';

class TeacherFavouriteProvider extends ChangeNotifier {
  final List<int> _teacherFavourite = [];

  List<int> get teacherFavourite => _teacherFavourite;

  void toggleFavourite(int index) {
    final isExist = _teacherFavourite.contains(index);

    if (isExist) {
      _teacherFavourite.remove(index);
    } else {
      _teacherFavourite.add(index);
    }
    notifyListeners();
  }

  bool isExit(int index) {
    final isExit = _teacherFavourite.contains(index);
    return isExit;
  }
}
