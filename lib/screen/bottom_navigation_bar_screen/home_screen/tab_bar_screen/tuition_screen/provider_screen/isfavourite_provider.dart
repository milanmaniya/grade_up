import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<int> _courseFavourite = [];

  List<int> get courseFavourite => _courseFavourite;

  void toggleFavourite(int index) {
    final isExist = _courseFavourite.contains(index);

    if (isExist) {
      _courseFavourite.remove(index);
    } else {
      _courseFavourite.add(index);
    }
    notifyListeners();
  }

  bool isExit(int index) {
    final isExit = _courseFavourite.contains(index);
    return isExit;
  }
}
